# Review of EllAdicHomotopyTypesAndWeights (pull request #1644 at 0f96b76)

**Verdict:** needs changes

Incremental re-review of the 44 lines changed since 9bbc066 (33 README lines in the scope paragraph, the Tau Ceti, DerivedModuleAlgebra and EtaleCohomologyFoundations supplier contracts, §3.3 and the Layer 3 dependencies; 11 lines of `Suggested.lean`, the module header and one docstring bullet). The mathematics of the new §3.3 derived ℓ-adic cochain complex is sound and every new citation resolves at the pins and on main. The single finding is the unrepaired manifest entry carried from the previous report; it needs no change to the README or the Lean file.

## R01 (P3) — The Dugger–Isaksen reference is still absent from the source manifest

**Location:** `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:1109`, “Daniel Dugger and Daniel C. Isaksen, Topological hypercovers and A¹-realizations … Theorem 1.2, p. 2”, cited at line 111 and line 572; `packages/EllAdicHomotopyTypesAndWeights/sources.toml`.

**Claim:** The README's References section and two targets cite the work under the key `dugger-isaksen`, but the package manifest records nine keys (weil-II, sullivan, morgan, morgan-correction, dgms, poids, hodge-III, sga5, miller) and no entry for it, by key, title, author or arXiv identifier. The rule that every cited work is recorded in the manifest is not met. This carries forward the previous report's R01 (and R03 of the report before it); the package's own gate report already notes that its job did not edit the manifest and that the entry remained to be added.

**Witness:** The manifest's `id =` lines are the nine listed above. The cached legal arXiv v1 text gives the cited statement at dugger-isaksen line 57, printed p. 2: for an open hypercover of a space the natural map from its homotopy colimit is a weak equivalence, which is what lines 111 and 572 use.

**Exact repair:** Add one `dugger-isaksen` entry to `packages/EllAdicHomotopyTypesAndWeights/sources.toml`: authors Dugger and Isaksen, title as in the README, year 2004 with the arXiv identifier math/0111287 and a version note that v1's numbering is the one cited, locator scheme theorem, locator "Theorem 1.2", cited for the ComplexComparisonPartII contract and §4.3, with the service's fetch record. No README or Lean change is needed; the mathematics cited is supported by the cached text.

## Previous findings

- R01 — not repaired: the README still lists `dugger-isaksen` at line 1109 and cites it at lines 111 and 572, while the package manifest still has nine entries and none for Dugger–Isaksen. Written again as this report's R01.

## Verified sound

### Gate, scope and elaboration

