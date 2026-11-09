# Review of EnhancedDerivedSheaves (pull request #1630 at e3f468d)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/EnhancedDerivedSheaves/` at `e3f468d`. The head is the one r20 read: `changes.md` reports no changed line. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of this folder; `#PR file:N` refers to that pull request's file at its head.

Two findings carry over from r20 because neither has been repaired. Both are about the pull request's description and the order of merges. One new finding (R03) comes from a library sweep: E1.6 restates two theorems that the pinned Tau Ceti already proves.

## Previous findings

- **r20 R01 (P2), `MonoidalCategory.IsInvertible` claimed by two open pull requests: not repaired.**
  - #1891 (EtaleCohomologyFoundations, now at `6217eb9`) still reads at `README:1879`–`1880`: "invertible when tensoring with it is an equivalence (the predicate MonoidalCategory.IsInvertible, built here)".
  - The description of #1630 does not mention #1891.
  - Carried as R01.
- **r20 R02 (P3), the description misstates the change and gives no order against #1330: not repaired.**
  - The description still reads "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."
  - It does not mention #1330.
  - Carried as R02.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Carried from r20 R01 (r19 R01, r18 R02, r17 R01, r16 R01). No repair report marks it `not actionable in this package`.

**Location:** `README:3062`: "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`, for the invertible dualizing objects of étale duality, §F.5): `EtaleCohomologyFoundations`." The definition is at `README:591` and `Suggested.lean:178`.

**Claim:** §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

**Witness:**
- #1891 `README:1879`–`1880` at `6217eb9` says the predicate is "built here".
- The *Needs:* line of that paragraph cites only "EnhancedDerivedSheaves §0.3 (tensor and internal Hom)".
- `roadmaps grep --fixed 'MonoidalCategory.IsInvertible'` finds the name only in #1630 and #1891. Main (`3090489`) has it in neither roadmap.

**Repair:** keep §0.3 as the owner; the folder needs no change. Add to this pull request's description: "#1891 merges after this pull request; before it merges, #1891 `README:1879`–`1880` replaces 'built here' with 'EnhancedDerivedSheaves §0.3' and its *Needs:* line adds `MonoidalCategory.IsInvertible`." After that edit, `roadmaps grep` finds a single owner and one citation.

## R02 (P3) — The description misstates what changes and gives no order against #1330

Carried from r20 R02 (r19 R02, r18 R03, r17 R02 and earlier). No repair report marks it `not actionable in this package`.

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:**
- `git diff --stat origin/main...HEAD` reports `README.md | 1421` and `Suggested.lean | 585 +++-----`.
- `overlaps.md` lists #1330 (`856fe7a`, draft, @tdupu). It changes both files of this folder and conflicts with this head.
- #1187 also touches `Suggested.lean`, but its copy equals main's (`roadmaps show EnhancedDerivedSheaves --pr 1187` against `git show origin/main:…`). It needs no stated order.

**Repair:** in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and every name it drops that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then add one sentence fixing the order, for example: "#1330 is rebased on this pull request after it merges", or "this pull request supersedes #1330, which is closed".

## R03 (P3) — E1.6 restates the Cohen structure theorem and regularity of the completion, which the pinned Tau Ceti proves

**Location:** `README:873`: "**Cohen presentations and completion for the Frobenius criterion** (*completeNoetherianLocal_cohenPresentation*, *frobeniusFlat_completion*, *regularity_of_completion*). A complete Noetherian local ring R of characteristic p has a coefficient field k and a surjection `k⟦x₁, …, x_e⟧ → R`…". These targets are consumed at `README:891` and `README:916`.

**Claim:** the Cohen presentation and "regularity of that completion implies regularity of A" are targets of this roadmap.

