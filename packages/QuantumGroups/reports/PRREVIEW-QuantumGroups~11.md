# Review of QuantumGroups (pull request #1705 at 0d7cbcc)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 27 changed lines of `TauCetiRoadmap/QuantumGroups/README.md` since `c5e5bfa`, the head review ~9 read. `Suggested.lean` is unchanged, and so is every file outside the folder. Review ~9's R02, R03 and R04 are repaired, and the repairs introduce no new problem. One P3 finding remains: R01, carried. Nothing blocks. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 13 `sorry` warnings.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Other roadmaps are read on main (`b0fe353`; their folders are unchanged at `8d9e0a0`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P3) — Two open revisions of this folder disagree on ownership and still have no stated order, and the description describes a head that does not exist

**Location:** the pull request's title ("construct the ribbon category RepUqg") and its description ("Add Q9 to build `RepUqg`"). Also `README.md:25`–`:28`: "Layer 0 owns the free-module coaction legs built on these, elementary C*-categories with standard conjugates and the unitary Temperley–Lieb category".

**Claim:** this pull request is the only open revision of QuantumGroups, and its title and description describe its head.

**Witness:** #1649 is open at `21777da` and conflicts in both files (overlaps.md). Its README hands Layer 0 to CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras (`:34`–`:35`, `:43`–`:44`) and states Layer 8 on native `TauCeti.UqSl2` (`:48`–`:56`). This head has no Q9, `RepUqg` or ribbon structure.

**Repair:** in the description, state which revision prevails and the Layer 0 ownership it carries. Then retitle and redescribe the pull request to match this head: Layers 0–8 and the 13 `Suggested.lean` headlines. No file of the folder changes.

- Option one: this pull request supersedes #1649, which is closed.
- Option two: #1649 merges first and this one is rebased onto it.

If §§0.2–0.3 stay here, the two later roadmaps must cite QuantumGroups §§0.2–0.3 rather than own the same objects:

- CategoricalOperatorAlgebras, merge order line 227: `README.md:45` at #888 (`2b38621`) says "have their single home here; QuantumGroups …".
- TemperleyLiebOperatorAlgebras, line 243: `README.md:137` at #867 (`7cf3fee`) says "QuantumGroups consumes Layers 1–3".

Tested: with this head's README the dependency check prints `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`.

Carried from review ~9 R01 (review ~7 R03, review ~6 R06). This head's commit addresses R02–R04 only. No repair report marks R01 as not actionable.

## Previous findings

- R01 — not repaired: the title is still "QuantumGroups: construct the ribbon category RepUqg" and the description still says "Add Q9". #1649 is still open (now at `21777da`) and conflicting. Carried as R01 above.
- R02 — repaired: `:193`–`:197` now read "for `ι₂(a)=1⊗a` it is `T_13` … Since `ι₂=σ∘ι₁` … the composition law gives `T_13=(T_12)_σ`". `:198`–`:199` call W "a σ-semilinear isometry … and not a unitary". `:493`–`:494` read "U_13 is U⊗_(ι₂)1 … equals the leg (U_12)_σ".
- R03 — repaired: §0.1's *Needs:* (`:218`) cites "Kustermans–Vaes, Notations and conventions, p.840, … for leg numbering". §1.1 cites "Definition 2.1, p.853" at `:372` and in its *Needs:* (`:407`). The work is in the References at `:1662`, with its Numdam link.
- R04 — repaired: `:87` now reads "H2: adjointable operators `L_A(E,F)` with composition, adjoints and `‖T*T‖=‖T‖²` … §0.2 builds the Hilbert-module C*-category from these".

## Verified sound

**Scope, gate and build.**

- The head is `0d7cbcce3c83c63ec654d693cc292a0e3d99b59e` and the worktree is clean.
- `git diff --stat c5e5bfa HEAD` touches only `TauCetiRoadmap/QuantumGroups/README.md` (18+, 9−). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- I re-ran the gate. Every check is 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder` …), ending `OK`. The worker's gate also has `build=0`.
- `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0. It prints exactly 13 `declaration uses sorry` warnings (lines 109, 140, 150, 158, 225, 243, 253, 260, 268, 280, 301, 324, 335) and nothing else.
- The added text has no LaTeX delimiter, process word or pull-request number.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

**The changed passages, checked.**

- §0.1, `:193`–`:204`:
  - The composition law `(T_φ)_ψ=T_(ψ∘φ)` (`:191`) with φ=ι₁ and ψ=σ gives `T_(ι₂)=(T_12)_σ`.
  - W is well defined and isometric on the completion, because σ is an isometric automorphism.
  - `WTW` is right-linear (`WTW(yc)=WTW(y)σ²(c)`) with adjoint `WT*W`.
  - Conjugation preserves `K_B(E)` (`Wθ_(x,y)W=θ_(Wx,Wy)`), so it is strictly continuous.
  - Elementary operators `k⊗c` with k compact are strictly dense, on bounded sets, in `L_B(H⊗B)≅𝓜(ℂ, K(H)⊗min B)` (HilbertModules H2, approximate unit). So "both maps … send `S⊗c` to `S⊗σ(c)`" determines them.
