# Review of FourManifolds (pull request #936 at a5aec09)

**Verdict:** accepted

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — repaired: `TauCetiRoadmap/FourManifolds/README.md:406` imports GeometricTopology §1.4’s fundamental-group and Euler-characteristic formulas; the local target is the marked H₂/form/signature comparison on closed oriented smooth four-manifolds.
- R02 — repaired: `TauCetiRoadmap/FourManifolds/README.md:1638` imports GeometricTopology §4.4’s perfect-commutator criterion and Seifert presentation; the MorseNovikov supplier row and attributions are gone.
- R03 — repaired: `TauCetiRoadmap/FourManifolds/README.md:172` and §5.2 use `ContinuousLinearMap` for all four parameter-projection declarations, matching the pin.
- R04 — repaired: `TauCetiRoadmap/FourManifolds/README.md:490` and §1.6 cite Bastl v2, page 6, for link-to-form comparison; §1.6 separately derives matrix realization using Torres’s signed-crossing formula.
- R05 — repaired: `TauCetiRoadmap/FourManifolds/README.md` §§1.2, 2.3, 5.2–5.3 and 6.1 now give readable locators, separating source results from the marked-basis, analytic and restricted-family comparisons.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| §1.2 Sphere-bundle comparison | Nontrivial clutching; basis (S+F,S) | S²=−1, F²=0, SF=1 | (S+F)²=1; (S+F)S=0 | Form diag(1,−1); Garza §38 supports the blowup comparison. |
| §1.3 Connected-sum comparisons | CP²#−CP²; M#S⁴ | χ=3+3−2=4; added H₂=0 | σ=1−1=0; H₂(M)⊕0 | Imported π₁/χ and local marked splitting agree. |
| §1.5 Boundary kernel/cokernel | Q=[0], [2], [1] | Kernels ℤ,0,0; cokernels ℤ,ℤ/2,0 | Boundary H₂ and H₁ respectively | Corrected Bastl page and direction; singular case retained. |
| §1.6 Signed-clasp realization | Empty matrix; framings 1,2 with linking −2 | Component counts 0,2; one negative clasp changes lk by −1 | Empty link; Q=[[1,−2],[−2,2]], det=−2 | Arbitrary off-diagonal signs and empty input work. |
| §2.3 Coloured framed collapse | No colours; +1/0 framed unknot; positive Hopf link | Coordinates 0; 1/0; mixed coordinate 1 | π₃(point)=0; Hopf invariant 1/0; Whitehead coefficient 1 | Koschorke’s wedge comparison has the required specialization. |
| §2.3 Marked cup/intersection comparison | Q=[[1,1],[1,2]] | C=[[2,−1],[−1,1]]; QC=I | Attaching coordinates (2,1,−1) | Added Hatcher locator supports cup normalization; basis transport remains local. |
| §3.6 Alexander criterion | Unknot; trefoil V=[[−1,1],[0,−1]] | det(tV−Vᵀ)=1; t²−t+1 | Modules 0; Λ/(t²−t+1) | Perfect commutator only in first case; supplier is GeometricTopology. |
| §5.2 Parameter projection | D₁=id, D₂=0 on ℝ | Kernel total={0}×ℝ | Parameter projection=id | Correct pinned definition and namespace. |
| §5.2 Surjectivity equivalence | D₁=0, D₂=id on ℝ | Total map onto; projection ℝ×{0}→ℝ is zero | D₁ not onto; projection not onto | Both sides false under the required total-surjectivity hypothesis. |
| §5.2 Index comparison | D₁:0→ℝ; D₂=id | Projection 0→ℝ has index 0−1=−1 | index D₁=0−1=−1 | Signed index equality survives a negative value. |
| §5.2 Fredholm comparison | Same zero-dimensional domain | Projection has kernel 0, closed range 0, cokernel dimension 1 | D₁ has the same dimensions and closed range | Both Fredholm; pinned completeness assumptions retained. |
| §5.2 Metric transversality | Charge-one BPST on S⁴; flat Q₈ example | k=1, index=8−3=5; k=0, index=−6 | H²=0 on regular BPST branch; H²≥6 on flat branch | Added locator used only with simply connected, positive-charge hypotheses. |
| §5.3 Critical Coulomb estimate | Flat gauge; dilation aλ(x)=λa(λx) | Flat norm 0; curvature L² weight λ²λ⁻²=1 | Bound 0; a L⁴ and derivative L² weights 1 | Boundary condition and critical scaling agree. |
| §5.3 Removable singularity | Pure gauge on punctured B⁴ | Curvature 0; energy 0 | Gauge-equivalent zero connection extends | Hitchin’s SD statement transports to ASD by orientation reversal. |
| §5.3 Compactification | One BPST bubble over flat base; no bubbles | Charge 0+1=1; k+0=k | Concentrated energy 8π²; zero lost energy | Source convergence retains integer charge and reducible/flat limits. |
| §5.3 Donaldson comparison | −I₂; −E₈ | Unit-vector pairs 2; 0 | Ranks 2; 8 | Diagonal case meets pair-count equality; E₈ is excluded smoothly. |
| §6.1 Projective incidence | Ideals (2x,2y); (2x) in ℂ[x,y] | Saturations by (x,y): (1); (x) | Projective loci empty; {[0:1]} | Vertex removal and resultant vanishing agree. |
| §6.1 Derivative resultant/scalar law | x²+y²; 3(x²+y²); x² | Resultants 4; 36; 0 | Scalar weight 3²·4=36; critical point only for x² | Degree-two and nonzero-scalar controls pass. |
| §6.1 Generic nodal pencils | Full plane cubics; full quartic surfaces | 3·2²=12; 4·3³=108 | Generic singular-parameter counts 12; 108 | Huybrechts Corollary 2.7 concerns full pencils, as the new text specifies. |
| §6.1 Restricted-family distinction | Hesse cubic pencil versus generic cubic pencil | Four singular parameters, three nodes each: 4·3=12 | Generic pencil: twelve parameters, one node each | Genericity cannot follow from restriction alone; its proof remains an explicit local target. |