The requested head is `0f96b760257fc007663e59bd58240ccbf7667ec5`, a merge of main into the branch. In the worktree `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights` is empty (the long list of outside-folder files in the change summary is the merged main, not the pull request's own edits), and the worktree is clean. The worker's gate passed with `build=0`. I reran the gate:

```text
gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check with `--movable` returned

```text
depcheck: 239 roadmaps, 2344 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line for this roadmap. Direct elaboration of `Suggested.lean` with `lake env lean` from the pinned worktree exited 0 with no output: no warning and no error. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`; the Tau Ceti package checkout is at that commit. The new module header (`module`, `public import Mathlib`, `@[expose] public section`) is the form the gate accepts at this pin and the file still has the single `import Mathlib`.

### Headline theorems, binders and padding

`Suggested.lean` declares nothing; its docstring names 21 headline theorems and what each lacks at the pins. The changed bullet now says the pro-simplicial universal-coefficient headline lacks the tower of finite-coefficient cochain complexes of a pro-simplicial set with its derived limit, and derived ℓ-completeness with derived Nakayama. I checked at the pin: Tau Ceti has the generic tower, Milnor and derived-limit carriers named in the README (below) but no tower of cochains of a pro-simplicial set, and no derived completeness or derived Nakayama (the only Nakayama file is `TauCeti/Algebra/Module/GradedModule/Nakayama.lean`, for graded modules). Stating the headline would need the colimit of the pinned cochain functor over a small cofiltered diagram, the reduction tower, its limit, the Tor term and the (F) hypothesis, which is a long encoding and not a few simple definitions; the docstring's position is unchanged in substance and accurate. With no declaration there is nothing to probe with one tactic and no binder to compare by `#check`; own declarations before/after 0/0, admitted data 0/0.

### Adversarial table for the changed statements

Here ℓ is a prime, X=(X_α) a small pro-simplicial set, C_r=C(X,ℤ/ℓ^r) and RΓ=RΓ(X,ℤ_ℓ). Values were computed by hand on the instances named.

| Statement | Instances tried and values computed on each side | Result / change |
|---|---|---|
| §3.3 definition: strict tower with surjective transitions, Rlim is the termwise limit | In each degree C^n(X_α,ℤ/ℓ^{r+1})→C^n(X_α,ℤ/ℓ^r) is the product over n-simplices of the reduction ℤ/ℓ^{r+1}→ℤ/ℓ^r, which is onto; a filtered colimit of onto maps is onto. Surjective transitions give Mittag-Leffler terms and lim¹=0, which is exactly the hypothesis `hK : ∀ i, Subsingleton (K.X i).limOne` of `derivedLimitIsoLimComplex`. For a point, C_r=ℤ/ℓ^r in degree 0 and lim_r=ℤ_ℓ. | Passes; the law "represented by the termwise limit complex" matches the pinned hypothesis. |
| §3.3 reduction recovery, kernel tower and its transition | For s≥r the cone of ℓ^r on ℤ/ℓ^s has H⁰=ℤ/ℓ^r and H⁻¹=ker(ℓ^r)=ℓ^{s−r}ℤ/ℓ^s≅ℤ/ℓ^r. Reduction ℤ/ℓ^{s+1}→ℤ/ℓ^s sends ℓ^{s+1−r}a to ℓ^{s−r}(ℓa), so the transition on the kernel is multiplication by ℓ and r composites give ℓ^r=0. For ℓ=2, r=1, s=2: ker(2 on ℤ/8)={0,4}→ker(2 on ℤ/4)={0,2} sends 4 to 0, the zero map, as multiplication by 2 on 𝔽₂ is. Exactness of Hom out of free chains carries this to the cochain kernel, whose degree-j cohomology is H^{j+1}(X,ℤ/ℓ^r). | Passes; pro-zero kernel towers, so `lim_eq_bot_of_isProZero` and `subsingleton_limOne_of_isProZero` apply and the limit of the cones is C_r. |
| §3.3 universal-coefficient sequence from the triangle | Two-term complex ℤ_ℓ→ℤ_ℓ with differential ℓ in degrees 1,2: H¹=0, H²=ℤ/ℓ. Mod ℓ the differential is 0: H¹=H²=𝔽_ℓ. Degree 1: 0→0→𝔽_ℓ→Tor₁(ℤ/ℓ,𝔽_ℓ)=𝔽_ℓ→0. Degree 2: 0→ℤ/ℓ⊗𝔽_ℓ=𝔽_ℓ→𝔽_ℓ→Tor₁(0,𝔽_ℓ)=0→0. The cone of ℓ^r on RΓ has the long exact sequence H^i(RΓ)→H^i(RΓ)→H^i(C_r)→H^{i+1}(RΓ), whose cokernel and kernel terms are H^i⊗ℤ/ℓ^r and Tor₁(H^{i+1},ℤ/ℓ^r)=H^{i+1}[ℓ^r]. | Passes; degree i+1, not i, as the existing Check requires. |
| §3.3 Milnor sequence and (F) | Finite groups are Artinian (`isArtinian_of_finite`), so `isMittagLeffler_of_isArtinian` applies and lim¹ H^{i−1}(X,ℤ/ℓ^r)=0; then H^i(RΓ)=lim_r H^i(X,ℤ/ℓ^r), which is §3.2's definition. Negative control: taking ℤ_ℓ-cochains levelwise on the polygon tower of the first new Check gives H¹=colim(ℤ_ℓ, multiplication by ℓ)=ℚ_ℓ, not finitely generated and not derived ℓ-complete (the map ℤ[1/ℓ]→ℚ_ℓ is a nonzero class, as DerivedModuleAlgebra §1.2's own check records). | Passes; the Milnor sequence needs surjective shift in every degree, which the cochain tower has, and `exact_limOneToHomology_homologyToLim`, `limOneToHomology_injective` and `homologyToLim_surjective` exist at `Milnor/Basic.lean` lines 518, 501, 532. |
| §3.3 finite generation by derived Nakayama | M=H^i(RΓ) is derived complete; M/ℓM↪H^i(X,𝔽_ℓ) is finite; lifting a basis gives ℤ_ℓ^n→M with cokernel Q, Q/ℓQ=0. Q⊗^Lℤ/ℓ^n=[Q→Q] by ℓ^n has H⁰=Q/ℓ^n=0 and H⁻¹=Q[ℓ^n]; the transition Q[ℓ^{n+1}]→Q[ℓ^n] is multiplication by ℓ, onto for divisible Q (ℓ^n x=0, x=ℓy, then ℓ^{n+1}y=0), so lim¹=0, H⁰(ΛQ)=0 and Q=ΛQ=0. Negative control: Q=ℚ_ℓ is divisible with ΛQ=0≠Q, so the completeness of Q (a cokernel of complete modules, complete by `isDerivedCompleteLimits` and `isDerivedCompleteCohomology`) is what the argument uses. | Passes; the quotient-tower formula is DerivedModuleAlgebra §1.5 for the Noetherian ring ℤ_ℓ and the principal ideal (ℓ). |
| §3.3 Check 1 (polygon tower) | H¹(X_α,ℤ/ℓ^r)=ℤ/ℓ^r; the ℓ-fold cyclic cover pulls back the generator to ℓ times the generator, so the colimit of ℤ/ℓ^r along multiplication by ℓ is 0 after r steps (for ℓ=2, r=1 the single map ℤ/2→ℤ/2 is 0). H⁰ is constant ℤ/ℓ^r with lim ℤ_ℓ and lim¹ 0, so RΓ=ℤ_ℓ in degree 0 and (F) holds. The other order of limits gives ℚ_ℓ in degree 1. | Passes; this is the witness for the sentence of Weil II (5.2.1) that the inductive limit must precede the projective one (weil-II line 3787). |
| §3.3 Check 2 (point, r=1) | Level s: [ℤ/ℓ^s→ℤ/ℓ^s] by ℓ has H⁻¹=ℓ^{s−1}ℤ/ℓ^s≅𝔽_ℓ and H⁰=𝔽_ℓ; the degree −1 transition is multiplication by ℓ on 𝔽_ℓ, hence 0. lim of a zero-transition tower is 0 and its shift (x_n)↦(x_n−0) is the identity, so lim¹=0; degree 0 is constant 𝔽_ℓ with lim 𝔽_ℓ. Result 𝔽_ℓ in degree 0 only, equal to [ℤ_ℓ→ℤ_ℓ] by ℓ, which has H⁻¹=0, H⁰=𝔽_ℓ. | Passes; a single level would keep the degree −1 class. |
| From Tau Ceti paragraph (README:52) | `ModuleTower` is `ℕᵒᵖ ⥤ ModuleCat R` (`Tower/Basic.lean:78`); `lim` at 170 and `limOne` at 174; `isMittagLeffler_of_isArtinian` (`MittagLeffler.lean:113`, hypothesis `[∀ n, IsArtinian R (F.obj (op n))]`) and `subsingleton_limOne_of_isMittagLeffler` at 191; `lim_eq_bot_of_isProZero` (`ProZero.lean:75`) and `subsingleton_limOne_of_isProZero` at 88; `limMap_surjective_of_subsingleton_limOne` (`Exact.lean:117`, levelwise exact and surjective, `[Subsingleton F.limOne]`); `ComplexTower.homologyToLim` (`Milnor/Basic.lean:383`), `limOneToHomology` at 482 and `exact_limOneToHomology_homologyToLim` at 518, all under `hC : ∀ i, Function.Surjective (C.term i).shift`; `derivedLimit` (`DerivedLimit.lean:310`) and `derivedLimitIsoLimComplex` at 394 with `hK : ∀ i, Subsingleton (K.X i).limOne`. | Passes; every name, file and hypothesis the paragraph states agrees with the pin. |
| From DerivedModuleAlgebra paragraph (README:83) and §3.3 Needs | On main `eaf17b10`, `TauCetiRoadmap/DerivedModuleAlgebra/README.md` has §1.T.1 at 1403, §1.1 at 1573 (derived limit of towers, Milnor sequence), §1.2 at 1693 (derived completeness with the laws `isDerivedCompleteCohomology` and `isDerivedCompleteLimits`: closed under derived limits, products, shifts and cones), §1.3 at 1733 (reflector, derived Nakayama), §1.5 at 1808 (quotient tower computes completion for Noetherian A and for regular sequences). | Passes; each claim of the paragraph is a stated law of the cited section. |
| From EtaleCohomologyFoundations paragraph (README:105) | On main, §F.4.2 at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:979` defines K_Zℓ=Rlim_n K_n, proves RΓ(X,K_Zℓ)≅Rlim RΓ(X,K_n) and keeps Milnor and lim¹ terms; its Check retains a possibly nonzero lim¹ without ML. §F.3 gives finite ordinary cohomology for separated finite-type schemes over algebraically closed fields with invertible finite coefficients, so both ℓ-adic groups are limits of finite groups and both lim¹ terms vanish. The finite-coefficient identification used is EtaleHomotopyTypes Layer 3 §3.4 (cohomology of the rigid étale type with constant abelian coefficients), consumed in §4.1's route. | Passes. |
| Scope paragraph (README:9) and Layer 3 Dependencies (README:508) | The DerivedModuleAlgebra range is now §§1.T.1–1.5, matching the sections cited in §3.3; the dependencies line names §§1.1–1.5 and the Tau Ceti tower modules. | Passes; no supplier later in the merge order is cited (DerivedModuleAlgebra and EtaleCohomologyFoundations are on main). |
| Suggested.lean docstring bullet (lines 18–20) and header | No derived completeness at the Tau Ceti pin; no tower of pro-simplicial cochains at the pin; own declarations 0/0, admitted data 0/0, stand-ins 0/0. | Passes. |

### Carried-forward adversarial rows

The diff leaves every other target untouched. The rows below are carried from the previous report (review 2 of this folder, at 9bbc066), which computed them; they are not fresh computations.

| Statement | Values computed in review 2 | Result |
|---|---|---|
| Conventions (odd squares, differential, Frobenius, weights) | e²=0 in Λ over 𝔽₂ while e²≠0 in 𝔽₂[e]; dy=x² forces weights (2,4), not (2,3). | Carried, passes. |
| 0.1 Commutative DG carrier and connectedness | Λ_K(e₁): H⁰=K, e²=0; K[t,dt]: A⁰≠K but H⁰=K; zero algebra: H⁰=0≠K. | Carried, passes. |
| 1.1–1.4 Divided powers, bigrading, relative simplex forms, pullback | γ₁²=2γ₂ (0 over 𝔽₂, γ₂≠0); dx has bidegree (1,1); dx₀=−dx₁ on an edge; γ₂(x+y)=γ₂(x)+xy+γ₂(y). | Carried, passes. |
| 2.1–2.5 Compatible forms, coefficient homotopy, triangular comparison, principal quotient, rational comparison | H¹(Ω₀)=0 and H¹(Ω_n)=R on S¹; (aγ₁)(bγ₁)=2abγ₂; nonprincipal negative control over ℚ[x₁,x₂,…]; γ_n↦tⁿ/n!. | Carried, passes. |
| 3.1, 3.2, 3.4, 3.5 Pro-forms, mod-ℓ finiteness, completion, rationalized algebra | (ℓ^i) in lim colim; CP∞ satisfies (F) in infinitely many degrees; Σγ_n excluded from the total sum; tγ₂=3γ₃ becomes 1/2=3/6. | Carried, passes. |
| 4.1–4.4 Étale realization, finite/raw comparison, Galois continuity, hypercover and complex comparison | Dual-number thickening has the cohomology of its reduction; orbit lengths 2,3 give stabilizer index 6; two-arc cover: coarse nerve H¹=0, component nerve H¹=K; G_m Betti numbers (1,1,0). | Carried, passes. |
| 5.1–5.2 Geometric weights, Frobenius–Hodge | G_m H¹ weight 2, elliptic H¹ weight 1, nodal curve weight 0; ℙ¹ at q=2,3 eigenvalues 1,q. | Carried, passes. |
| 6.1–6.6 Filtrations, stable representatives, eigenvalues, products, weight bounds, common filtration | J₂(1) kernels 1 then 2; eigenvalues 2,3 multiply to 6; sphere model weights (2,4); AB≠BA on the shear pair, both preserve the flag. | Carried, passes. |
| 7.1–7.4 Weight extension, splitting and conjugacy, rational splitting, conjugacy | s_c(2)s_c(3)=s_c(6)=(−5c,6) in G_a⋊G_m; elliptic weights (1,1) multiply to 2; shear b↦b+a changes H¹ class. | Carried, passes. |
| 8.1–8.5 and 8.3t/8.3v/8.3a Arbitrary base, formality, transgression, Tannakian comparison, presentation | ℙ¹ minus three 𝔽₂-points at ℓ=3: H¹ eigenvalues (2,2); dy=x²↦0 for ℙ¹; Heisenberg five-term ranks 2,2,1,1,2 with transgression c↦−[ab]; C₂ and S₃ have trivial unipotent completion. | Carried, passes. |
| 12 declared gaps | Separating computations per gap as tabulated in review 2 (A_PL(point)=K; ℙ¹ full model dy=x²; G_m weight 2 versus nodal weight 0; orbit stabilizer index 6; C_nodal×G_m weights 0,2 and 2,2). | Carried; precise, minimal, declared in plan and README. |

### Sources

The seeded sample names fifteen targets; only §3.3 falls in the changed passages. For it I opened weil-II at line 3769 (printed p. 237: the extraction's page 101 carries the printed number 236, so page 102 is 237): under (F) the SGA 5 V (5.3.1) arguments give that each H*(X,ℤ_ℓ)=lim H*(X,ℤ/ℓ^n) is a finitely generated ℤ_ℓ-module with the usual universal-coefficient exact sequences, and the closing sentence (line 3787) that the inductive limit must precede the projective one. The source states the ℓ-adic groups as limits of the finite-coefficient groups, exactly what the README cites it for; the derived-limit construction, reduction recovery and the Nakayama route are the roadmap's own, owned by the new definition and routed through DerivedModuleAlgebra and Tau Ceti, not attributed to Weil II. The locators of the other fourteen sampled targets were checked in reviews 1 and 2 against the cached texts and are unchanged at this head. The Dugger–Isaksen citation resolves in the cached arXiv v1 text at dugger-isaksen line 57 (Theorem 1.2, printed p. 2).

### Citations, ownership and the resolver's leads

The resolver lists three leads, all on unchanged lines. `EtaleHomotopyTypes §EH.3` and `§EH.0` are this README's labels for EtaleHomotopyTypes Layer 3 (“Rigid étale types and finite-cover comparison”, `TauCetiRoadmap/EtaleHomotopyTypes/README.md:493` at the head of #1806, with §3.3 the rigid étale type and §3.4 its cohomology) and Layer 0 (“Homotopy theory of pro-spaces”, line 171, which carries the reindexing and universe interfaces); the declared gap `finite-component-etale-presentation` uses the same label, so the labels are consistent across plan and README. `MixedHodgeModulesAndIrregularHodgeTheory §§H.1` appears once, at line 13 in the scope section, as a statement of what that roadmap treats and what is requested instead from MotivicEtaleKTheory; it is not a `*Needs:*` edge or a supplier citation, and the roadmap is in the merge order before this one.

Ownership of the new object: `roadmaps grep` over main and the 459 open heads for ℓ-adic or derived-limit cochains of a pro-simplicial set returns only this README. EtaleCohomologyFoundations §F.4.2 owns the sheaf-level derived limit on schemes, DerivedModuleAlgebra §1.1 the generic module derived limit, and EtaleHomotopyTypes Layer 6 the p-completion of pro-spaces; none defines the ℓ-adic cochain complex of a pro-simplicial set, so this roadmap is its owner and consumes the three suppliers by section. Ownership against open pull requests whose files the brief does not give was checked only through the service's index.

## Not verifiable

- `sga5` (SGA 5 V (5.3.1)), which Weil II invokes at the cited line for finite generation, is recorded as uncertified; the README cites Weil II itself and routes the proof through DerivedModuleAlgebra, so nothing here depends on reading SGA 5.
- `miller` is uncertified and untouched by this change.

## Source issues

- none
