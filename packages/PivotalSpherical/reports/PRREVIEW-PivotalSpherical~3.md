# Review of PivotalSpherical (pull request #2311 at 20de8ee)

**Verdict:** needs changes

## R01 (P1) — The centre theorems lose their field hypotheses

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:190`, also 194 and 200: “`isFiniteSemisimpleCategory_center : IsFiniteSemisimpleCategory (Center C)`”.
**Claim:** The elaborated signatures omit `k`, algebraic closure, characteristic zero, linearity and Hom-finiteness. The semisimplicity and dimension assertions are false at that generality; all three signatures differ from the README.
**Witness:** Take `C = Vec(C₂)` over an algebraically closed field of characteristic two. Its centre contains the nonsplit Jordan representation `[[1,1],[0,1]]`; the asserted semisimplicity would split it.
**Repair:** Add `include k in` before each of the three theorems, or carry all the fusion hypotheses explicitly. This scratch repair elaborates and retains all six missing assumptions; it excludes the characteristic-two example and the nonsplit real example in the table. Keep both negative controls in the README.

## R02 (P1) — The nonpivotal existence argument lacks its inputs

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:250`: “a pseudo-unitary fusion category has a unique pivotal structure”; its Needs clause cites `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory`.
**Claim:** The cited theorem already assumes a pivotal structure. Neither the listed suppliers nor the preceding targets supply the nonpivotal existence argument. The analogous nonvanishing claim in 6.2 also needs more than the definition in 6.1.
**Witness:** `TauCeti/CategoryTheory/Monoidal/Pivotal/PseudoUnitary/Existence.lean:46` requires `[original : PivotalCategory C]`; `eno` line 1550 begins its general argument with a monoidal quadruple-dual comparison and a compatible additive square root.
**Repair:** Give these inputs local targets before 6.2–6.3: the monoidal isomorphism `Id ≅ (−)****` for fusion categories in characteristic zero (ENO Theorem 2.6), the compatible additive square-root and trace-operator construction (§3.1, pp.10–11), and its positivity/existence consequences (Theorem 2.3; Proposition 8.23, pp.34–35). Coordinate their ownership with R03. Use the pinned pivotal theorem only after constructing a pivot; do not assume the sought pivot. On `Vec(C₂)` the construction must select the positive pivot from squared-norm dimension 2.

## R03 (P2) — Nonpivotal dimensions have two owners

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:239`: “Squared norms without a pivotal structure”, and 244–254.
**Claim:** This revision and open pull request #2316 both own bidual traces, squared norms, nonpivotal global dimension and comparison with pivotal dimension. Their ownership paragraphs do not resolve the duplication.
**Witness:** #2316, `TauCetiRoadmap/OcneanuRigidity/README.md:196`, Layer 1, builds the same squared norms and global dimension; line 64 assigns the pivot-free extension to that roadmap.
**Repair:** Name PivotalSpherical as owner of these fusion foundations and their necessary existence/positivity inputs; have #2316 cite the precise sections and retain its relative-centre and deformation extensions. This existing roadmap must not acquire a dependency on the later open roadmap. Preserve one definition giving dimension 2 for `Vec(C₂)`.

## R04 (P2) — Several statable headline theorems are absent

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:34`: “whose carrier belongs to `RepresentationTheory/CharacterTheory`”; also the missing signatures for README 6.2–6.3 and the nonpivotal part of 11.4.
**Claim:** The `FDRep` comparison is statable now. Nonpivotal global dimension needs only a short sum using existing simple representatives and self-bidual isomorphisms; its nonvanishing, pseudo-unitary existence/uniqueness and centre comparison are also statable. Finiteness of the centre's simple classes is absent too.
**Witness:** `Mathlib/RepresentationTheory/Character.lean:168` defines `FDRep.character`; `TauCeti/CategoryTheory/Monoidal/Pivotal/FrobeniusSchur.lean:287` defines the categorical indicator. The stated comparison and a four-line nonpivotal dimension definition both elaborate in scratch.
**Repair:** State `frobeniusSchurIndicator k V 2 = (Nat.card G : k)⁻¹ * ∑ g, V.character (g ^ 2)` under the README hypotheses. Define the squared-norm sum using `Classical.choice (TauCeti.nonempty_iso_rightDual_rightDual S.repr)` and state 6.2–6.3 and nonpivotal 11.4 against it, with the requisite hypotheses. State finiteness of `SimpleClasses (Center C)` under the fusion assumptions. The checks are respectively `1, −1, 0` on the three README representations, and dimensions `2, 4` for `Vec(C₂)` and its centre.