Untouched statement rows stand as in the previous review, of `cf9b2be`.

- Sources: 23 theorem/section locators read across 10 cached works; changed seeded targets §§1.3, 1.5, 5.2 and 5.3 checked with their affected comparisons.
- Pins: four corrected declarations opened at `TauCeti/Analysis/Fredholm/Parametric.lean:144`, 403, 430 and 519; namespace at line 123 and Banach hypotheses at lines 506–511 agree.
- Suppliers: GeometricTopology §§1.4 and 4.4 resolve on main at `TauCetiRoadmap/GeometricTopology/README.md:940` and 2740; MorseNovikov’s attribution at `TauCetiRoadmap/MorseNovikov/README.md:1249` agrees. Citation resolver reports no missing roadmap citation.
- Gate: all checks pass; targeted build succeeds, with seven admitted-theorem warnings and Lake’s module-system advisory. Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`.
- Lean: direct elaboration and a fresh `#check @name` copy pass for all 13 actual declarations, with only seven `sorry` warnings; no lost binder. The worker’s fourteenth “declaration” is docstring text.
- Headline/padding audit: seven theorems and six definitions are unchanged; the previous one-tactic results and carrier-dependent omissions stand.
- PR text: title, prose and `roadmap-summary` match this head; the dropped MorseNovikov supplier is disclosed. Three new files, 3425 insertions, no removed IDs and zero outside-folder changes; worktree remains clean.

Overlap check: read GeometricTopology (main, #1797, #1791), HomotopySpheres (main, #284), InstantonFloerTheory (#1083), CharacteristicClasses (#1807), and TangentialBordism (main). GeometricTopology owns connected-sum π₁/χ and Alexander theory; TangentialBordism owns finite embedded collapse; CharacteristicClasses owns ordinary characteristic classes; FourManifolds owns compact/local SU(2) ASD theory and InstantonFloerTheory its cylindrical/Floer extension. HomotopySpheres overlap remains D02. No new overlap or broken ID.

Source independence: changed passages only; 16 passages compared with 10 sources, with no copied nonstandard expression or reused source material found. Largest overall share remains freedmanquinn, 41 of 137 author-name references before the bibliography (the previous count plus 12 added references). No layer was added, removed or reordered; the previous independent-arrangement comparison stands.

## Not verifiable

- The 38 unavailable or settled-uncertified works listed in the `cf9b2be` review retain those source-access limitations; none was needed for a newly added locator. No new source request.

## Source issues

- **Error** in gompfnotes2018 at §1.1, p. 2, line 79: the source says arbitrary representatives of the projective-line class are complex lines; it should choose two distinct complex-line representatives; affects the proof.
- **Misprint** in bastl2024 at Definition 3.5(1), p. 6, line 292: the source calls the preceding handlebody statement Proposition 3.4; it should call it Remark 3.4(2); affects nothing.
- **Misprint** in garza2021 at §38, unpaginated, line 3975: the source sends the line through [s:t:0] and [0:0:1] to [0:s:t]; it should send it to [s:t:0] in the specified target line; affects the proof.
- **Error** in walpuski2023 at Theorem 5.83, p. 120, lines 4481–4482: the source asserts generic regularity of every irreducible ASD connection without excluding obstructed flat connections; it should impose appropriate nonflatness and base hypotheses, as this roadmap does; affects a stated result.
- **Misprint** in walpuski2023 at Theorem 5.94(4), p. 127, line 4719: the source puts every bubble mass at the last point x_k; it should put the a-th mass at x_a; affects a stated result.
- **Misprint** in walpuski2023 at Lemma 5.98, proof, p. 134, lines 5022–5023: the source uses the positive-norm orthogonal projection formula for a vector of square −1; it should use components −⟨y,x⟩x and y+⟨y,x⟩x; affects the proof.
- **Misprint** in walpuski2023 at Theorem 5.96, proof, p. 134, lines 5026–5034: the source equates negative-definite rank with signature; it should use rank=−signature and negate the subsequent signature sum; affects the proof.
- **Misprint** in huybrechtscubic at Chapter 1 §2.3, p. 32, lines 1051–1055: the source states the principal resultant characterization for an unrestricted number of forms; it should require n+2 forms in n+2 variables, hence m=n+1; affects a stated result.

## For the human reviewers

- **Not tested:** the 38 unavailable or settled-uncertified works listed in the previous review remain outside the wording/reuse comparison. The most-cited source, freedmanquinn, including its contents, is readable.
- **Licence:** the added Garza and Walpuski references are author-hosted course notes; Huybrechts is an author manuscript (garza2021 line 2, walpuski2023 lines 2–9, huybrechtscubic lines 2–6). No source expression is reused.
