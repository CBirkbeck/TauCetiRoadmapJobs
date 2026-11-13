# Review of VectorBundlesAndIsocrystalsPartII (pull request #2264 at d2f7530)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README §§4.2 and 4.9 include arbitrary Fréchet models, including Ĉ; graded-piece restrictions are absent. General coefficient descent and inverse-limit comparison are explicit targets, used by §4.10 and the subsequent Module, Pair and qBC comparisons.

## Verified sound

| Statement | Instances tried | Computed value | Comparison value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §4.2: model class and countable-type property | W=Ĉ; m=1; t=0 | Complete Banach model; continuous C-dual=0 | General class includes Ĉ; separable class excludes it | Restriction removed | R01 repaired |
| §4.2: kernel/quotient permanence | W=B₂⊕Ĉ; m=2 | W[t]=tB₂⊕Ĉ; W/W[t]=C | Graded pieces C⊕Ĉ and C; both Banach | Same type retained | General graded pieces |
| §4.9: evaluation Hom | W=Ĉ; f₁(a)=a⊗1; f₀=0 | f₁(1)=1; f₀(1)=0 | Parameters 1 and 0; every continuous functional sends 1 to 0 | Wrong zero map distinguished without duals | General comparison |
| §4.9: pushout Ext parameter | W=Ĉ; w=0,1,−1 | In E_w, t·[(1,0)]=[(0,w)] | Normalized disc coefficients 0,1,−1; E₀=Ĉ⊕C | Sign and zero class agree | General comparison |
| §4.9: intermediate c₀ case | Uncountable I; j outside countable S | e_j has norm 1 and distance 1 from c₀(S,C) | Evaluation parameter e_j; pushout coefficient e_j | Countable-support restriction not introduced | Intermediate case retained |
| §4.9: Banach-valued descent; §3.4 | W=Ĉ; c=ψ₁⊗1; p=2,3 | c(γ)=1/4,1/3; correction g=0 | Dividing by ψ₁(γ) gives λ=1 in both cases | Normalization survives coefficients | General prerequisite owned |
| §4.9: Banach-valued cocycles; §3.5 | W=Ĉ; f=YZ·1; p=2,3 | u=X²·1/2; δu=YZ·1; norms 2,1 | Bounds p·norm(f)=2,3 | Dyadic denominator retained | General prerequisite owned |
| §4.9: Fréchet inverse limits | W=Ĉ^N; W_n=Ĉ^n; coordinate projections π_n | lim W_n=Ĉ^N, containing (1,1,…); lim¹=0 | Roos equation x_n−π_n(x_(n+1))=y_n solved by x_(n+1)=(x_n−y_n,0) | Surjective tower test passes | General prerequisite owned |
| §4.9: zero comparison | W=0; zero Banach tower | Hom=0; Ext¹=0; lim¹=0 | Both parameter maps are 0→0 | No spurious parameter | General statement includes zero |
| §4.10: torsion-source comparison | W=B₂⊕Ĉ; d=1,2 | W[tᵈ]=tB₂⊕Ĉ,W; W/tᵈW=C⊕Ĉ,W | Evaluation and pushout parameter spaces C⊕Ĉ,W respectively | New coefficient summand retained | General base case used |
| §§4.14–4.16: affected comparisons | Split E=Ĉ⊕Ĉ; pure Pair P=[0→Ĉ] | Lift X(u,v) evaluates to (u,v); id_P(1)=1 | Evaluation inverse (u,v)↦X(u,v); model identity also sends 1↦1 | General-model tests agree | Uses §4.9 |
| §§5.3–5.4: affected qBC targets | Pure Pair [0→Ĉ]; multiplication by p | Filtration pieces 0,Ĉ,0; inverse multiplication p⁻¹ | Height 0; compositions pp⁻¹=p⁻¹p=1 | Newly admitted model preserves filtration and height | Uses general Pair comparison |

The rows for untouched statements stand as in the previous review of 7d58029.