## R05 (P2) — Two centre targets are already supplied

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:356`: “with Hom-finiteness, finitely many simple classes and a simple unit”.
**Claim:** Hom-finiteness and simplicity of the centre's unit are presented as remaining targets, although both are already implemented at the pin.
**Witness:** `TauCeti/CategoryTheory/Monoidal/Center/Preadditive.lean:225` supplies `Center.instFiniteDimensionalHom`; `TauCeti/CategoryTheory/Monoidal/Center/Simple.lean:54` supplies `Center.instSimpleUnit`.
**Repair:** Move these two results into the exact supplier contracts with their file names and hypotheses. Keep semisimplicity and finiteness of simple classes as the new targets. For `Z(Vec(C₂))`, the supplied unit has endomorphism dimension 1; the new finite-class conclusion gives four classes.

## R06 (P3) — Restore the required target structure and per-definition Checks

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:168`: “**2.1 Scalar traces over a commutative ring.**”, and the other bold numbered paragraphs.
**Claim:** The `target-ids` gate fails. There are no `### k.n` headings, no layer Examples or Dependencies sections, and pooled layer Checks do not give each definition three discriminating tests. Several targets have no individual Needs clause or source locator.
**Witness:** The head has 21 bold numbered target groups, zero numbered subsection headings, zero `### Examples`, and zero `### Dependencies`; 3.1–3.2 have neither individual Needs clauses nor locators.
**Repair:** Convert the numbered paragraphs to mathematical `### k.n` subsections, retaining their numbers. Restore per-definition API bullets, three discriminating Checks, individual dependencies and exact locators; end each layer with Examples and Dependencies. For 3.1 use pairing value 11 on the displayed vectors, the zero pairing for `X=0`, and rejection of `S=ℚ²`. Replace the opening `## Summary` with `**Summary.**`; keep supplied-only material in ownership/contracts rather than empty target stubs.

## R07 (P3) — Resolve the positive-matrix supplier gate hit

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:130`, repeated at 229: “`Matrix.exists_mulVec_eq_smul_of_pos`”.
**Claim:** The worker's `readme-ids-missing` check fails on this identifier. It is a real pinned supplier, not a missing theorem of this roadmap; the gate's classification must be resolved without adding a local API theorem.
**Witness:** `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Positive.lean:232` declares precisely this theorem, with a nonempty finite index and strictly positive entries.
**Repair:** Cite that file and theorem in the supplier contract as prose, removing the two backticked occurrences that the checker misclassifies, and refer 5.1 to that contract. Alternatively use a library-only `#check` with its actual module import. Re-run the gate; retain the all-ones matrix check `Av = 2v`, `v=(1,1)`.

