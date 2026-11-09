# Review of DerivedModuleAlgebra (pull request #1701 at 9b3b370)

**Verdict:** needs changes

This is a full review of the folder at 9b3b370. The folder changed by 200 lines since ee318e5, the head r22 read. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d.

There are three findings, all P3. None blocks.

- R01: the route to the new extension–restriction adjunction headline leaves out the pinned Mathlib theorem it rests on.
- R02: `IsPerfect` is not distinguished from Tau Ceti's pinned predicate of the same name.
- R03: the pull-request description still contradicts the head.

## R01 (P3) — §0.2 names no route or pinned input for `nonempty_derivedExtendRestrictScalarsAdj`

**Location.** README:813–815:

> "Prove `nonempty_derivedExtendRestrictScalarsAdj`: every left derived functor of `complexBaseChange f` is left adjoint to derived restriction ([StacksMA] Lemma 15.61.3, Tag 0GMT, p.149)."

The *Needs:* line at README:828 and the Mathlib supplier row at README:124 are also affected.

**Claim.** The cited source proves Tag 0GMT by a general lemma on adjunctions of derived functors (StacksMA line 6950). Mathlib has that lemma at the pin as `CategoryTheory.Adjunction.derived`, but neither the *Needs:* line nor the supplier row names it.

The route has a second input that no section owns. `Adjunction.derived` needs an adjunction of functors between the categories being localized, here `CochainComplex (ModuleCat R) ℤ`. That means `ModuleCat.extendRestrictScalarsAdj f` lifted termwise to complexes. The pins have this only on another carrier: `TauCeti.DGRightModuleCat.extendRestrictScalarsAdj` works on DG modules over DG algebras.

**Witness.**

- `#check @CategoryTheory.Adjunction.derived` elaborates at the pin (`Mathlib/CategoryTheory/Functor/Derived/Adjunction.lean`:141). Its hypotheses are `G'.IsLeftDerivedFunctor`, `F'.IsRightDerivedFunctor`, and absoluteness of `G' ⋙ F'` and `F' ⋙ G'`.
- Grepping both pinned libraries for an adjunction lifted through `mapHomologicalComplex` finds nothing.
- The DG version is in `TauCeti/Algebra/Homology/DG/Module/Right/Extension/Adjunction.lean`.

**Repair.** In §0.2, after the sentence quoted above, add:

> "Route: Mathlib's `CategoryTheory.Adjunction.derived` (`Mathlib.CategoryTheory.Functor.Derived.Adjunction`), applied to the adjunction of cochain complexes that `ModuleCat.extendRestrictScalarsAdj f` induces termwise, with `W₁`, `W₂` the quasi-isomorphisms; this section constructs that termwise adjunction, the cochain-complex form of Tau Ceti's DG-module `TauCeti.DGRightModuleCat.extendRestrictScalarsAdj`. `(ModuleCat.restrictScalars f).mapDerivedCategory` is a right derived functor of `restrictScalars ⋙ Q` because restriction preserves quasi-isomorphisms. The two absoluteness hypotheses hold because the derived extension is computed on K-flat complexes and restriction is exact."

Then:

- Add `CategoryTheory.Adjunction.derived` and `ModuleCat.extendRestrictScalarsAdj` to the *Needs:* line at README:828.
- Add `CategoryTheory.Adjunction.derived` to the Mathlib row at README:124.

**Test.** `#check @CategoryTheory.Adjunction.derived` and `#check @ModuleCat.extendRestrictScalarsAdj` both elaborate at the pin. The §0.2 Check along `ℤ → F_p` (README:873) is unchanged: both Hom groups are `F_p`.

## R02 (P3) — `IsPerfect` is not distinguished from Tau Ceti's pinned `TauCeti.DerivedCategory.Bounded.perfect`

**Location.** README:2413–2415:

> "Define `DerivedDeRham.IsPerfect A K` by the existence of a bounded complex of finite projective left `A`-modules representing `K ∈ D(A)` … This is the single ordinary-module predicate."

The Lean declaration is at Lean:564.

**Claim.** The pinned Tau Ceti already has a predicate called "perfect" on bounded module derived categories, and it is a different object:

- `TauCeti.DerivedCategory.Bounded.perfect` (`TauCeti/Algebra/Homology/DerivedCategory/Singularity/Basic.lean`:92) is the thick envelope of all projective objects in degree zero.
- `DerivedCategory.Bounded.perfect_iff` (`…/DerivedCategory/Perfect.lean`:192) characterises it as a bounded complex of arbitrary projectives, with no finiteness.