**Witness:**
- At Tau Ceti `2fd255d9` (both files confirmed with `git cat-file -e`):
  - `TauCeti.exists_surjective_mvPowerSeries_spanFinrank` (`TauCeti/RingTheory/LocalRing/CoefficientField.lean:164`). A complete local ring that contains a field and has a finitely generated maximal ideal has a coefficient field `s` and a surjection from `MvPowerSeries (Fin 𝔪.spanFinrank) (ResidueField R)` that is `s` on constants.
  - `TauCeti.AdicCompletion.isRegularLocalRing_iff` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean:58`, Stacks 07NY). For a Noetherian local R, the completion is regular if and only if R is.
- A ring of characteristic p contains 𝔽_p, and a Noetherian ring has a finitely generated maximal ideal. So both targets are these declarations. The Tau Ceti docstring (`CoefficientField.lean:51`–`52`) even contains the example of the Check at `README:877`: `k[ε]/(ε²) = k⟦X⟧/(X²)`.

**Repair:**
- Delete *completeNoetherianLocal_cohenPresentation* and *regularity_of_completion* as targets.
- Record the two declarations, with their files, in the "Regular and perfect rings (E1.6)" bullet of "From Tau Ceti" (`README:175`) and in the Tau Ceti boundary of Scope and ownership (`README:20`).
- Keep the paragraph's Checks as Checks on these recorded results, as E1.6 does for Kunz's theorem.
- Keep *frobeniusFlat_completion* as the paragraph's only target; the pins have no Frobenius-flatness statement for completions.
- In the *Needs:* lines at `README:891` and `README:916`, replace the two italic names with `TauCeti.exists_surjective_mvPowerSeries_spanFinrank` and `TauCeti.AdicCompletion.isRegularLocalRing_iff`.

Tested on the Checks at `README:877` and `README:879`:
- `k[ε]/(ε²)` has the Tau Ceti presentation with one variable (`spanFinrank 𝔪 = 1`).
- For `A = 𝔽_p[t]_(t)`, `isRegularLocalRing_iff` gives `𝔽_p⟦t⟧` regular ⇔ A regular.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `e3f468d` and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- I reran `gate … --base origin/main`. It exited 0 with every counter 0 (`statement-hygiene=0`, `sorry-data=0`, `dropped=0`, `stray-files=0`, `outside-folder=0`), and it ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 236 roadmaps, 2290 edges, 0 problem(s)
```

- Every supplier is on main: DGAInfinity, BordismFormalGroups, GeneralizedCohomology, SchemeAndStackFoundations, JacobianChallenge, StableReduction, AdicSpacesPartII, PerfectoidSpaces, DerivedModuleAlgebra, AlgebraicTopology, ProfiniteCohomology and StablePeriodicCurved.

**Elaboration and signatures.**
- `lake env lean Suggested.lean` exits 0 with exactly 10 warnings, all "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279.
- A scratch file with `#check @` for all 17 declarations elaborates. Every elaborated type carries its README hypotheses:
  - `[Category.{v} A] [Abelian A] [IsGrothendieckAbelian.{w} A]` on the four §0.1–0.2 declarations;
  - `[Category C] [MonoidalCategory C]` on the §0.3 pair;
  - `[IsNoetherianRing R]`, `[CharP R p]` and `[Fact p.Prime]` on Kunz's converse;
  - `ringKrullDim P₀ ≤ d`, surjectivity and `PerfectRing R p` on both perfect bounds;
  - `I.FG` on `isAdicComplete_iff_derivedComplete_separated`.
- The 6 "dropped binder" leads of `signatures.md` are false positives, and its docstring "errors" are a parser artefact.
- With `pp.explicit`, `isDerivedComplete_iff_derivedCompleteness` uses `IsGrothendieckAbelian.hasDerivedCategory`, as `README:2676` says.