## R08 (P3) — The induction construction has the wrong source locator

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:349`: “as in the proof of [ENO] Theorem 2.15”.
**Claim:** That proof does not construct the displayed direct-sum induction functor or its two adjunctions. The cited proof establishes centre semisimplicity using weak Hopf algebras; using its already-semisimple centre to construct 11.1 would reverse the proposed dependency.
**Witness:** `eno` lines 834–844 prove Theorem 2.15 via a dual weak Hopf algebra. The underlying induction sum appears instead in Proposition 5.4, line 937, preprint p.21.
**Repair:** Cite ENO §5.8, Proposition 5.4, p.21, for the underlying-object formula. State separately the construction of the half-braiding and both adjunctions from 3.3–3.4, with their normalized maps and a source locator or explicit deduction; do not consume centre semisimplicity to prove 11.1. The underlying sum on `δ_e` in `Vec(C₂)` is `2δ_e`.

## R09 (P3) — The Lean acceptance file and README do not name the same targets

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:17`: “suggest Lean forms for particular milestones”; line 32: “`Center C ⥤ …`”.
**Claim:** The docstring does not describe the required headline acceptance test, reverses induction's direction, and many retained Lean names never appear in the README. Conversely, the README presents the undeclared `b.homDual` as an API name.
**Witness:** `squaredNorm_congr` at Lean line 144 has no README occurrence; `b.homDual` at README line 193 has no declaration. README 347 correctly gives induction's direction as `C ⥤ Center C`.
**Repair:** State that the file contains headline acceptance signatures against the pins, with README authoritative; correct induction to `C ⥤ Center C`. Name every retained headline declaration in its README target, and describe dual bases in prose without the undeclared field notation. Update the unavailable-headline list after R04; do not add API padding.