The README never cites it. Neither does the Scope section, though a kept variant must say in one clause how it differs. A consumer that reaches for "perfect" in the pinned library gets the larger class.

**Witness.** Take `C = ModuleCat ℤ` and the free module `⊕_ℕ ℤ` in degree zero.

- It satisfies `projectiveSingle`, so it is Tau Ceti-perfect.
- `IsPerfect ℤ` fails. A bounded complex of finite projective modules over the Noetherian ring `ℤ` has finitely generated `H⁰`.

**Repair.**

1. In §1.E.0 after "This is the single ordinary-module predicate.", and in one clause of Scope and ownership, add:

   > "Tau Ceti's `TauCeti.DerivedCategory.Bounded.perfect` (`TauCeti.Algebra.Homology.DerivedCategory.Singularity.Basic`, characterised by `DerivedCategory.Bounded.perfect_iff`) is the thick closure of all projective modules, without finiteness; `IsPerfect` is the finite-projective notion of [StacksMA] Definition 15.76.1, Tag 0657."

2. Add the witness above as a §1.E.0 Check.

**Test.** For `⊕_ℕ ℤ` in degree zero, Tau Ceti's predicate holds and `IsPerfect ℤ` fails, as computed above.

## R03 (P3) — The pull-request description still says `Suggested.lean` is unchanged

This is r22's R02, which was raised in every round since r15. It is not repaired. No repair report marks it `not actionable in this package`: the board's reports directory for this package holds only review reports, and the head commit message records no such decision.

**Location.** The description's **Summary** (data):

> "README only; `Suggested.lean` is unchanged. The head also replaces main's `Suggested.lean` …"

**Claim.** The first sentence is false, and the Summary contradicts itself.

**Witness.** `git diff --numstat origin/main...HEAD` gives `573 1227` for Lean. Lean now declares 44 names, including the four headlines added at this head.

**Repair.** On GitHub, delete "README only; `Suggested.lean` is unchanged." from the Summary. If the repair round cannot edit descriptions, its repair report should mark this finding `not actionable in this package` and give the reason.

**Test.** After the edit, the Summary agrees with the numstat.

## Previous findings (r22)

- **R01, derived tensor and scalar extension absent from Lean: repaired.**
  - Lean:135 declares `hasLeftDerivedFunctor₂_tensor` and Lean:154 declares `hasLeftDerivedFunctor_extendScalars`. Both match r22's text, except that `[HasDerivedCategory.{w} (ModuleCat S)]` is now an explicit binder.
  - The head also adds two adjunctions, `nonempty_derivedExtendRestrictScalarsAdj` (Lean:169) and `nonempty_derivedTensorHomAdj` (Lean:319).
  - README:46 now reads "whose existence is the headline `DerivedDeRham.hasLeftDerivedFunctor₂_tensor`".
  - §0.2 (README:801–816) and §1.E.0 (README:2429) name the theorems.
  - The docstring's first bullet (Lean:55–71) keeps only the exactness and monoidal laws as not statable. The §1.1.1 bullet is gone; that adjunction is now stated.
- **R02, pull-request description: not repaired.** Raised again as R03.
- **R03, Stacks Chapters 47 and 19 without keys: repaired.**
  - README:2792 and 2794 add `**StacksDual**` and `**StacksInj**`, and README:2819 and 2821 add their links.
  - Locators now read "[StacksInj] Theorem 19.12.6, Tag 079P, p.19" (README:729), "[StacksDual] Lemma 47.7.5, Tag 08Z6, p.10" (README:2675), and "[StacksDual] Proposition 47.7.8, Tag 08Z9, p.11 … Remark 47.7.9, Tag 0EGL, p.11" (README:2709–2710).
  - The board manifest has entries `StacksDual` (locator `08Z9; 08Z6; 08Z1; 0EGL`, certified) and `StacksInj` (locator `079P`, certified).

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Gate.** My run at this head gives `gate DerivedModuleAlgebra: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. All 27 counters are 0. `gate.md` agrees.
- **Dependency check.** Full output:
  ```text
  depcheck: 239 roadmaps, 2335 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line. The roadmap is on main. Its only roadmap supplier, AlgebraicTopology (Stage 6, item 0), is also on main.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty. The folder's `PROGRESS.md`, `STATUS.md` and `metadata.toml` are on main unchanged.
