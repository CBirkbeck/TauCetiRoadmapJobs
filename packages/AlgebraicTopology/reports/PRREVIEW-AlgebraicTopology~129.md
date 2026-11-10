# Review of AlgebraicTopology (pull request #1652 at 97c4f5a)

**Verdict:** accepted

Incremental re-review of 41 changed lines since c610f76. No finding: the one finding of the previous report (the title and description) is repaired, `README.md` and `Suggested.lean` are byte-identical to the head the previous review read, and the gate, the dependency check and the elaboration pass on this head. The folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: title "AlgebraicTopology: Layer form at the current pins with a headline-only Suggested.lean"; the description lists the seven deleted modules, drops "existing Lean modules are unchanged", and says DGFloerPartII §1.0 becomes citations of §4.8.

The repair introduced no new problem. Each sentence of the new description was checked against the head:

- "changes nothing outside it": `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty.
- Pins "Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`": `lake-manifest.json` has `2fd255d997f4…` and `1b1ccf4b088b…`; `TauCetiRoadmap/AlgebraicTopology/README.md:269`–`:270` names the same two.
- "Seven companion modules are deleted": the three-dot diff deletes exactly `BoundaryCarrierOrientation`, `BoundaryInteriorComparison`, `ChartSimplexLocalImage`, `CompactOrientationLaws`, `GeneralModelOrientation`, `OrientationComparison`, `TopologicalGroupFundamentalGroup`.
- "17 headline theorems … importing Mathlib and eleven Tau Ceti modules": `Suggested.lean` has 17 `theorem` declarations (17 `sorry` warnings) and import lines 3–14, one Mathlib and eleven `TauCeti.*`.
- §4.6, §4.8, §6.6, §8.3, §8.4, §8.5, §8.10, §§8.13–8.16 exist at `README.md:1666`, `:1795`, `:3026`, `:3334`, `:3367`, `:3413`, `:3844`, `:4224`, `:4418`, `:4458`, `:4510`; `GeneratedByTopCat.adj` is consumed at `:162`, `:288`, `:1797`, `:1856`.
- "Compact closed-pair Čech theory … not in this roadmap": `README.md:190`–`:191`.
- "a table from each former `#stage-k-…` anchor": `README.md:856`–`:865`, eight rows.
- DGFloerPartII: at its head 43d9b63 the identification is still stated in its own §1.0 (`TauCetiRoadmap/DGFloerPartII/README.md:580`, `TauCetiRoadmap/DGFloerPartII/Suggested.lean:106`) with no citation of AlgebraicTopology §4.8; the description now says the edit is on that side, which is what the previous report asked for.
- "the amendment of #1663 … which is closed": #1663 was merged into this pull request's branch on 2026-11-09, so it is no longer open and its content is in this head. Read as "not open", the sentence is right; no change asked.
- The generated `merge-order` block orders the four conflicting pull requests after this one (**this pull request** → #1807 → #1808 → #1854 → #1187), matching the overlap list.

## Verified sound

### What changed since c610f76

- `git diff --stat c610f76 HEAD -- TauCetiRoadmap/AlgebraicTopology`: `PROGRESS.md` (+9) and `STATUS.md` (32 changed lines), nothing else. `README.md` and `Suggested.lean` are unchanged, and so are `lake-manifest.json` and `lean-toolchain`.
- Both changed files arrive through the merge of main into the branch: `git diff origin/main HEAD -- TauCetiRoadmap/AlgebraicTopology/PROGRESS.md TauCetiRoadmap/AlgebraicTopology/STATUS.md` is empty, so they are main's progress report and not part of this pull request's change. The gate reports `stray-files=0` with them present.
- No changed passage touches a README statement, a section number, a supplier citation or a Lean statement, so none of the seeded sample targets (1.2, 2.3, 2.6, 3.4, 3.5, 4.1, 4.2, 4.5, 4.7, 5.1, 5.2, 5.3, 8.5, 8.7, 8.8) falls in a changed passage. Of these, 2.6, 4.1, 4.2, 4.5, 4.7 and 8.5 were read at their locators in the previous report (table carried below); the rest were not re-read in this incremental pass.

### Gate, dependency check, elaboration

- **Gate** (rerun on this head): every counter 0, `OK`; the worker's `gate.md` agrees, with `build=0`.
- **Dependency check**, verbatim: `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration** (rerun): `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` gives 17 "declaration uses `sorry`" warnings and nothing else.
- **Form, padding, headlines, `#check` comparison**: carried from the previous report, valid because `Suggested.lean` is byte-identical (no `variable` line, no `set_option`, no sorry'd data; the one-tactic probe closed none of the 17 theorems; eight definitions with real bodies; the docstring names each non-statable headline with its missing carrier). The worker's `signatures.md` for this head again reports 0 lost binders on 27 declarations.

### Citations and overlaps, resolved at this head (main 641eaf3, index of 2026-11-10)

- The worker's resolver reports no cross-roadmap citation found nowhere. Its one Lean lead, `Singular.BrouwerFixedPoint` (`README.md:397`), is a module name, as in the previous report.
- The supplier roadmaps of `## Exact supplier contracts` (GeometricTopology, DifferentialGeometry, DGFloer, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry) and TopologicalSheafCohomology, named in Scope and ownership, are folders on main at 641eaf3. Section-level resolution is carried from the previous report.
- Overlaps: no cited id is dropped by an open pull request or defined only by an open revision. The four `#stage-k-…` anchors other roadmaps cite (Stages 2, 4, 6, 8) are rows of the anchor table at `README.md:859`, `:861`, `:863`, `:865`. The four conflicting heads have a stated order.
- Ownership against open pull requests was checked through the overlap list, the resolver and DGFloerPartII's folder, not by reading every open folder.

### Source sample

Carried from the previous report (15 targets read at their locators at c610f76, same README text):

| Target | Locator in README | Read at | Result |
| --- | --- | --- | --- |
| 1.1 | Brown §6.7 Ex. 6, p.250 | `brown` line 9768 (p.250): cover closed under pairwise intersections of a subcover, colimit of π restricted to the cover | supports |
| 1.3 | Hatcher Thm 1.20, p.43 | `hatcher` line 1956 (p.43): surjectivity with pairwise, kernel with triple intersections path connected | supports |
| 1.5 | Brown 6.7.5, p.248; Ex. 2, p.249; Hatcher Ex. 1.21, p.43 | `brown` lines 9692, 9749; `hatcher` line 1962 | supports |
| 2.6 | Hatcher §3.H, p.333 | `hatcher` lines 14562–14575: homotopic maps give isomorphic pullbacks; pair sequence, excision, additivity with local coefficients | supports |
| 3.2 | Hatcher Prop. 2.21, p.119; §3.H, p.333 | `hatcher` lines 5222, 14569–14570 (excision by iterated subdivision with local coefficients) | supports; the twisted form is stated as proved here |
| 4.1 | Hatcher Appendix Ex. 1, p.529 | `hatcher` line 22952 | supports |
| 4.2 | Cellular boundary formula, p.140; Lemma 2.34, p.137 | `hatcher` lines 6086, 5963 | supports |
| 4.5 | Hatcher Thm 4.8, p.349; Prop. 0.19, p.16; Prop. A.3, p.522; Thm A.6, p.524; Strøm Thm 6, p.135 | `hatcher` lines 15205, 867, 22617, 22693; `strom1972` line 181 (one subspace closed, as {0,1}⊂I is) | supports |
| 4.7 | May Thm 14.1; Hatcher VBKT Prop. 1.20, p.36 | `may1967` lines 1578–1580; `hatcher-vbkt` line 1445 (page header "36") | supports |
| 5.4 | Hatcher Thm 3B.6, p.275; Ex. 3.16, p.216 | `hatcher` lines 11898, 9388 | supports |
| 6.0 | Hatcher Prop. A.1, p.520; Thm 3.5, p.203 | `hatcher` lines 22534, 8799 | supports |
| 6.3 | Hatcher Lemma 3.27, p.236; Prop. 3.29, p.239 | `hatcher` lines 10255, 10370 | supports |
| 6.6 | Hatcher Thm 3B.6 and relative form, pp.275–276 | `hatcher` lines 11898, 11937–11938 (p.276) | supports |
| 8.5 | Hatcher Thm 4.5, p.346; Cor. 4.33, p.367; Ch. 0, p.14; FTW Thm 1.6, Thm 4.2, Lemma 4.3, Cor. 4.9 | `hatcher` lines 15109, 16001, 796; `ftw1973` lines 134, 600, 610, 752 | supports; Cor. 4.9's hypotheses equal the README's |
| 8.10 | Hatcher Thm 4.57, p.393; fundamental class and free classes, p.394; Lemma 4.31, p.366 | `hatcher` lines 17069–17071, 17076–17089, 15931 | supports |

### Adversarial table

No statement changed, so there is no new row. Every row is carried from the previous report (computed at c610f76 on the identical `README.md` and `Suggested.lean`). Three were recomputed here as a control: 6.2 on T² (cup length 2, count 3, `2+1 ≤ 3`), 7.2 on the Klein bottle over 𝔽₂ (`1−2+1 = 0 = 0·0`), and 8.15 at n = 1 (a finite group acting freely on a circle is cyclic, `C_p × C_p` is not).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 2.6 triple connecting map | S¹ with sign system, loop σ, coefficient c | ∂(cσ)=(u−1)c=−2c; coker gives H₀=ℤ/2; ignoring transport gives 0 and ℤ | holds |
| 3.1 `∂T+T∂=id−Sd` | σ=[v₀,v₁]; a 0-simplex | Sdσ=[b,v₁]−[b,v₀]; Tσ=[b,v₀,v₁]−[b,v₁,v₁]+[b,v₀,v₀]; ∂Tσ+T∂σ=σ−Sdσ; degree 0: 0=0 | holds |
| 3.2 small chains | cover [0,.3),(.2,.8),(.7,1] | [0,1/2] in no member; the four quarters lie in members 1,2,2,3 | holds |
| 4.4 isometry A and native cube quotient | n=1, 2 | det A=+1, −1=(−1)^(n+1); frame (−e_last,e₀,…) has det (−1)^(n+1); product +1 | holds |
| 4.7 radial map | n=1: z=±1; n=2: z=(1,0) | e₁, e₀; weights (0,2/3,1/3) on the face opposite e₀ | holds |
| 5.2 two-map Wang sequence | g reflection; g=z²; g constant; f=g=id | H₁=ℤ/2⊕ℤ; ℤ (and ℤ/3 for id+g_*); ℤ; H_n(Y)⊕H_(n−1)(X) | holds |
| 5.6 Čech signs | three opens, c on U₀₁₂; (1,1) position | U₂-component of δδc is c−c=0; D²c=∂δc−δ∂c=0 with the column sign | holds |
| 5.7 augmented row | point covered twice; zero ring | 0→R→R²→R→0, c↦(−c,c), (a,b)↦a+b exact; all terms 0 | holds |
| 6.0 difference map and homotopy-square maps | constant ℤ tower; ×2 tower; f_n=n·id; ×3 tower | (3,1,0,…)↦(2,1,0,…); 3x₀≡−1 mod 4ᵏ for all k, no solution; (2n+1)s=(n+1)s+ns; Σ3ⁿ=−1/2∉ℤ | holds |
| 6.1 backward transport | R=ℤ/5, u=2 | u⁻¹a−a=2a against ua−a=a | holds, Check discriminates |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; T²; ∅; zero ring; two points | 0+1≤1; 1+1≤2; 2+1≤3; excluded by `Nonempty` (count 0); 0+1≤count, count ≥1; 0+1≤2 | holds |
| 6.4 `poincareDuality_of_isFundamentalClass` | two points, R=ℤ; S¹ with 2[S¹]; RP² over ℤ/4; zero ring; M=∅ | (a,b)↦(u₁a,u₂b) bijective; local image 2 not a generator; ker 2={0,2}, image 2 not a generator, so no hypothesis; 0→0; 0→0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP² over 𝔽₂; S¹ over 𝔽₂; μ=0 | Betti 1,1,1 matched with 1,1,1; 𝔽₂↔𝔽₂ twice; zero class gives zero caps, not selected | holds |
| 6.5 linking symmetry | (n,i)=(3,1); (5,2) | exponent 4, symmetric; 9, skew; squares mod 5 are {1,4}, closed under negation | holds |
| 6.6 `productBallImages_intersect` | p=q=0; p=0; homotopy H_t; constant maps | one point; g₂ onto D_q by no-retraction; norms ≥t on both parts of B, coefficient (−1)^q·1·1; d_f=d_g=0 and disjoint images (boundary-degree form only) | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | Hopf; Klein bottle over 𝔽₂ and ℚ; B=∅; F=∅ | 0=2·0; 1−2+1=0 and 1−1+0=0, =0·0; 0=0·χ(F); 0=χ(B)·0 | holds |
| 7.3 stratification additivity | S²: point, equator, sphere | 1−1+2=2; dropping the middle pair gives 3 | holds |
| 8.2 nerve order, Moore complex | g=(12), h=(23); ℤ[Δ¹/∂Δ¹] | hg sends 1 to 3, gh sends 1 to 2; N₁=ℤ(e−s₀v), d₀=0, ranks 2 and 3 unnormalized | holds |
| 8.3 `hurewicz_bijective` | S², n=0; S¹ (π₁≠0); X=∅ | ℤ→ℤ; hypothesis at k=1 fails; no point x | holds |
| 8.4 `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹); sine-curve pair | π₃=π₂(S²)=ℤ→H₃=ℤ; F₂→ℤ² excluded by simple connectivity of A; excluded by `h₀` (H₀(X,A)=ℤ) | holds |
| 8.5 `homologicalWhitehead` | id of a point; Poincaré sphere → S³; degree 2 on S² | identity; excluded (π₁ of order 120); ×2 not an isomorphism | holds |
| 8.5 `HasProperHomotopyExtensionProperty`, `properStrongDeformationRetract_of_inverse` | A=∅; A=X; (I,{0}); (I,{0,1,1/2,…}); (ℝ,{0}) | K=f∘pr proper; K=H; glued K agrees on the diagonal; no retraction of I×I onto the comb (`hatcher` line 796); g not proper | holds |
| 8.7 CW type, recognition | n=0 finite set; ℕ; n=0, 1 in the recognition | that many 0-cells; H₀ of infinite rank; contractible against S⁰; H₁=0 against ℤ | holds, `2 ≤ n` needed |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ; S₃ | point; π₁=ℤ; π₁ of order 6, nonabelian | holds |
| 8.10 `ordinaryEMRepresentability` | K=S¹, n=0; K=S², n=1; K=S¹×CP∞; K=S¹⊔{p}; K a point; X the Warsaw circle; X=∅ | degree map ℤ=H¹(S¹); [S³,S²]=ℤ against 0, excluded by π₃; ℤ against H²(S¹)=0, excluded by π₁; 2 against 1, excluded at i=0; A=0 only; excluded by `CWType`; 1=1 | holds; ι is unique (H^(n+1)=Hom(H_(n+1),A), the Ext term vanishes) |
| 8.11 `finiteSourceMappingCWType` | X=∅; X a point; Y=∅≠X; S¹ into S¹⊂ℝ² | one point; Y; ∅; components ℤ against contractible ambient | holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; dim M=0; M=S¹, a=k·b₀ | empty map; H¹=0, f constant ≠1 (no surjective derivative possible at a point of the fibre); z^k, k regular preimages | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n≥2 | p²≥4>2 points; deck group of a circle cover is cyclic; dim H^(n+1)=n+2 against ≤1 | holds |
| 8.16 essential map T³→S² | f=p∘q | π_k and H̃_k maps 0; a lifted nullhomotopy ends in a fibre S¹, H₃ map 0 against degree 1 | holds |

In the 6.2 row the two-point space has count 2: an open set containing both points has no nullhomotopic inclusion.

### Library declarations

Carried from the previous report: the declarations it opened at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b (its list of files and lines) stand, since the pins and the README are unchanged.

## Not verifiable

- Settled as uncertified and cited by locator only: Thom 1954, Chapter II; Lee, Theorems 6.26, 6.30, 6.35, 6.36; Milnor, *Morse Theory*, Lemmas 3.6–3.7; Freedman–Quinn §7.7; Weibel; tom Dieck; Serre 1953; Dowker 1952.
- Not in the manifest, cited by chapter: Eilenberg–Steenrod; G. W. Whitehead; Dold; McCleary; K. Brown, Chapter VII; Serre 1951; Conway–Friedl–Herrmann (the L(5,q) values of §6.5 rest on their Proposition 1.2, not read).
- The sampled targets 1.2, 2.3, 3.4, 3.5, 5.1, 5.2, 5.3, 8.7 and 8.8 were not read against their sources in this pass: an incremental re-review checks the sample only where it falls in a changed passage, and none does.

## Source issues

- none