**Padding probe.**
- Every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | exact?` in a scratch copy. None of the 10 closes.
- `exact?` proposed `locallySmall_max` for `:121`. It fails on `max (max u' v) ?u =?= w`, which is the README's reason that `HasDerivedCategory.standard` lands in `Type (max u' v)`.
- `exact?` proposed `GrothendieckTopology.W.monoidal` for `:148`. It fails on `HasLimitsOfSize.{u+1,u+1}` for `ModuleCat.{u} Λ`, which is the README's reason at `README:500`.
- No declaration restates a definition, mirrors a Check or computes a value.

**Headline coverage.**
- Stated:
  - K-injective resolutions and the derived category of a Grothendieck abelian category;
  - the étale tensor product;
  - invertible objects;
  - Kunz's converse and the two bounds after perfection;
  - the telescope, classical-completeness and weak-Serre comparisons.
- The docstring names the unstatable families by layer (E0/0/E1, E3, E2:towers, E2, E4, E5:*), each with its missing carrier.
- Unstatable for these reasons:
  - the functorial étale K-flat replacement, the derived tensor and the Koszul braiding are data;
  - the reconstruction `Dcomp ≃ lim D(R/Iⁿ)` and h-descent need ∞-categorical limits.
- The Tau Ceti identification of the dg-nerve homotopy category with `DerivedCategory` would be a one-line application of `dgNerveHomotopyCategoryEquiv` under the new instance. It is correctly not restated.

**Library declarations opened at the pins.**
- Mathlib:
  - `IsRegularRing` extends `IsNoetherianRing` (`RingTheory/RegularLocalRing/Defs.lean:93`); `IsRegularLocalRing` (`:52`).
  - `PerfectClosure` (`FieldTheory/PerfectClosure.lean:68`).
  - `ObjectProperty.IsClosedUnderKernels` and `IsClosedUnderCokernels` (`CategoryTheory/ObjectProperty/Kernels.lean:76`, `:123`) are kernels and cokernels of maps between objects in P. `IsClosedUnderExtensions` (`Extensions.lean:42`) and `ContainsZero` (`ContainsZero.lean:38`) match Stacks 02MP.
  - `Skeleton.instMonoid` (`CategoryTheory/Monoidal/Skeleton.lean:60`).
  - The bounded-below Quillen structure (`Algebra/Homology/ModelCategory/Injective.lean`) and `HomologicalComplex.isGrothendieckAbelian` (`Algebra/Homology/GrothendieckAbelian.lean:69`).
  - No unbounded K-injective resolution and no `LocallySmall` localization of a Grothendieck abelian category exist at the pin, so §0.1–0.2 duplicate nothing.
- Tau Ceti:
  - `TauCeti.HasKInjectiveResolutions` (`Algebra/Homology/DerivedCategory/KInjective.lean:92`), with its `ModuleCat` instance (`Algebra/Homology/ModuleCat/KInjective.lean:180`).
  - `TauCeti.IsRegularRing.flat_frobenius` (`RingTheory/RegularLocalRing/Frobenius.lean:85`). This is the forward direction only; there is no converse at the pin.
  - `TauCeti.SheafOfModules.IsInvertible` (`Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean:70`) is local freeness of rank one, a different object from `MonoidalCategory.IsInvertible`.
  - Tau Ceti has no derived-completeness predicate.
  - The two declarations of R03.

**Cross-roadmap citations resolved.**
- `citations.md` lists no unresolved cross-roadmap citation. Its 22 "Lean names found nowhere" are supplier-roadmap names.
- I resolved these on main (`3090489`); the line numbers below are in each supplier's own files:
  - DerivedModuleAlgebra §§0.I.1, 0.K.1, 0.2, 1.1, 1.1.1, 1.2–1.5 (its `README.md:516`–`1808`). `derivedCompleteness` at its `Suggested.lean:904` has the same body as the RHS of our telescope theorem, under its local `moduleDerived`.
  - SchemeAndStackFoundations §§2.17–2.18 (its `README.md:3924`, `:3959`) and `DQCoh.affineEquiv` (its `Suggested.lean:1534`).
  - BordismFormalGroups F6.5 sub-lanes (its `README.md:1546`, `:1823`, `:1944`, `:2005`).
  - PerfectoidSpaces P0.1, P0.2, P0.5, P0.14, P0.15 and P7.16a, plus `Almost.Algebra.IsFiniteEtale` (its `README.md:2061`).
  - AdicSpacesPartII R0.19.10 (its `README.md:8005`), GeneralizedCohomology G2/G3 (`README.md:211`, `:663`), JacobianChallenge Layer C (`README.md:143`) and StableReduction Layer 2 (`README.md:405`).
- At #1701 (`8dcba8a`, named in the description as merging first), DerivedModuleAlgebra's derived tensor and tensor–Hom adjunction take any `HasDerivedCategory` instance. On main they use `moduleDerived`, so the sentence at `README:465` depends on #1701, as the description says.
- This pull request drops 31 names from `Suggested.lean`. Those that other roadmaps cite are all mapped in the table at `README:40`–`47`:
  - `frobenius_flat_of_isRegular`, `isRegularRing_projectiveDimension_le` and `isRegularLocalRing_of_projectiveDimension_residueField`, cited by #857 and #1034;
  - `perfectRing_tor_eq_zero` and the `frobeniusRootIdeal` triple, cited by #1042;
  - `IsReplete.countableProduct_epi`, cited by #1458.
- The other dropped names have no citation in any open head or on main.

**Ownership and overlaps.**
- `roadmaps grep` over all open heads finds `smallEtaleSheafMonoidalCategory`, `smallEtaleTopology_W_isMonoidal`, `IsGrothendieckAbelian.hasDerivedCategory` and `hasKInjectiveResolutions` only in #1630.
- #849 `README:3656` (AbelianSchemesAndArithmeticModuli) applies `Sheaf.monoidalCategory` to its own module-valued sites, not to the small étale site.
- #1901 `README:51` (HigherToposTheory, new, draft) says this roadmap should "take the notions of the Conventions table from here". This roadmap's E0/E5 ownership is already on main, so by the rule for roadmaps on main, #1901 cites this one. No change is requested here.
- `overlaps.md` reports no dropped ids. #1187's copy of this folder equals main; #1330 is R02.

**Seeded sample (§§0.1–0.4), all read in the cache.**

| Locator | Where | Supports |
| --- | --- | --- |
| Stacks Injectives Theorem 19.12.6, tag 079P | line 883, p. 19 | Grothendieck abelian, functorial, termwise mono into injectives, K-injective; this is exactly `hasKInjectiveResolutions` and the "moreover" clause at `README:482` |
| HA Definition 1.3.5.8 / Proposition 1.3.5.9 / Proposition 1.3.5.21 | lines 4739 / 4743 / 4874, pp. 125–129 | dg nerve of fibrant complexes, stability, presentability and t-structure |
| HA §1.3.4 | line 4061 | inverting quasi-isomorphisms (§0.4) |
| HA §1.1.4 | line 1309 | exactness of comparisons, Proposition 1.1.4.1; the fibre formula itself is supported by Stacks Definition 13.34.1 |
| HA Proposition 4.1.7.4 / Example 4.1.7.6 | lines 18583 / 18605, pp. 486 / 487 | monoidal localization |
| HA Theorem 7.1.2.13 | line 46530, p. 1212 | symmetric monoidal `Mod_R ≃ D(A)` for commutative R |
| HA Remark 7.1.1.16 | line 46277, p. 1206 | discrete R, underlying equivalence only |
| Stacks Modules on Sites §18.26 03EK; Lemma 18.26.1 0GMW | p. 34 | `F#⊗G# = (F⊗_p G)#` |
| Stacks Modules on Sites §18.27 04TT; Lemma 18.27.1 03EM; Lemma 18.27.7 03EP | p. 35; p. 37 | internal Hom and colimits |
| Stacks Cohomology on Sites §21.17 Lemma 21.17.11, tag 06YS | line 1342 | K-flat resolution with flat terms on any ringed site |
| Stacks Cohomology on Sites §§21.18, 21.19, 21.35 | lines 1447, 1605, 3668 | derived pullback, unbounded complexes, internal Hom in the derived category |
| Stacks Derived Categories §13.34, tag 08TB | line 5254, p. 105 | derived limits |
| More on Algebra 07KW / 07KY / 091D / 091V / 0920 / 0G1U / 0923 | Lemmas 15.88.1, 15.88.10, 15.89.1, 15.93.10, 15.93.18, 15.93.20, 15.95.2 | numbers and tags agree |
| More on Algebra 091P / 091S / 091T / 091U | Lemma 15.93.1, Definition 15.93.4, Proposition 15.93.5 (p. 263), Lemma 15.93.6 (p. 264) | 091P is per element f, for any ring |
| BS-proet Definition 3.4.1 / Proposition 3.4.2 / Lemmas 3.4.6–3.4.9 | p. 21 | completeness on every slice and every local section |
| BS-proet Lemma 3.4.12 / Lemma 3.4.13 | pp. 22–23 | local generators; classical ⇒ derived |
| BS17 Proposition 11.31, Remark 11.33 with footnotes 24–25, Corollary 11.35 | pp. 48–50 | §11.4 fixes k as the perfection of a regular `𝔽_p`-algebra of finite Krull dimension (line 2233), so the generality of `perfect_torDimension_le_two_mul_dim` is the source's |

**Adversarial computations (this head).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`:101`) | `ModuleCat.{u} R`; étale sheaves (`IsGrothendieckAbelian.{u}`, Hom in `Type (u+1)`); acyclic K | 079P gives `K → I`, termwise mono, K-injective; the existing Tau Ceti `ModuleCat` instance is Prop-valued, so there is no diamond; acyclic K has `I ≃ 0` in `D` | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | étale sheaves, `v = u+1`, `w = u` | Mathlib gives only `LocallySmall.{max u' v}` (probe error `max (max u' v) ?u =?= w`); the claim needs `Type u`, which K-injective Hom-up-to-homotopy gives from `LocallySmall.{w} A` | Pass |
| 3 | §0.1 instance Check (`README:476`) | `ModuleCat.{u} ℤ`, p prime | `Q(ℤ/p)⟦−1⟧ ⟶ Q(ℤ)` = `Ext¹(ℤ/p,ℤ) = ℤ/p` in `Type u` against `Type (u+1)`; `⟦1⟧` gives `Ext⁻¹ = 0` on both sides | Pass |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `X = Spec k ⊔ Spec k`, `F = G = Λ_X` | presheaf `X`-sections `Λ²⊗Λ² = Λ⁴`; sheaf tensor `Λ²`; `W.monoidal` rejected for `HasLimitsOfSize.{u+1}` | Pass |
| 5 | Koszul Check (`README:510`) | `K = [ℤ →id ℤ]` in degrees 0, 1 | `d(e₀₁) = e₁₁`, `d(e₁₀) = −e₁₁`; unsigned τ: `dτ(e₀₁) = −e₁₁ ≠ τd(e₀₁) = e₁₁`; Koszul τ(e₁₁) = −e₁₁ makes both `−e₁₁` | Pass |
| 6 | `P((ℤ/2)_X)` over `ℤ/4` (`README:523`) | periodic resolution `⋯ →2 ℤ/4 →2 ℤ/4` | `Tor_i^{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` for all `i ≥ 0`; unbounded below | Pass |
| 7 | §0.1 cone Checks (`README:460`) | A in degree 0 | `cone(0)`: `H⁻¹ = A`, `H⁰ = A`; `cone(id)` acyclic | Pass |
| 8 | §0.3 tower Check (`README:553`) | `K_i = [ℤ → ℤ/ℓ^{i+1}]` | `H⁰ = ℓ^{i+1}ℤ`, not ML; `lim¹ = ℤ_ℓ/ℤ`; `Rlim K = [ℤ → ℤ_ℓ]` with `H¹ = ℤ_ℓ/ℤ`; `H¹(K_i) = 0` | Pass |
| 9 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | `𝟙`; `ℤ/2` in `ModuleCat ℤ`; `Λ_X[1]` | `𝟙`: both sides true; `ℤ/2`: `tensorLeft` kills `ℚ ≠ 0`, and `ℤ/2 ⊗ N` is 2-torsion so `≠ ℤ`, so both sides false; `ε(Λ_X[1]) = (−1)^{1·1} = −1 ≠ 1` iff `2 ≠ 0` in Λ and `X ≠ ∅` | Pass |
| 10 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]`; `𝔽_p[ε]/(ε²)`; zero ring | free basis `1,…,t^{p−1}`, regular; `ε ↦ 0`, not flat, not regular; `CharP 0 p` forces `p ∣ 1`, excluded | Pass |
| 11 | `perfect_projectiveDimension_le` (`:207`) | `P₀ = k` perfect, d = 0; `P₀ = 𝔽_p[t]`, `R = 𝔽_p` | bound 1 and 2 against true value 0; route: `0 → ⊕F_n → ⊕F_n → M → 0` and `Tor_i^P(M,R) = 0` | Pass |
| 12 | `perfect_torDimension_le_two_mul_dim` (`:219`) | `R = (k[x,y]/(xy))_perf`, d = 1; `R = 𝔽_p[t^{1/p^∞}]`, `J_t` | `0 → J → R →x R → R/(x)`, J flat; `Tor₂(R/(x),R/(y)) = yR/yJ ≅ k ≠ 0` (degree 2d); `Tor₃ = 0` (2d+1); `Tor₁(R/J_t,R/(t)) = tR/tJ_t ≅ 𝔽_p` | Pass |
| 13 | `isDerivedComplete_iff_derivedCompleteness` (`:248`) | `f = 0`; f a unit; ℤ with (p); `ℤ[x₁,…]` with `I = (x₁,…)` | `f = 0`: identity bijective, and `R[1/0] = 0` makes Hom subsingleton, so both true; f a unit: kernel `{f^{−n}x₀} ≅ M` and `Hom(R[0],M[0]) = M`, so both iff `M = 0`; ℤ: coker `= ℤ_p/ℤ = Ext¹(ℤ[1/p],ℤ) ≠ 0`, so both false; `R/I = ℤ` both true, R both false (`y₀ ≡ 1+x₁+⋯` mod `x₁^k` for all k is impossible) | Pass |
| 14 | `isAdicComplete_iff_derivedComplete_separated` (`:262`) | `I = ⊤`; `I = 0`; ℤ with (p); `M = coker ψ` (`README:2807`) | ⊤: both iff `M = 0`; 0: both true; ℤ: separated but not complete, both false; ψ: `ψ(e_k) = −e₀ + pᵏe_k` puts `ē₀ ∈ ⋂pᵏM`, while `ē₀ ≠ 0`, so derived complete, not separated, both false | Pass |
| 15 | `derivedCompleteModules_weakSerre` (`:279`) | `ℤ ⊂ ℤ₂`; p on `ℤ_p`; `0→ℤ→ℤ_p→ℤ_p/ℤ→0`; `I = R`, `I = 0` | submodule ℤ not complete; ker 0, coker `𝔽_p` complete; p bijective on `ℤ_p/ℤ ≠ 0`, so the ends are not complete; R: only 0 (kernel = constants); 0: all | Pass |
| 16 | E4.1 Check (`README:2681`) | `ℤ[1/p][−1]` | `T = ℤ[1/p][−1] ≠ 0`; `π_i Map(ℤ[1/p], ℤ[1/p][−1]) = Ext^{−1−i} = 0` | Pass |
| 17 | E2.5 Check (`README:2376`) | `C_p`, `ℤ[C_p] → ℤ` | invariants `ℤ·N ↦ p`, image `pℤ` | Pass |
| 18 | E1.8 Check (`README:952`) | `Spec ℤ`, `⊕_ℕ ℤ[0]` | quasicoherent; not perfect (cohomology not finitely generated) | Pass |
| 19 | E1.6 Cohen and completion targets (`README:873`) | Tau Ceti pin | `exists_surjective_mvPowerSeries_spanFinrank`, `AdicCompletion.isRegularLocalRing_iff` | R03 |
| 20 | Ownership of `MonoidalCategory.IsInvertible` | `README:3062`; #1891 `README:1879` | "single owner" against "built here" | R01 |

Rows AE–AH of r20, on the E1.8 and DMA.1 shift Checks, concern text this head leaves unchanged and were not recomputed.

## Not verifiable

- HTT, Liu–Zheng, Nikolaus–Scholze, Mathew, ECD, SAG, Fargues–Scholze, Ramzi, Efimov and Robalo are cited only outside §§0.1–0.4 and are not in the source cache. Their locators were not re-read in this round.
- To read §0.2–0.4, the three Stacks chapters Cohomology on Sites, Modules on Sites and Derived Categories were fetched through the sources service into a scratch copy of the manifest. The board manifest was not edited, and nothing was missing.

## Source issues

- none