- Sources: 4 affected seeded targets (§§3.4, 3.5, 4.2, 5.3) and the changed comparison checked; CN25 lines 1085, 1155, 1227, 1259, 1264, 1291, 1432, 1449, 1500, 1560, 1585 and 2892 provide 12 checked locators.
- Libraries: 2 native declarations reopened, TopModuleCat (Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41) and Submodule.torsionBy (Mathlib/Algebra/Module/Torsion/Basic.lean:177); 0 competing sympathetic period-comparison carriers found at the pins.
- Suppliers: LocallyAnalyticDistributions §0.2 and CompactOperators §0.5 contracts resolved; 0 unresolved cross-roadmap citations from the resolver; 1 precise G-HOM contract matched between README and plan, with its parent Layer 5 owner retained.
- Gate: every scanner passed, including statement hygiene, scope and dependency checks; targeted build passed, with 2 admitted-theorem warnings and the existing Mathlib module-system warning.
- Dependency output: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`.
- Elaboration: Suggested.lean passed with only 2 sorry warnings; all 3 declarations rechecked using `#check @name` on a scratch copy, with 0 missing binders and no signature changes.
- PR text/scope: the description explicitly records the restored general class and new prerequisites; 19 changed lines, 0 changed Lean declarations, 0 removed or renumbered sections and 0 outside-folder changes. Acceptance retains the declared G-HOM supplier contract.

Overlap check: read CstConjectureForDaggerVarieties (#1759), VectorBundlesAndIsocrystals (#1205), PadicHodgeTheory (#1062), PadicPeriodRings (#940), LocallyAnalyticDistributions (#854), and main's CompactOperators and PerfectoidSpaces. Classical BC and sympathetic VS belong to VectorBundlesAndIsocrystals; period rings to PadicPeriodRings; Sen theory to PadicHodgeTheory; generic locally convex theory to LocallyAnalyticDistributions; Banach compactoidness to CompactOperators; perfectoid foundations to PerfectoidSpaces. The general sympathetic coefficient comparison belongs here; CstConjectureForDaggerVarieties consumes it. Searches of open/main roadmaps, package READMEs and pinned libraries found no second owner of the added comparison prerequisites.

Source independence: changed passages only; 9 substantive passages compared with 1 source, CN25, with no copied non-forced wording or reused material found. Largest share: CN25, 79 of 132 source-labelled citations before References. No layer was added, removed or reordered; the previous independent-arrangement assessment stands.

## Not verifiable

- none

## Source issues

- **Misprint** in CN25 at proof of Proposition 4.10, printed p. 23 (line 1102): the source says the normalized lift uses compatible roots of X; it should be compatible roots of E₁, whose logarithm reduces to X; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p. 24 (line 1157): the source says to add the removed constant to the primitive; it should be subtract it, since the additive coboundary of −c is c; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p. 24 (line 1167): the source says use i=p^r for r=v_p(k) and coefficient b_(i,k−1); it should be i=p^(r−1) and b_(i,k−i), giving 1≤i<k and binomial valuation one; affects the proof.
- **Gap** in CN25 at proof of Proposition 4.18, printed p. 26 (line 1243): the source says the Fréchet case follows through nuclear Fréchet inverse limits; it should be justify the comparison for every separable Fréchet space in the statement; affects the proof.
- **Error** in CN25 at proof of Lemma 4.19, printed p. 26 (line 1252): the source says the closed step unit ball is c-compact; it should be justify closedness and boundedness without spherical completeness, since O_C is not c-compact; affects the proof.
- **Misprint** in CN25 at Remark 4.20, printed p. 26 (line 1269): the source says the tensor sequence ends with W followed by W₂; it should be W₁, W₂, W₃, matching the strict sequence; affects the proof.
- **Misprint** in CN25 at Remark 4.21, printed p. 27 (line 1282): the source says the pushout relation is (t^d c,cw) for the displayed inclusions; it should be (t^d c,−cw); affects a stated result.
- **Gap** in CN25 at proof of Proposition 4.22, printed p. 27 (line 1298): the source says the unrestricted m=d=1 case follows from Proposition 4.18; it should be supply the nonseparable Banach/Fréchet comparison, since Proposition 4.18 assumes separability; affects the proof.

## For the human reviewers

- none