- **Elaboration.** `lake env lean` on Lean exits 0. Its only messages are 33 "declaration uses `sorry`" warnings: r22's 29 plus the four new headlines.
- **Signatures.** I put `#check @…` for all 44 declarations in one scratch file and compared each type with its README statement. The file has no `variable` or `include` line, and every binder is in its own signature, so no binder is lost.
  - `nonempty_derivedTensorHomAdj` keeps `T`, `α`, `hT` and `L`. Its right adjoint is `(TauCeti.derivedHom A (ModuleCat A)).obj (op L)`. `TauCeti.derivedHom` takes `[HasDerivedCategory C]` and `[HasDerivedCategory (ModuleCat R)]`, which here are the same instance, so both sides live in one `DerivedCategory (ModuleCat A)`.
  - `nonempty_derivedExtendRestrictScalarsAdj` keeps `G`, `α`, `hG` and both derived-category instances.
- **Padding probe.** On a scratch copy I replaced each `sorry` with `first | rfl | simp | infer_instance | trivial | decide | aesop | exact ⟨CategoryTheory.Adjunction.derived _ _ _ _ _⟩`. All 33 theorems fail, with errors on 33 distinct lines. Nothing is padding.

### Seeded sample (15 targets) and the new locators, checked against the text

| Target | Locators verified (source line, page) |
| --- | --- |
| 0.5 | StacksDefos 56/127/161/177 (Lemmas 2.1–2.3, Remark 2.4; 08S5, 08S7, 0GPT, 0GPU; pp.2–4). GR 1454–1480 (§§2.5.4–2.5.7, p.30): Baer sum as the addition pushout of the diagonal pullback, at 1473–1474 |
| 0.7 | StacksCt 1146 (Lemma 13.3, 09CG, p.26, the complex 09CD at 1129); 206 (Lemma 4.5, 08QF, p.5); 916/933 (Lemmas 11.2–11.3, 08RA/08RB, p.21) |
| 0.10 | StacksCt 456 (§6, 08QL, p.11); 519 (Lemma 6.2, 08QQ, p.12). Its hypothesis "`B ⊗^L_A A′ = B′`" is the README's Tor independence |
| 0.11 | StacksCt 108 (Lemma 3.4, 08S9, p.3); 779 (8.1, 08QZ, p.17); 827 (8.6, 08SF, p.19). 8.6 with `S = {1}` gives both of the README's localization formulas |
| 0.12 | StacksCt 847 (9.1, 08R5, p.19); 805 (8.4(5) étale, 08R2, p.18); 228 (4.7, 08QH, p.6) |
| 0.13 | StacksCt 1290 (Lemma 14.2, 08SJ, p.29: Koszul-regular, e.g. regular); 1303 (Proposition 14.4, 08SL, p.29), whose proof uses the presentation and the triangle the README describes |
| 0.14 | SAG 62288 (Constr. 25.2.2.2, p.1700); 62365 (25.2.3.1, p.1702); 62398/62405 (25.2.3.2–3, p.1703); 62412–62436 (25.2.3.4, pp.1703–1704). DoldPuppe §4 from 902 (p.227). BL22 10001 (B.1, p.225), 10042 (B.5, p.226) |
| 0.15 | SAG 62262 (Constr. 25.2.2.1, p.1699); 62414 (25.2.3.4(1)). DoldPuppe 994 (4.10, pp.229–230) |
| 0.16 | SAG 62308 (Constr. 25.2.2.3, p.1700); 62327 (Remark 25.2.2.4, p.1701); 62419 (25.2.3.4(3)). DoldPuppe 1023/1031 (4.13, (4.14), p.230) |
| 0.25 | StacksCt 1408 (Lemma 16.1, 08SP, p.31); 1676 (Lemma 21.1, 08UZ, p.37). StacksAlg 11014 (Lemma 10.99.8, 051C, p.233). StacksDefos 56 (08S5, p.2). GR 1685 (Theorem 2.5.32, p.35), 1986–2016 ((3.2.7)–(3.2.10), Cor. 3.2.11, pp.41–42) |
| 1.1 | StacksMA 10946 (89.1, 091D, p.238); 10971 (89.3, 0CQD, p.238); 10983 (89.4, 0CQE, p.239); 11108 (89.10, 091J, p.241); 11124/11133 (89.11–12, 091K/091L, p.242) |
| 1.2 | StacksMA 12005 (93.1, 091P, p.261); 12049 (93.2, 091Q, p.262); 12061 (93.3, 091R, p.262); 12101 (93.4, 091S, p.263); 12115 (93.5, 091T, p.263); with 12125 (93.6, 091U, p.264) and 12163 (93.10, 091V, p.264) from Lean |
| 1.7 | Prisms 406–416 (§1.2, p.11: `I`-complete flatness via `I`-torsion modules and `M ⊗^L A/I`). BMS19 850 (Def. 4.1, p.220); 872/888 (Lemmas 4.4–4.5, pp.220–221) |
| 1.8 | BMS19 895 (Lemma 4.6, p.221); 908 (Lemma 4.7, pp.221–222); 958 (Cor. 4.8, p.223) |
| 1.9 | BMS19 751–765 (Theorem 3.1, p.217; assertion (1) for any `M ∈ D(A)` at 764); 784 (Remark 3.2, p.218); 973 (Remark 4.9, p.223) |
| 0.2 (new) | StacksMA 6918 (Lemma 15.61.1, 06Y6, p.149); 6948 (Lemma 15.61.3, 0GMT, p.149); 6846 (Def. 15.60.13, 064M, p.147); 6781/6824 (15.60.10/12, 06Y4/064L); 6709/6741/6725/6753 (06XZ, 064K, 06Y2, 06Y3, pp.144–145; 06Y3 includes filtered colimits) |
| 1.1.1 (new) | StacksMA 8707/8711/8720/8723 (0A5W, 0A63, 0A64, 0A65, p.189) |
| 0.I.1 (new) | StacksInj 883 (Theorem 19.12.6, 079P, p.19). StacksSites 1605–1606 (§21.19, 07A5, starting p.36) |
| 1.M (new) | StacksDual 379 (08Z1, p.9); 411 (Lemma 47.7.5, 08Z6, p.10); 456 (Prop. 47.7.8, 08Z9, p.11); 470 (Remark 47.7.9, 0EGL, p.11) |