## R10 (P3) — The ribbon-centre target precedes its prerequisite

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:334`: “*Needs:* 10.1, 11.3”.
**Claim:** The unconditional ribbon-centre theorem in Layer 10 consumes semisimplicity constructed only in Layer 11, contrary to the advertised build order.
**Witness:** The local edge is `10.2 → 11.3`; 11.3 in turn consumes `11.2 → 11.1`. For `Vec(C₂)` the four central simple classes are established in 11.3, after 10.2 uses them.
**Repair:** Put the unconditional ribbon-centre corollary after 11.3 and record “Former 10.2 is now 11.5”, preserving citations. Layer 10 retains the general split-semisimple converse. Alternatively make 10.2 explicitly conditional on centre semisimplicity and discharge that premise in Layer 11.

## R11 (P3) — The description overstates the completed structural repairs

**Location:** Pull-request description: “The document now has the standard sections, conventions with Checks, a *Needs:* clause and Checks for every target, and section- or theorem-level locators.”
**Claim:** The head lacks several of those items. The description also omits the removal of 71 old Lean declarations and two standalone sections, although it correctly says this revises the existing roadmap and preserves layer numbers.
**Witness:** `TauCetiRoadmap/PivotalSpherical/README.md:187`–195 gives 3.1–3.2 without individual dependencies or locators; the base diff removes `Worked examples (acceptance criteria)` and `Ordering`, and 71 Lean declarations.
**Repair:** After completing R06, make the structural claim match the final head. Add: “This revision removes 71 old Lean declarations, replacing implemented targets by pinned supplier contracts and retaining new headline signatures; it folds the standalone worked-examples and ordering sections into the layer structure.” Update the counts if the next repair changes them.

## Verified sound

Headline inventory: ring scalar traces and pivotal-dimension invariance; split-family Hom freeness, perfectness and completeness; primitive Perron dominance; nonpivotal squared norms/global dimension and pseudo-unitary existence; `FDRep` indicator comparison; pointed pivotal/spherical classification and indicators; the pointed universal grading; the split-semisimple ribbon converse; centre induction, averaging, fusion finiteness, ribbon structure and dimension squaring.

The worker supplied no identifiable sampled targets (“none found by heading”). All 21 numbered target groups are included below, together with the retained Lean declarations, convention controls and finding witnesses. Values concern the specified mathematical constructions, not proofs supplied by `sorry`.

| Statement | Instances | Left side / construction | Right side / control | Result | Change |
|---|---|---|---|---|---|
| Right dual and double dual | `V=ℚ²`, `f=diag(2,3)` | `f* = diag(2,3)`, `f** = f` | Evaluation/coevaluation snake `I₂` | agrees | — |
| Pivotal convention | `Vecℤ`, `χ(n)=2ⁿ` | Pivot on degrees 1,2: `2,4` | Tensor of degree-1 pivots `2·2=4` | agrees | — |
| Left/right trace convention | Degree 1, `χ(1)=2`, `f=3` | Left `3/2`; right `6` | `3·(1/2)`; `3·2` | agrees | — |
| Cocycle normalization/pentagon | `C₃`, coboundary of `b(1,2)=2` | `ω(1,2,1)=1/2`; 81 pentagons hold | Each product of three cocycles equals product of two | agrees | — |
| Twisted duality/pivot sign | Same cocycle, degree 1 | Coevaluation `2`, pivot `1/2`; dimensions `1,1` | Inverse pivot `2` gives dimensions `1/4,4` | discriminates | — |
| Unconditional tensor-trace control | Matrix category, `E₁₂,E₂₁` | Tensor trace `(1,0)` | Product of traces `(0,0)` | correctly excluded | — |
| 2.1 left scalar trace; Lean 54 | `R=ℤ/4`, unit line, `f=2` | Left trace `2` | Scalar `2` times dimension `1` is `2` | agrees | — |
| 2.1 right scalar trace; Lean 59 | `Vecℤ/ℚ`, degree 1, pivot 2, `f=3` | Right trace `6` | `3·2=6` | agrees | — |
| 2.1 spherical scalar trace | `Vec(C₂)`, sign pivot, `f=3` | Spherical trace `−3` | `3·(−1)=−3` | agrees | — |
| 2.1 product invariance; Lean 65 | Degree 1, pivots `2ⁿ,3ⁿ` | `(1/2)·2=1` | `(1/3)·3=1` | agrees | — |
| 2.1 scalar-unit multiplicativity | Vector spaces of dimensions 2,3 | Tensor dimension `6` | `2·3=6` | agrees | — |
| 2.1 nonscalar object | `S=ℚ²`, `f=E₁₁` | Trace `1`; End dimension `4` | Scalar matrices have equal diagonal entries; `E₁₁` does not | excluded | — |
| 3.1 composition pairing | `S=ℤ`, `X=ℤ²`, vectors `(1,2),(3,4)` | Composition scalar `11` | Dot product `3+8=11` | agrees | R06 |
| 3.1 bilinearity/composition | Same vectors, scale first by 2 | Pairing `22` | `2·11=22` | agrees | R06 |
| 3.1 zero and nonexample | `X=0`; `S=ℚ²` | Zero pairing `0`; no scalar inverse for `M₂(ℚ)` | Identity of zero `0`; scalar-surjectivity false | discriminates | R06 |
| 3.2 dual basis; Lean 96 | `S=R`, `X=R²`, `R=ℤ,ℤ/4` | Pairing matrix `I₂` | Kronecker entries `1,0,0,1` | agrees | R09 |
| 3.2 basis independence | Bases `(e₁,e₂)` and `(e₁,e₁+e₂)` | Both dual-tensor sums represent `I₂` | Zero tensor represents `0`, not `I₂` | agrees | — |
| 3.3 family definition; Lean 77 | Finite-support `ℤ`-graded complex spaces | Infinitely many indices; each object finite support | Different grades have Hom `0`; each line End `ℂ` | agrees | — |
| 3.3 family negative control | Repeat the same nonzero simple twice | Off-diagonal Hom contains identity `1` | Hom-orthogonality requires `0` | excluded | — |
| 3.3 zero-ring family | Zero ring, any grade set | All Hom modules `0`, scalar map bijective | All identities `0`; empty sum `0` | agrees | — |
| 3.3 free finite Hom; Lean 91 | `S=R`, `X=R²` | Hom module `R²`, rank `2` | Decomposition multiplicity `2` | agrees | — |
| 3.3 perfectness | Same object, and `X=0` | Gram determinants `1` and empty determinant `1` | Duality maps identities on `R²` and `0` | agrees | — |
| 3.3 completeness; Lean 102 | `X=R²`; `X=0` | Sum `E₁₁+E₂₂=I₂`; empty sum `0` | Identities `I₂`; `0` | agrees | — |
| 3.3 support condition | `X=δ₀⊕δ₁`, retain only index 0 | Partial sum `diag(1,0)` | Identity `diag(1,1)`; omitted grade has nonzero Hom | excluded | — |
| 3.3 functorial factorization | `F=id`, `T=S=R`, `B=R²` | Constituent dual tensors sum to `I₂` | Canonical tensor represents `I₂` | agrees | — |
| 3.4 field case; Lean 113 | `Vecℤ/ℂ`, object `δ₀⊕δ₁` | Two summands, Hom ranks `1,1` | Simple-class index set `ℤ`, not finite | agrees | — |
| Supplied fusion matrix convention | `Vec(C₃)`, left multiplication by generator | Row `T` has 1 in column `gT` | Dual generator's matrix is the transpose | agrees | — |
| Supplied complex character duality | `C₃`, character `ζ`; `S₃`, sign | Values on inverses `ζ²,−1` | Conjugates `ζ²,−1` | agrees | — |
| 5.1 primitive dominance; Lean 122 | All-ones `2×2`; `1×1 [2]` | Spectral radius `2`; other eigenvalue `0` | `0<2`; no other eigenvalue for `[2]` | agrees | — |
| 5.1 excluded cases | Empty matrix; swap matrix; `[0]` | No eigenvalue; eigenvalues `1,−1`; radius `0` | Empty excluded; swap and `[0]` not primitive | discriminates | — |
| Positive Perron supplier | All-ones matrix, `v=(1,1)` | `Av=(2,2)` | `2v=(2,2)` | real supplier | R07 |
| 6.1 doubleDualTrace; Lean 135 | Ordinary vector spaces, `a=diag(2,3)` | Trace `5` | Sum of diagonal entries `2+3=5` | agrees | — |
| 6.1 squaredNorm; Lean 140 | One-dimensional `a=2`, then `a=3` | `2·(1/2)=1` | `3·(1/3)=1` | agrees | — |
| 6.1 independence; Lean 144 | `R=ℤ/4`, unit scalars `1,3` | `1·1=1`; `3·3=1` | Same squared norm `1` | agrees | — |
| 6.1 independence negative control | `ℚ²`, `a=I₂`, `b=diag(2,1)` | `Tr(a)Tr(a⁻¹)=4` | `Tr(b)Tr(b⁻¹)=3·(3/2)=9/2` | scalar hypothesis needed | — |
| 6.1 pivotal comparison; Lean 151 | Degree 1, pivot 2; `ℚ²`, standard pivot | Squared norms `1,4` | Dimension products `(1/2)·2=1`, `2·2=4` | agrees | — |
| 6.2 nonpivotal sum/comparison | `Vec(C₂)` in characteristic 0 and 2 | Squared-norm sums `2,0` | Pivotal global dimensions `2,0` | agrees | R03, R04 |
| 6.2 nonvanishing | Same categories | `2≠0` in characteristic 0 | `2=0` in characteristic 2 | correct boundary; route incomplete | R02 |
| 6.3 pseudo-unitary existence | `Vec(C₂)`, pivots `+1,−1` | Both global dimensions `2` | FP dimension `2`; only positive pivot has dimensions `1,1` | missing acceptance theorem | R02, R04 |
| 6.3 non-pseudo-unitary control | Fibonacci and Yang–Lee | Global dimensions `1+φ²`, `1+φ⁻²` | FP dimension `1+φ²`; second value differs | agrees | — |
| 7.1 indicator comparison | `C₂` sign; quaternionic `Q₈`; nontrivial `C₃` character | Rotation traces `1,−1,0` | Character sums divided by order: `2/2`, `−8/8`, `0/3` | statable | R04 |
| 8.1 category/tensor | `G=S₃`, `g=(12)`, `h=(23)` | Degrees `gh=(123)`, `hg=(132)` | Opposite order gives different degree | discriminates | — |
| 8.1 support/projectivity | `R=ℤ`, `δ₁⊕δ₋₁`; torsion `ℤ/2` | Support size `2`; dual snakes `I` | Torsion component is not projective | excluded nonexample | — |
| 8.1 cohomologous associators | The displayed `C₃` coboundary | Tensorator coefficient `b(1,2)=2` | Coboundary yields `ω(1,2,1)=1/2` | agrees | — |
| 8.2 automorphism/pivotal classification | `R=ℤ,G=C₂`; zero ring | Character counts `2,1` | Pivotal structure counts `2,1` | agrees | — |
| 8.2 noncyclic scalar units | `R=ℤ/8`, units `3,5` | `3²=5²=1`, `3·5=7` | Subgroup has four elements, exponent 2 | field-reduction shortcut excluded | — |
| 8.3 spherical criterion | `C₂` sign; `ℤ` character `2ⁿ` | Dimensions `−1,−1`; `1/2,2` | Character squares `1`; `4≠1` | both directions distinguished | — |
| 8.4 indicator formula | Untwisted `C₂`, sign/trivial pivots | Second indicators `−1,+1` | `χ(g)⁻¹` is `−1,+1` | agrees | — |
| 8.4 cocycle indicator | `C₃` coboundary, canonical pivot, `n=3` | Cocycle product `2·(1/2)=1` | Indicator of order-three line `1` | agrees | — |
| 8.4 completeness boundary | `G=ℤ`, generator, pivots `2ⁿ,1` | All positive generator indicators `0,0` | Distinct pivotal components `2,1` | correctly non-complete | — |
| 8.4 torsion completeness | `g` of order `m` | `ν_m=χ(g)⁻¹u`, cocycle product `u∈Rˣ` | Recover `χ(g)=(ν_m u⁻¹)⁻¹` | agrees, including zero ring | — |
| 9.1 universal grading | `Vec(C₂)`; `Repℂ(S₃)` | Universal groups `C₂`; trivial group | Adjoint sectors `Vec`; all of `Rep(S₃)` | agrees | — |
| 9.1 adjoint-generator control | `X=1⊕g` in `Vec(C₂)` | `X⊗X*=2·1⊕2·g` | Simple `g⊗g*=1` | nonsimple generator excluded | — |
| 10.1 split converse; Lean 169 | Standard `Vecℤ/ℂ` | Left/right dimensions `1,1`; twist `1` | Dual twist `1`; infinitely many simples | agrees | — |
| 10.1 semisimplicity control | `FDRep F₃ C₃`, generator `I+N` | For equivariant `f=aI+bN`, both traces `2a` | Dual twist `(I+N)⁻ᵀ=I−Nᵀ`, not `I+Nᵀ` | spherical but not ribbon | — |
| 10.2 ribbon centre; Lean 200 | `Z(Vec(C₂))/ℂ` | Standard central twists `±1` | Dual twists `±1` | mathematical check passes | R01, R10 |
| 11.1 induction | `Vec(C₂)`, `X=δ_e` | Underlying `I(X)=2δ_e` | Central decomposition `(e,+)⊕(e,−)` | agrees | R08 |
| 11.1 both adjunctions | Same `X`, `Z=(e,+)` | Hom dimensions `HomZ(IX,Z)=1`, `HomZ(Z,IX)=1` | Corresponding underlying Hom dimensions `1,1` | agrees | — |
| 11.1 exactness/faithfulness | Same category, scalar map `2` | Induced underlying map `2I₂` | Nonzero; kernels and cokernels transported componentwise | agrees | — |
| 11.2 normalized averaging | Centre unit over `ℂ`; rescale adjunction unit by 3 | Normalized composite `2·id`; rescaled `6·id` | Global dimension times identity `2·id` | normalization discriminates | — |
| 11.3 semisimplicity; Lean 190 | `Vec(C₂)` in characteristic two | Centre has indecomposable nonsplit Jordan block | Semisimple decomposition would have generator `I₂`, not `I₂+N` | false Lean signature | R01 |
| 11.3 finite classes | `Z(Vec(C₂))/ℂ` | Four pairs `(g,χ)` | `2·2=4` | headline absent in Lean | R04 |
| 11.3 Hom-finiteness/unit | Same centre | Unit End dimension `1`, simple Hom dimensions `0` or `1` | Native instances give the same bounds and simple unit | already supplied | R05 |
| 11.4 dimension; Lean 194 | `Vec(C₂)/ℂ` | Centre dimension `4` | Base dimension squared `2²=4` | agrees in intended scope | R04 |
| 11.4 lost splitting hypothesis | `Vecℝ(C₃)` | Centre dimensions per grade `1,2`; total `3(1²+2²)=15` | Base dimension squared `3²=9` | false Lean signature | R01 |
| Source A.5 splitness control | Real rotation simple of `C₃`, complex structure `J` | Nonzero contraction has value `Trℝ(J)=0` | Source conclusion requires nonzero scalar | source error | see Source issues |
| README target/section form | Head's numbered paragraphs | 21 target groups; 0 numbered subsection headings | Gate expects recognized headings; 0 Examples/Dependencies | fails form | R06 |
| README/Lean names | `squaredNorm_congr`; `b.homDual` | First: Lean occurrences positive, README `0` | Second: README occurrences positive, declarations `0` | mismatch | R09 |
| Local build order | Ribbon-centre target | Dependency `10.2→11.3` | Increasing target order would require `11.3` first | forward edge | R10 |
| PR description | Per-target Needs assertion | Targets 3.1,3.2 each have `0` Needs clauses | Prose asserts a clause for each: `1` | contradicted | R11 |

- Sources: all 11 claim-level citation groups examined across 5 cited texts; ENO Proposition 2.1/Definition 2.2/Theorem 2.3 (lines 157–184), Theorem 2.15 (273), Proposition 8.23 (1545); no README locator is marked unverified.
- Further source witnesses: EGNO Example 2.3.8 (1795), Proposition 2.6.1 (2086–2104; its classification continues on p.34), Theorem 3.2.1 (2926); DGNO Proposition 2.3 (307); HPT Proposition A.4 (1692); NS Definition 3.1 (360); ENO induction correction (937).
- Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; 17 actual declarations checked with `#check @`; the worker's eighteenth entry is a comment-parser artifact, not a declaration; 3 real binder losses, all restored by the scratch `include k` repair.
- Native witnesses opened: `Mathlib/CategoryTheory/Endomorphism.lean:34`, `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean:89`, `Mathlib/RepresentationTheory/Character.lean:168`, `TauCeti/CategoryTheory/Semisimple/Basic.lean:56`; the latter requires finite decompositions, not finitely many simple classes.
- Further native witnesses opened: `TauCeti/CategoryTheory/Monoidal/Pivotal/Tensor.lean:164`, `TauCeti/CategoryTheory/Semisimple/Rigid.lean:89`, `TauCeti/CategoryTheory/Monoidal/Pivotal/PseudoUnitary/Existence.lean:161`, `TauCeti/CategoryTheory/Monoidal/Pivotal/FrobeniusSchur.lean:287`; near-match results checked against the pins, not treated as proofs.
- Cross-roadmaps: 5 closest scopes and 1 named supplier read; CharacterTheory's indicator resolved at `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:205` and 1158; 0 second copies, dropped-id overlaps, conflicting heads or outside-folder changes; 1 substantive ownership overlap remains.
- Dependency output: `depcheck: 244 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE; worker gate FAIL only on `readme-ids-missing=1`, `target-ids=1`; worker targeted build passes.
- Elaboration: original file passes with 14 `sorry` warnings only; all 14 admitted theorems resist `simp`, `rfl`, `infer_instance`; 17 signatures inspected; scratch centre repair, native `FDRep` comparison and nonpivotal dimension definition elaborate; 0 pull-request files edited.

Previous findings, checked individually against this head:

| Previous id | Disposition | Head passage / evidence |
|---|---|---|
| R01 | Repaired | README 173: “the hypothesis of `TauCeti.leftTrace_tensorHom_eq_comp` holds”; matrix counterexample retained at 81. |
| R02 | Repaired | README 59: “`End X` bundles a morphism”; Lean 56 uses `f.asHom`. |
| R03 | Repaired | Lean 77 has explicit family laws; 135–141 give real trace/norm bodies; admitted data count 0. |
| R04 | Partly repaired | README 99: “implemented at the pin and is consumed”; two supplied centre properties remain targets (R05). |
| R05 | Repaired | #2308 README 141: “Layer 3.3, Split simple families”; it now consumes this roadmap's general API. |
| R06 | Repaired | README 197: “`ι` arbitrary”; 209: “no finiteness of `SimpleClasses C`”. |
| R07 | Partly repaired | README 244: “Global dimension without a pivotal structure”; source generality restored, but R02/R04 remain. |
| R08 | Repaired | README 329: “No finiteness of simple classes and no characteristic hypothesis is needed.” |
| R09 | Repaired for the named old targets | README 137, 139, 147 cite native pseudo-unitary uniqueness, ordinary trace and pivotal/balanced equivalence. |
| R10 | Repaired | README 296: “spherical iff `χ(g)² = 1`”; 298–301 gives the indicator formula and torsion boundary. |
| R11 | Repaired | README 226: “nonempty finite index type”; Lean 123 retains `[Nonempty n]`. |
| R12 | Repaired | README 67: “component `ω(g, g⁻¹, g)`”; lines 77–80 give the numerical inverse-pivot control. |
| R13 | Partly repaired | README 85 adds “Exact supplier contracts”; target headings and per-definition structure remain incomplete (R06). |
| R14 | Partly repaired | README 381 correctly places Perron theory at §§3.2–3.3; missing claim locators and induction mislocator remain (R06/R08). |
| R15 | Repaired | Mathematical files contain no numbered pull-request citations; `prnum=0`. |
| R16 | Repaired | Old TODO/status narrative absent; `residue=0`. |
| R17 | Repaired | Lean 67 supplies `P,Q` explicitly; no local-instance signatures remain. |
| R18 | Repaired for the old names | README 102–103 imports both double-dual structure-map names; old local pairing-name claim absent. |
| R19 | Repaired | The old unit, dimension-specialization and inhabitedness declarations are absent; new probes yield no one-tactic proof. |
| R20 | Repaired | README 128: “needs rigidity but no pivotal structure”; pinned `Semisimple/Character.lean:108` agrees. |
| R21 | Repaired | Description calls ring dual-basis and `Vec^ω_G` constructions “targets”; no longer claims their missing implementations exist. |

Overlap check: read PresentationsOfMonoidalCategories, OcneanuRigidity, CategoricalOperatorAlgebras, QuantumGroups and TemperleyLieb; split-family duality belongs to PivotalSpherical and #2308 consumes it; nonpivotal dimensions are claimed by both PivotalSpherical and #2316 (R03); general pivotal/trace/centre foundations belong to PivotalSpherical and the pins, analytic refinements to CategoricalOperatorAlgebras, quantum-group instances to QuantumGroups, diagram instances to TemperleyLieb.

Source independence: 16 passages compared with 5 cited sources, no expressive copying or imported tables/figures found; largest share ENO, 5 of 11 claim-level citation groups, bibliography excluded. ENO's section outline (lines 34–75 and section headings) and EGNO's contents compared: no one-to-one source-order plan. The actual dependencies 3.3→11.1→11.2→11.3 and 8.1→8.2→8.3/8.4 derive from the constructions; R10 identifies the local ordering defect.

## Not verifiable

- The brief names a 15-target seeded sample but supplies no target IDs and says none were found by heading; all 21 explicit target groups were reviewed instead.
- `freyd-yetter` remains settled uncertified; its original wording was not re-requested. This head consumes the pinned Freyd–Yetter identity rather than adding a source-dependent target.
- The ring extensions and the normalized nonpivotal induction construction have no claim-level source locator supplied for several of their assertions; the table records concrete mathematical tests, not source certification of those general constructions (R06/R08).

## Source issues

- **Error** in hpt at Lemma A.5, p.46: the source says arbitrary nonzero evaluation-type and coevaluation-type maps for a simple object compose nontrivially over any field; it should require split simple endomorphisms; affects a stated result.

## For the human reviewers

- none