- Check `:216`: computed in the table.
- §0.1 *Needs:* `:218`: `kustermansvaes` lines 174–183 (printed p.840, page marker at 161–162) give the unique strictly continuous extension of a strict map, with nondegenerate star homomorphisms strict. Lines 193–197 define `x_13=θ(x)` with `θ(a⊗c)=a⊗1⊗c`. That is `T_(ι₂)` for `T∈𝓜(K(H)⊗A)`, with K(H) first. Line 168: all tensor products are minimal.
- §1.1, `:371`–`:372` and `:407`: `kustermansvaes` lines 743–746 (printed p.853, marker at 738–739) define a bi-C*-algebra as a nondegenerate `Δ:A→M(A⊗A)` with `(Δ⊗ι)Δ=(ι⊗Δ)Δ`. §1.1 constructs exactly these (nondegeneracy from C1.CommutativeMultiplierMorphisms, coassociativity by evaluation). Line 742 notes that the term is the paper's own, and `:407` defines it in place.
- §2.1, `:492`–`:494`: consistent with §0.1 and with Check `:214`.
- Supplier row `:87` against HilbertModules on main:
  - `:188` (composition), `:190` (`‖T*‖=‖T‖`, `‖T*T‖=‖T‖²`), `:209` (`K_A(H⊗A)≅K(H)⊗min A`) and `:213` (`L_A(H⊗A)≅M(K(H)⊗min A)`, strict topology on bounded sets).
  - H2 (`:179`–`:261`) states no category, and §0.2 builds it (`README.md:228`, *Needs:* `:268` "HilbertModules H2 for the module-category example").
- CStarAlgebras C5.1 on main (`:1112`; "associativity, flip" at `:1122`) supplies the flip σ cited at `:196` and `:218`.
- The References entry `:1662` matches the manifest's `kustermansvaes` (Numdam URL, certified, sha256 `cf8b6b17…`).

**Signatures and the padding probe.** `Suggested.lean` is unchanged since `c5e5bfa`, so review ~9's `#check @name` comparison and its padding probe (all 13 one-tactic attempts fail) still apply.

- The signature file's 26 elaborated types are unchanged.
- Its lead `[StarModule ℂ A]` on `AlgebraicHaar` is unused by the fields, as review ~9 found.
- Its entry "`on` (structure, line 60)" is the word "structure" in the module docstring (`Suggested.lean:59`–`:60`), not a declaration.

**Headline coverage.** Unchanged from review ~9: `schur_orthogonality`, `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive` and the nine Layer 8 theorems. The others are named in the docstring, with the carrier each lacks at this branch's pin.