The README flags no locator as unverified. DoldPuppe Satz 1.15 is at 301 (p.209) and Satz 3.31 at 852 (p.225), as §0.3 cites.

### Library declarations opened at the pins

- **Mathlib, new in this head:**
  - `Functor.HasLeftDerivedFunctor₂` and `IsLeftDerivedFunctor₂` (`Derived/LeftDerivedTwo.lean`:48, 59), defined as the uncurried derived functor for `W₁.prod W₂`.
  - `IsLeftDerivedFunctor`, `HasLeftDerivedFunctor` and `totalLeftDerived` (`LeftDerived.lean`:51, 159, 199).
  - `Functor.mapDerivedCategory` (`DerivedCategory/ExactFunctor.lean`:43).
  - `ModuleCat.restrictScalars` preserving finite limits and colimits (`ChangeOfRingsExact.lean`:40, 45).
  - `IsRightDerivedFunctor.commShift` (`RightDerivedCommShift.lean`:71).
- **The docstring's claim about shift-commutation is correct.** No left-derived counterpart of `commShift` exists, and `LeftDerivedTriangulated.lean`:37 assumes `[F'.CommShift ℤ]`. Neither library has a monoidal instance on `DerivedCategory`.
- **No duplicate.** Tau Ceti has no derived tensor: a grep for `HasLeftDerivedFunctor₂`, `leftDerived₂` and `IsLeftDerivedFunctor` returns nothing.
- **Tau Ceti, opened for R02:** `TauCeti.derivedHom` (`DerivedHom.lean`:69), `Singularity/Basic.lean`:77, 92 and `Perfect.lean`:192.

### Cross-roadmap citations, overlaps, ownership

- **Citations.** `citations.md` lists no cross-roadmap citation found nowhere. On main I resolved:
  - EnhancedDerivedSheaves:29, 152, 451–453, which cite §§0.I.1, 0.2, 0.4–0.17, 1.1–1.5 and `DerivedDeRham.derivedTensor`.
  - `DerivedDeRham.derivedTensor` resolves through README:46 to §0.2.
  - `DerivedDeRham.derivedCompletion` resolves to README:2022.
- **Overlaps.** `overlaps.md` shows no other open pull request changing this roadmap. The dropped §1.T.1 and its anchor (StableHomotopyKTheory #1227:86 and others) are mapped at README:34–36.
- **Ownership of the new objects.** I ran `roadmaps grep` over main and all 468 open heads.
  - Nothing else declares `HasLeftDerivedFunctor₂` or a module-level extension–restriction adjunction on `D(R)`.
  - The adjunctions found elsewhere concern other objects:
    - EnhancedDerivedSheaves at heads #1187:623 and #1630:722 (sheaves of rings on a topos);
    - HabiroRings #1425:517 (completed modules);
    - AnalyticStacks #1687:555 (solid analytic rings).

### Headline theorems

**Stated in Lean (33):**

- existence of `⊗^L` and of derived extension of scalars, and the two adjunctions
- second page of the column spectral sequence
- simplicial and bisimplicial Eilenberg–Zilber
- non-additive invariance
- both flat décalages
- exactness of `Rlim`
- the completeness criteria and the reflector
- derived Nakayama
- the four §1.5 comparisons
- the §1.8 amplitude and module results
- perfect closure and base change
- unit reflection and the residue criterion
- Matlis on both sides

**Correctly named as not statable, with the carrier each lacks:**

- the exactness and monoidal laws of `⊗^L`
- cohomological edge maps and the five-term sequence
- the cotangent complex
- `LF`, `L∧ⁿ`, `LSymⁿ` and `LΓⁿ` on `D^(≤0)`
- the Koszul tower
- simplicial-algebra completion
- Čech descent
- compatible models and effectivity

### Adversarial pass

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `hasLeftDerivedFunctor₂_tensor` (Lean:135) | `R=ℤ`, `K=L=F_p`; `R=0`; termwise model | Via `[ℤ --p→ ℤ]`: `H⁰=F_p`, `H⁻¹=F_p`. The termwise `F_p⊗F_p=F_p[0]` loses `H⁻¹`. `D(0)` is zero and a Kan extension exists | True | none |
| `hasLeftDerivedFunctor_extendScalars` (Lean:154) | `ℤ→F_p` on `F_p[0]`; bi-infinite `ℤ/4`, `d=2`, to `F₂` | Derived: `F_p[0]⊕F_p[1]`; termwise: `F_p[0]`. The bi-infinite complex is acyclic, so derived gives 0, while termwise has `H^i=F₂` for all `i` | True | none |
| `nonempty_derivedExtendRestrictScalarsAdj` (Lean:169) | `ℤ→F_p`, `X=F_p`, `Y=F_p[1]`; reversed adjunction; `R→0` | `Hom_(D(F_p))(F_p[0]⊕F_p[1],F_p[1]) = 0⊕F_p = F_p = Ext¹_ℤ(F_p,F_p)`. Reversed: `Hom_(D(ℤ))(F_p,ℤ)=0` against `Hom_(D(F_p))(F_p,F_p)=F_p`. `R→0`: both Hom sets are singletons | True | route (R01) |
| `nonempty_derivedTensorHomAdj` (Lean:319) | `A=ℤ`, `K=L=F_p`, `M=ℤ[2]`; underived tensor; `A=0` | Left: `Ext²(F_p,ℤ)⊕Ext¹(F_p,ℤ) = 0⊕F_p`. Right: `RHom(F_p,ℤ[2])=F_p[1]`, so `Ext¹(F_p,F_p)=F_p`. Underived: `Ext²(F_p,ℤ)=0` | True | none |
| `complexBaseChange` (Lean:145) | `[ℤ --2→ ℤ]⊗F₂`; `f=id` | `[F₂ --0→ F₂]`, so `H⁻¹=H⁰=F₂`. Identity: isomorphic to `𝟭` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:186) | single column; general `(p,k)` | Single column: `(−k,0) ↦ H_0(t ↦ H_k(K.X t)) = H_k(K.X 0)`. The `d` from `(−k−2p,p)` keeps `k` and lowers `p`. The transposed `H_k(H^I_p)` differs on the four-generator Check (README:1041) | True | none |
| `simplicialTensorComparison` (Lean:201) | `x∈X₁`, `y∈Y₁` | `d(s₁x⊗s₀y) = s₀d₀x⊗y − x⊗y + x⊗s₀d₁y`; `d(s₀x⊗s₁y) = x⊗s₀d₀y − x⊗y + s₀d₁x⊗y`. The difference is `∇(dx⊗y − x⊗dy)`; the opposite sign gives its negative | True | none |
| `bisimplicialDiagonalComparison` (Lean:224) | constant `P` | Diagonal and total homology are both `P` in degree 0 and 0 above (Satz 2.15) | True | none |
| `quasiIso_whiskering_of_projective` (Lean:241) | `Γ₀[ℤ --2→ ℤ]→ℤ/2`, `F(V)=V⊗V`; constant `F` | Source `H₁=Tor₁(ℤ/2,ℤ/2)=ℤ/2`, target `0`, so projectivity of `Y` is needed. Constant `F`: `R′` on both sides | True | none |
| `exteriorPower_decalage` (Lean:264) | `N=R`, `n=0,1,2`; `ℤ/2` over `ℤ` | `n=2`: `N₂=R(s₀e∧s₁e)`, `N₃=0`, so the result is `R=Γ²R`. `ℤ/2`: `F₂` against `Γ²_ℤ(ℤ/2)=ℤ/4` | True | none |
| `symmetricPower_decalage` (Lean:282) | `N=R`, `n=2` | `N₂→N₁` is a unit, so the complex is acyclic, which is `∧²R=0`. Signed coinvariants would give `ℤ/2` over `ℤ` | True | none |
| `derivedLimit_isTriangulated` (Lean:304) | constant `ℤ[0]`; levelwise-split negative (README:1899) | The shift iso is `id` on `ℤ[1]`. Negative: a zero boundary would make `⊕k→∏k` onto, but `(1,1,…)` is not in its image | True | none |
| `derivedCompleteness` and the three criteria (Lean:352–376) | `I=0`; `I=A`; `ℤ_p`, `ℚ_p`; `(p)` against `(p²)` | `I=0`: every `M` is complete. `I=A`: `f=1` gives `H^(−n)M=0`. `Hom(ℤ[1/p],ℚ_p)∋1↦1`, so `ℚ_p` is not complete, while `ℤ_p` is. `ℤ[1/p²]=ℤ[1/p]` | True | none |
| `isDerivedComplete_triangle`, `derivedCompleteness_isRightAdjoint` (Lean:380, 389) | `ℤ_p --p→ ℤ_p → F_p`; `I=0`, `I=A` | `F_p` is complete. The left adjoint is `id` at `I=0` and the zero functor at `I=A` | True | none |
| `completeNakayama` (Lean:400) | `ℤ[1/p]`; `m⊂O_ℂp` | `ℤ[1/p]⊗F_p=0`, but `hc` fails. `m` is flat, `m=m²`, `f`-adically complete for every `f≠0` and nonzero, while `m/m²=0`; only `hI` excludes it | True | none |
| §1.5 comparisons (Lean:417–479) | `F_p[0]` via `[ℤ --p→ ℤ]`; `ℤ_p⋉ℚ_p/ℤ_p`; `ℚ_p/ℤ_p` over `ℤ_p`; `[p,1]` | `H⁻¹` tower `F_p` with zero maps, `H⁰=F_p`, so `Rlim=F_p[0]`. Unbounded torsion: ordinary `ℤ_p[0]` against `H⁻¹(Λ)=ℤ_p`. `hfin`: `H⁻¹=ℤ_p` against `0`. `[p,1]`: `I=ℤ`, everything is zero | True | none |
| `IsCompletelyFlatModule` (Lean:496) | `ℤ`, `ℤ_p`, `F_p` over `ℤ`; the model "`M/IM` flat" only | `ℤ` and `ℤ_p` pass. `F_p` has `Tor₁=F_p`. The `M/IM` model admits `F_p` | True | none |
| §1.8 three (Lean:508–546) | `ℤ[1/p]` in degree 1; `∏ℤ/pⁿ`; `ℤ/4`, `ℤ/2` at `p=2` | `ℤ[1/p]`: `P⊗N=0`, `H¹≠0`, excluded by `hc`. `ℤ/4⊗A[2]≅ℤ/2→2ℤ/4` is bijective. For `ℤ/2`, `M/4M` is not `ℤ/4`-flat, since `Tor₁=ℤ/2` | True | none |
| §1.9 (README) | identity; `ℤ_p→ℤ_p²`; `ℤ_p→F_p` | `Tot=M` both times. `Tor₁^(ℤ_p)(F_p,F_p)=F_p≠0`, so the map is not p-completely flat | True | none |
| `IsPerfect`, `IsPseudoCoherent`, closures (Lean:564–599) | `eA⊂k×k`; `⊕_ℕℤ[0]` | `eA` has Euler ranks `(1,0)`, so no bounded free model, but it has a bounded-above free one. `⊕_ℕℤ` is Tau Ceti-perfect and not `IsPerfect`, since `H⁰` is not finitely generated | True | add clause (R02) |
| `isPerfect_baseChange` (Lean:607) | `[ℤ --2→ ℤ]⊗F₂`; `ℤ/2` over `ℤ/4` | `[F₂ --0→ F₂]` is perfect. `H^(−i)=F₂` for all `i≥0`, excluded by `hK` | True | none |
| `ringTowerLimit_jacobson` (Lean:622) | `k[t]/tⁿ⁺¹`; `A₀=0`; `ℤ↪ℚ` | `(1+t)⁻¹=Σ(−t)ⁱ`. At `A₀=0`, `1∈ker`, so `hnil` fails. `ℤ↪ℚ`: `π₀(2)` is a unit and `2` is not, so `hsurj` is needed | True | none |
| `pseudoCoherent_residueCriterion` (Lean:635) | `[k[[t]] --t→ k[[t]]]`; `a>b` | The fibre is `[k --0→ k]`, so `a≤−1` is needed. If `a>b`, every fibre is 0 and `E=0` | True | none |
| `Matlis.biduality_of_finite/_artinian` (Lean:659, 672) | `ℤ_p`, `E=ℚ_p/ℤ_p`; `ℤ_(p)`; `R=ℚ` | `D(ℤ_p)=E` is Artinian and `D(E)=ℤ_p` is finite. Non-complete: `End E=ℤ_p≠ℤ_(p)` (08Z6). For `ℚ`: finite dimension | True | none |
| §0.5 Checks (README:1329, 1349) | `ℤ/4→F₂`, `ℤ/9→F₃` | `Exal_ℤ(F₂,F₂)=Hom((2)/(4),F₂)=F₂`, so the class has order 2. `(3)/(9)≅F₃`, so the class has order 3 | True | none |
| §0.7 Check (README:1371) | `k[x,y]/(x,y)²` | `Rel` is free on `(y,−x,0)` and `(0,y,−x)`. `Rel/TrivRel` has dimension 3. The kernel of the map to `F⊗B` is `k·y r₁`, so `H⁻²≅k` | True | none |
| §§0.10–0.13 Checks | `ℤ→F_p`; `ℤ[X]→ℤ[X^±]`; `k[ε]`; `(p)⊂ℤ`, `k[X]/X²` | `F_p[1]` against `0`. `ℤ[X^±]dX`, with the relative complex 0. `H⁻¹=εB≠0`. `F_p[1]`. `X²↦2X dX`, zero in characteristic 2 | True | none |
| §§0.14–0.16 Checks | `Be`, `ℤe`, `F_p e` | Alternating `∧²=0`; signed coinvariants give `B/2`. `e·e=2γ₂(e)`. `e^p=p!γ_p=0` with `γ_p≠0` | True | none |
| §0.25 Check (README:1754) | `A′=ℤ/4`, `A=B=F₂`, `c=0` | `B′=F₂[ε]` has kernel `F₂ε` and `JB′=0`, so `B′/JB′≠B` and `B′` is not `ℤ/4`-flat | True | none |
| §1.1 Checks (README:1919–1923) | `×p` on `ℤ`; `[ℤ→ℤ/pⁿ⁺¹]` | `lim=0`, `lim¹=ℤ_p/ℤ`. `H⁰(K_n)=pⁿ⁺¹ℤ` is not ML, and `H¹(Rlim)=ℤ_p/ℤ` | True | none |

## Not verifiable

- **NSW (2.1.1), (2.1.2), (2.2.4) and printed pp.99, 105** (README:968–972, 994–996). The cached NSW entry is the authors' landing page only, 41 lines. The StacksHom derivation (Tags 0130/0132/0133, pp.67–69) covers the same claims and was checked in earlier rounds.
- **IllusieCC** (README:1469) is uncertified in the manifest, which settles it.

## Source issues

- **Error** in SAG at Proposition 25.2.3.4(2), p.1703 (with Construction 25.2.2.2, p.1700): the source says the n-th exterior power of a flat module is the quotient of the tensor power by signed permutations; it should be the quotient by tensors with two equal factors, since signed coinvariants of `ℤ⊗ℤ` give `ℤ/2`, not `0`; affects a stated result.