**Adversarial pass.** The first eight rows are new: they cover the statements the diff changes. The remaining rows are carried from review ~9 (statements untouched). Throughout, q = 1/2 unless stated, u is the sign character of C₂, and σ is the flip.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `T_13=(T_12)_σ` (`:194`–`:197`) | H=ℂ, A=C(C₂), T=u; H=ℂ², A=M₂, T=E₁₂⊗a | `T_(ι₂)=1⊗u`, `(T_12)_σ=σ(u⊗1)=1⊗u`; `(E₁₂⊗a⊗1)_σ=E₁₂⊗1⊗a`, K–V's `x_13` (`kustermansvaes` 194–196) | pass | none |
| §0.1 W σ-semilinear isometry (`:197`–`:199`) | y=ξ⊗(a⊗b), c=a′⊗b′; H=ℂ, y=u⊗1, z=1⊗1 | `W(yc)=ξ⊗(bb′⊗aa′)=W(y)σ(c)`; `⟨Wy,Wz⟩=(1⊗u)*(1⊗1)=1⊗u=σ(u⊗1)=σ(⟨y,z⟩)`; `‖Wy‖²=‖σ⟨y,y⟩‖=‖y‖²` | pass | none |
| §0.1 `(T_12)_σ=WT_12W` (`:199`–`:201`) | S⊗c on ξ⊗x; H=ℂ, c=x=u⊗1 | `W(S⊗c)W(ξ⊗x)=Sξ⊗σ(c)x`; `W((u⊗1)(1⊗u))=u⊗u=(1⊗u)(u⊗1)` | pass | none |
| Check `:216` | H=ℂ, A=C(C₂), at the point (s,e) | `σ(u⊗1)=1⊗u`; `W((1⊗1)(u⊗1))=1⊗u` takes the value 1 at (s,e), while `W(1⊗1)(u⊗1)=u⊗1` takes −1: not right-linear | pass | none |
| §1.1 bi-C*-algebra (`:371`–`:372`, `:407`) | trivial group; ℤ; S₃ with g=k=(12), h=(23); ℝ | Trivial group: `(ℂ,id)`. ℤ: `Δ(1[k])·1[(m,n)]=1[(m,n)]` for m+n=k, so `[Δ(A)(A⊗A)]=C₀(ℤ²)`. S₃: `(gh)k=(123)(12)=(13)=(12)(132)=g(hk)`. ℝ: `Δe^(−x²)∈C_b∖C₀`, landing in `𝓜(A⊗A)` as Def 2.1 allows | pass | none |
| §2.1 `U_13=U⊗_(ι₂)1=(U_12)_σ` (`:492`–`:494`) | u, H=ℂ | `1⊗u=σ(u⊗1)`; `U_12U_13=u⊗u=Δ(u)` (Check `:214`) | pass | none |
| Row `:87` (H2) | HilbertModules main `:188`–`:213` | composition, adjoints, `‖T*T‖=‖T‖²` and both identifications are present; no category | pass | none |
| §0.1 locator p.840 (`:218`) | `kustermansvaes` 174–183, 193–197 | strict extension unique on bounded sets; `θ(a⊗c)=a⊗1⊗c` | pass | none |
| §0.1 unitary `(H⊗A)⊗_φB≅H⊗B` (~9) | H=ℂ, A=B=C(C₂), φ=id, a=a′=u | `u*u=1` on both sides | pass | none |
| §0.1 legs along φ (~9) | φ=ε, T=1[s]; φ=ι₁ | `T_ε=0` while ‖T‖=1; `‖1[s]⊗1‖=1` | pass | none |
| §0.1 Check `:214` (~9) | u | `Δ(u)=u⊗u=(u⊗1)(1⊗u)`; ι₂ twice gives `1⊗u²=1` | pass | none |
| §0.2 C*-identity (~9) | T=diag(2,1) | `‖T†T‖=4=‖T‖²`; Hilbert–Schmidt `√17≠5` | pass | none |
| §0.2 rescaled cup (~9) | (2R, R̄/2) on ℂ² | squared norms 8 and 1/2; product `√8·√(1/2)=2` minimal | pass | none |
| §0.2 τ=−ε (~9) | SU(2) fundamental | τ=1, ε=−1; `J²=−1` on ℂ² | pass | none |
| §0.3 cup and projection (~9) | d=5/2 | `tr_2(p)=4/25`, `tr_2(1−p)=21/25` | pass | none |
| §0.3 truncated fusion (~9) | m=3; m=4 | `1⊗1=0`; `1⊗1=0⊕2`, `[4]=d³−2d=0` | pass | none |
| §0.3 sign comparison (~9) | δ=−d | `(−e)²=d(−e)`; normalised trace `−1/d` both sides | pass | none |
| §1.1 `C₀(X,C₀(Y))≅C₀(X×Y)` (~9) | ℝ; ℤ; X=∅ | `e^(−x²−y²)` in both; `e^(−(x−y)²)` and `1[m+n=0]` in neither; `0=0` | pass | none |
| §1.1 coproduct and inverse maps (~9) | S₃; ℤ | Δf=1 vs 0 on swapped arguments; `r₊(1[1]⊗1[−1])=1[1]`, `r₋=1[−1]` | pass | none |
| §1.2 cancellation, Haar (~9) | monoid {1,0}; C(C₂) | span dimension 3<4; `h(1[e])=1/2` vs evaluation 1 | pass | none |
| §2.1 tensor convention (~9) | `U_13V_23` | entries `u_ij v_kl`; sign tensor square 1 vs direct-sum value −2 | pass | none |
| §2.2 unitarisation (~9) | U(s)=[[1,2],[0,−1]] | `U²=I`; `T=[[1,1],[1,3]]`, `U*TU=T` | pass | none |
| `schur_orthogonality` (~9) | SU_(1/2)(2); ι empty | `h(a*a)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; H=0 vacuous, no 0/0 | pass | none |
| `compactType_iff` (~9) | ℂ; ℂ[C₂]; zero ring; ℂ[x] | both sides agree; zero ring excluded by `Nontrivial` (h(1)=0) | pass | none |
| `haar_modular_automorphism` (~9) | SU_(1/2)(2); ℂ[S₃] | θ(a)=4a: `h(a*θ(a))=4/5=h(aa*)`; θ=id | pass | none |
| `haar_trace_iff_antipode_involutive` (~9) | ℂ[S₃]; SU_(1/2)(2) | both true; `1/5≠4/5` and `S²(c)=c/4≠c`, both false | pass | none |
| §5.1 relations ⇔ unitarity (~9) | q=1/2, a=0, c=1 | `1/4≠1`; `S²(c)=c/4` | pass | none |
| §5.2 cup and bounds (~9) | F=[[0,1],[−2,0]] | `FF̄=−2I`; `‖E‖²=5≥n|c|=4` | pass | none |
| §6.1 reconstruction (~9) | Rep(S₃) | 6 coefficients vs 4 diagonal | pass | none |
| §7.1 Haar and coamenability (~9) | q=1/2; q=±1 | `h(c*c)=4/5`, `h((c*c)²)=16/21`; `∫t=1/2`, `∫t²=1/3` | pass | none |
| §7.2 dimensions and loops (~9) | n=2, d=5/2; n=3 | intrinsic dimensions 1, 5/2, 21/4, 85/8; ε(χ)=3∉[−2,2] | pass | none |
| `quantumInteger` (~9) | q=1/2; q=1 | [2]=5/2, [−2]=−5/2; q=1: 0/0=0 vs 2 | pass | none |
| `quantumSL2Comul_exists` (~9) | generic; q=0 | `[ΔE,ΔF]=Δ((K−K⁻¹)/(q−q⁻¹))`; `hq` unused (note) | pass | none |
| `quantumSL2PBW_exists` (~9) | a=b=1 | `KF=4FK=q^(−2ab)FK` | pass | none |
| `quantumSL2_center` (~9) | L_m^ε | Casimir scalars 10/9, 17/9, 65/18 and their negatives, all distinct | pass | none |
| `quantumSL2_finite_semisimple` (~9) | L₀⁻⊕L₁⁺ | Casimir blocks −10/9 and 17/9 | pass | none |
| `quantumSL2_simple_classification` (~9) | L₁⁻; L₂⁺ | `EF−FE=diag(−1,1)`; 5/2, 0, −5/2 = `[2−2j]` | pass | none |
| `quantumSL2_exists_ladderAction` (~9) | m=0, ε=−1; m=1 | K=−1, E=F=0; `Ke₀=e₀/2` | pass | none |
| `quantumSL2_locallyFinite_iff` / `_semisimple` (~9) | L₀⁻; Verma M(1); 0 | true/true; false/false; true/true; M(1) excluded by `hV` | pass | none |
| §§8.5–8.7 (~9) | m=n=j=1; m=1, 2 | `ΔE(v₀⊗w₁−½v₁⊗w₀)=0`; `E*=2F`; `[E,F]=diag(2,0,−2)` | pass | none |

**Cross-roadmap citations resolved this round:**

- HilbertModules H2, `:188`, `:190`, `:209`, `:213`.
- CStarAlgebras C5.1, `:1112` and `:1122`.
- #1649 at `21777da`, `:34`–`:56`.
- CategoricalOperatorAlgebras #888, `:45` and `:2057`.
- TemperleyLiebOperatorAlgebras #867, `:137` and `:1777`.
- Merge order: CategoricalOperatorAlgebras at line 227, TemperleyLiebOperatorAlgebras at 243.

overlaps.md lists no dropped or open-revision-only id. `roadmaps resolve` finds no unresolved citation or name.

**Seeded sample.**

- 1.1, the only sampled target in the changed passages, is verified against Kustermans–Vaes p.840 and Definition 2.1 at p.853 (above).
- The other sampled targets (§§3.2, 3.4, 4.1, 4.2, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 8.1, 8.3, 8.6, 8.7) are untouched since `c5e5bfa`. Review ~9 verified §§4.1, 5.1, 5.2, 6.1, 7.2, 8.6 and 8.7 at their locators.

**Remark (untouched text, as on main; no change requested in this round):** this branch's `lake-manifest.json` pins Tau Ceti `358314d`, which has no `TauCeti/QuantumGroups/`. Main pins `2fd255d`, where `QuantumGroups/UqSl2/` provides:

- `TauCeti.UqSl2` (`Basic.lean:86`);
- `pbwBasis` (`PBW.lean:184`);
- `center_eq_adjoin_casimir` (`Center.lean:129`);
- `isSemisimpleModule_of_finiteDimensional` (`CompleteReducibility.lean:300`);
- `existsUnique_linearEquiv_ladderModule` (`SimpleClassification.lean:62`);
- `isSemisimpleModule_of_isLocallyFiniteModule` (`LocallyFinite.lean:63`).

`Suggested.lean`'s Layer 8 stand-in `QuantumSL2` restates these, and #1649 already uses the native carrier.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): the manifest settles it as `uncertified` (paywalled), so it is cited by locator only. Unchanged from review ~9.
- Lean was not run at main's Tau Ceti pin `2fd255d`: the brief's pins are this branch's manifest. The remark above reads the native signatures as source files only.
- Ownership against open pull requests not reachable by `roadmaps grep` was not checked.

## Source issues

- none
