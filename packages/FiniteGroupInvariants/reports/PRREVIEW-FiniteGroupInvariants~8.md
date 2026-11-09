# Review of FiniteGroupInvariants (pull request #1708 at d5204cb)

**Verdict:** needs changes

This is an incremental re-review of the 34 lines changed since `9ec616f`, all in `TauCetiRoadmap/FiniteGroupInvariants/README.md`:

- the InductionRestriction / IG.3.4 / InductionRestrictionPartII bullet of `## Scope and ownership` (56–68);
- the IG.3.4 paragraph of `### From InverseGaloisAndArithmeticFundamentalGroups` (195–198);
- the Layer 7 clause of `### From RepresentationTheory/InductionRestriction and InductionRestrictionPartII` (220–222);
- 4.4 *Stem groups* (864–874);
- Layer 4 `### Dependencies` (889–890).

`Suggested.lean` is byte-identical to `9ec616f`. Nothing outside the roadmap folder changed.

## R01 (P2) — 4.4 says Tau Ceti constructs a Schur cover; it constructs only a stem extension with bijective transgression

**Location.** `TauCetiRoadmap/FiniteGroupInvariants/README.md:867–869`: "Tau Ceti proves the existence of such a finite stem extension, lifting every projective representation over an algebraically closed field".

**Claim.** "Such" refers back to the previous sentence: a Schur cover, a stem extension whose kernel IG.3.4 identifies with `M(G) = H₂(G, ℤ)`. The two cited theorems prove less. For an algebraically closed `k`, `exists_finite_stem_factorSet_bijective_characterTransgression` (`RepresentationGroup/Basic.lean:59`) gives a finite central stem extension whose character transgression `Hom(ker, kˣ) → H²(G, kˣ)` is bijective. `exists_finite_stem_extension_lifting_pgl` (`Lifting.lean:46`) gives one finite stem extension over which every `G →* PGL(ι, k)` lifts. Neither theorem says anything about `M(G)`. In characteristic `p`, `H²(G, kˣ)` sees only the prime-to-`p` part of `M(G)`.

**Witness.** Tau Ceti `2fd255d`, `Lifting.lean:22`, disclaims any identification of the kernel with `H₂(G, ℤ)`. For `G = C₂ × C₂`, `k = 𝔽̄₂`: `H²(G, kˣ) = 0`, so the identity `G → G` satisfies both conclusions. The Schur covers `D₄` and `Q₈` have order `8`.

**Repair.** Replace the sentence with: "For an algebraically closed field `k`, Tau Ceti proves the existence of a finite stem extension of `G` whose character transgression `Hom(ker π, kˣ) → H²(G, kˣ)` is bijective, and over which every finite-dimensional projective representation over `k` lifts; it does not identify `ker π` with `M(G)`, and in characteristic `p` dividing `|M(G)|` such an extension need not be a Schur cover." Also write `M(G)` for "the Schur multiplier" at line 864. The Scope bullet (line 60) gives that name to `TauCeti.schurMultiplier`, which is `H²(G, kˣ)`, so the bound and its attainment should both name `M(G)`.

Tested on the refuting instance. For `C₂ × C₂` over `𝔽̄₂`, the repaired sentence asks only for a kernel with trivial character group, and the identity extension provides one. Over `ℂ` it gives `|Hom(ker π, ℂˣ)| = |H²(C₂ × C₂, ℂˣ)| = 2`, which agrees with `D₄` and `Q₈`.

## R02 (P3) — Time-relative clause about the Tau Ceti pin, false against main's pin

**Location.** `TauCetiRoadmap/FiniteGroupInvariants/README.md:870–872`: "in `TauCeti/RepresentationTheory/ProjectiveRepresentation/RepresentationGroup/{Basic,Lifting}.lean`, which landed after this repository's Tau Ceti pin".

**Claim.** The clause is process narrative of the kind the house style forbids: it describes the state of a pin at one moment. It is also false against the pin the merge brings.

**Witness.** Main's `lake-manifest.json` pins Tau Ceti at `2fd255d`, where `RepresentationGroup/Basic.lean:59` and `Lifting.lean:46` declare both theorems. Only the branch's base pin `358314d` lacks the `RepresentationGroup` folder.

**Repair.** Delete ", which landed after this repository's Tau Ceti pin" and keep the two names with their file path. Tested: both names resolve at `2fd255d`, at the lines above. The branch does not change `lake-manifest.json`, so merging takes main's pin.

## Previous findings

- none. The previous report (at `9ec616f`) raised no findings. Its remark on the curtis-reiner-1962 References entry concerns untouched text and is repeated under Verified sound.

## Verified sound

### The changed passages

| Passage | Checked against | Outcome |
|---|---|---|
| Scope 59–61, Layer 7 described as "representation groups, that is Schur covers, with their existence and lifting theorems" | RepresentationTheory/InductionRestriction README on main (`c44dcc8`), 817–822: a representation group (Schur cover) is a central extension with `M(G)` in the commutator subgroup through which every projective representation lifts; "This layer owns … the representation-group existence and lifting theorems". The same text is at line 822 of the open revision of InductionRestriction. | sound |
| Scope 61–63 and contract 195–198, IG.3.4 *Reduced Schur covers* | InverseGaloisAndArithmeticFundamentalGroups README at its open head `9432671`: §IG.3.4 heading at 3033; `M(G)` defined as Mathlib's `groupHomology.H2 (Rep.trivial ℤ G ℤ)` at 3042–3043; the target at 3102–3106 states that for finite `G`, a stem extension with `|ker π| = |M(G)|` has class map `τ_S : M(G) ≅ ker π`, as part of the target | sound; `groupHomology.H2` is at Mathlib `RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1061` at the pin |
| Scope 63–68, RS.0.1 and "InductionRestrictionPartII consumes them without owning them" | InductionRestrictionPartII README at its open head `ec14866`: scope 42–44 and contract 173–176 (Layer 7 supplies the covers, "Only this cover input is used"); §0.1 at 312, stem surjectivity of `τ_S` at 337 | sound. The repair fixes the earlier attribution of the Schur covers to these sections. |
| Contract 220–222 | as row 1 | sound |
| 4.4, "kernel of a stem extension is a quotient of `M(G)`; the bound is attained by a Schur cover" | RS.0.1 stem surjectivity; IR Layer 7; IG.3.4; computed rows below | sound (wording of "the Schur multiplier" folded into R01) |
| 4.4, the two Tau Ceti theorems | Tau Ceti `2fd255d` `RepresentationGroup/Basic.lean:52–63` (`[Field k] [IsAlgClosed k] [Group G] [Finite G]`; stem, central, bijective `characterTransgression`) and `Lifting.lean:39–55` (same binders; one `E` lifting every `q : G →* PGL(ι, k)`) | names and file exist at main's pin and are absent at the branch pin `358314d`; the description overclaims (R01, R02) |
| 4.4 `*Needs:*` and Layer 4 `### Dependencies` | the three suppliers the new prose uses | consistent; all three are earlier in the candidate merge order |

### Gate, dependency check, elaboration, signatures

- **Gate (worker, this head):** every check is 0, with `build=0 OK`.
  - **My run** of the brief's gate command (configured order) gives every check 0 except `depcheck: NOT IN ORDER: FiniteGroupInvariants`. That order does not list this roadmap yet, which is not a finding.
  - With `--order` set to the candidate merge order and with `--build`, the run gives `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Dependency check:** the brief's command, with `--movable`, the candidate order and the content checkout, prints `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The candidate order lists InverseGaloisAndArithmeticFundamentalGroups at line 54, InductionRestrictionPartII at 64 and FiniteGroupInvariants at 65. RepresentationTheory/InductionRestriction is on main.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteGroupInvariants'` is empty.
- **Elaboration:** `lake env lean` of `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` exits 0 with exactly 53 warnings, all `declaration uses 'sorry'`, and no other diagnostic.
- **Signatures:** the scratch file holds the module plus 95 `#check @…` lines, one per declaration. I elaborated it once: exit 0, no error. `IsStemGroup : (G) → [Group G] → Prop` and `exists_isoclinic_isStemGroup : ∀ G [Group G] [Finite G], ∃ H _ (_ : Finite H), IsStemGroup H ∧ Isoclinic G H` match README 4.4. No signature changed, since the file is unchanged.
- **Headlines and padding:** unchanged since `9ec616f`. There are 53 sorried theorems. The module docstring names the character form of Herbrand's theorem (9.3) as not statable. The r5 one-tactic probe found none that closes, and the result carries over. The Schur-cover existence the diff mentions is a supplier's (IR Layer 7, IG.3.4) and is rightly not a headline here.
- **Citation leads** (`citations.md`, 4 names): unchanged since r7. `GaloisRep.*` resolve to ArithmeticGaloisRepresentations §5.5. `Gassmann.almostConjugate_iff_permutation_equiv` resolves to InductionRestriction §2.1. The diff adds the two Tau Ceti names of R01 and R02, which resolve at `2fd255d`.
- **Overlaps and ownership:** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The open revision of InductionRestriction keeps its Layer 7 heading (line 722) and its ownership sentence. The diff adds no object; it corrects who owns the Schur covers.
- **Remark on untouched text** (no change requested): the References entry for curtis-reiner-1962 (README 1724–1725) names only §36, while 6.4 and 6.5 also cite its §70.

### Adversarial table

Rows computed at this head for the statements the diff touches:

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 4.4, kernel of a stem extension is a quotient of `M(G)` (RS.0.1) | `1`; `C₈ → C₄`; `D₄ → C₂²`; `S₃` | `ker ≤ Z(E) ∩ [E,E]` with `ker = E` forces `E = 1`, a quotient of `M(1) = 0`; kernel `C₂ ⊄ [C₈,C₈] = 1`, not stem, consistent with `M(C₄) = 0`; `C₂` a quotient of `M(C₂²) = C₂`; `M(S₃) = 0` | sound |
| 4.4, a Schur cover is a stem extension with kernel `≅ M(G)` | `C₂²` by `D₄` and `Q₈`; `A₅` by `SL(2,5)`; `Q₈`, `S₃` | `Z(D₄) = [D₄,D₄] = C₂`, `Z(Q₈) = [Q₈,Q₈] = {±1}`, both `= M(C₂²)`; `Z(SL(2,5)) = {±1} ≤ SL(2,5)'` (perfect), `M(A₅) = C₂`; `M(Q₈) = M(S₃) = 0`, cover the group itself | sound |
| IG.3.4 as cited, `τ_S` an isomorphism | `Q₈ → C₂²` | `τ⟨ī, j̄⟩ = ⁅i, j⁆ = −1 ≠ 1`, `C₂ → C₂` onto, hence bijective | sound |
| 4.4, the Tau Ceti sentence | `C₂²` over `𝔽̄₂`; `C₂²` over `ℂ` | `H²(C₂², 𝔽̄₂ˣ) = Hom(C₂, 𝔽̄₂ˣ) ⊕ Ext(C₂², 𝔽̄₂ˣ) = 0 ⊕ 0`, the identity extension (order 4) satisfies both theorems against a Schur-cover order of 8; over `ℂ`, `|ker| = |H²| = 2`, a cover, but only through universal coefficients, which Tau Ceti does not state | overclaim (R01) |

This round's seeded sample lies entirely in untouched text. I computed rows for the targets that r7 did not carry:

| Sampled target | Instances | Values | Result |
|---|---|---|---|
| 3.6 divisions | `C₃`; `C₄`; `A₄`; `A₅`; `S₄`; `Q₈` | `2` divisions vs `3` classes; `3 = d(4)`; `3` vs `4` (`(123)² = (132)`); `4` vs `5`; `5 = 5`; `5 = 5` (rational) | sound |
| 4.2 commutator map | `Q₈`; `S₃`; abelian `G` | `⁅i, j⁆ = ij(−i)(−j) = k² = −1`, `⁅i, i⁆ = 1`; `Z = 1`, image `{1, (123), (132)} = commutatorSet`; constant `1` | sound |
| 5.1 Möbius | `A₄`; `C₂²` (normal); `C₆`; `1` | `μ(A₄) = 1`, `μ(V₄) = μ(C₃) = −1`, `μ(C₂) = −(−1 + 1) = 0`, `μ(1) = −(1 − 4 − 1 + 0) = 4`; `−(1 − 3) = 2`; `μ(1, C₆) = μ(6) = 1`; `μ(1, 1) = 1` | sound |
| 5.4 permutation degree | `C₆`; `C₄ × C₄`; `Q₈`; `1`; `S₃` | `2 + 3 = 5 < 6`; `4 + 4 = 8 < 16`; every nontrivial subgroup contains `−1`, `8`; empty family, `0`; `3` | sound |
| 6.1 character fields | `C₃`, `χ(g) = ω`; `A₅` degree 3; trivial `χ` | `ℚ(√−3)`, orbit `{χ, χ̄}` of size `2`, conductor `3`; values `(1 ± √5)/2`, `ℚ(√5) ⊆ ℚ(ζ₅)`, conductor `5`; `ℚ`, conductor `1` | sound |
| 6.8 `irrDegreeC_lt_top_iff` | eight groups of r7 (`1`, `S₄`, `A₅`, `C₂ × A₅`, `A₅ × A₅`, `C₃ × S₃`, `C₄ × C₄`, `Q₈`) | r7's values; text and statement unchanged | sound (r7) |
| 8.1 `b(ℚ, G)` | `S_n`; `C₃ ≤ S₃`; `C₂²` regular | transposition index `n − (n − 1) = 1`, `b = 1`; 3-cycles index `2`, two classes, one division, `b = 1` vs `2` classes; each involution index `4 − 2 = 2`, three divisions, `b = 3` | sound |
| 9.2 Diederichsen–Reiner | `p = 2, 3, 23` | `h = 1, 1, 3`, so `3, 3, 7` classes; `p = 2`: `ℤ`, `ℤ⁻`, `ℤ[C₂]` | sound |
| 9.3 Herbrand | `ℚ`; `ℚ(√2)`; real biquadratic | `ε = 1`, index `2` in `{±1}`; `η = 1 + √2`, `ησ(η) = −1`, `η² · η⁻² = 1`, index `2 · 2 = 4`, character sign `= (1 + sign) − 1`; rank `3 = 4 − 1`, `ρ_reg − 1` | sound |
| 9.4 Kuroda, Kubota | `ℚ(√2, √3)`; `ℚ(ζ₈)`; orbit count | `4 · 1 = q · 1`, `q = 4`, `((√2 + √6)/2)² = 2 + √3`, `(√2 + √3)² = 5 + 2√6`, `σ(1 + √2) < 0` so `ε₁` not a square; `2 · 1 = q`, `q = 2`; subgroups of order `≤ 4` of `(ZMod 2)³` mod `S₃`: `1 + 3 + 3 = 7` (order 4: kernels of functionals of weight 1, 2, 3) | sound |
| 10.1 lattices | `n = 0`; `A = [[0,2],[1/2,0]]`; `diag(1,−1)` vs swap | trivial; `A² = 1`, `diag(1,2) A diag(1,1/2) = [[0,1],[1,0]]`; same eigenvalues `±1`, lattices `ℤ ⊕ ℤ⁻` vs `ℤ[C₂]`, distinct by 9.2 | sound |

These rows are carried from r7, which took them from r5's values on unchanged text:

| Target | Values | Result |
|---|---|---|
| 0.5 | `S₄`, `N = V₄`: `{C₂, C₃} + {C₂, C₂}`; `N = ⊤`: `∅ + factors(G)`; `A₅ × C₂`: length 2 vs `Ω(120) = 5` | sound |
| 3.5 | `S₄`: `1, 9, 8, 6`; `Q₈`: `1, 1, 6`; `C₄ × C₄`: `1, 3, 12` | sound |
| 5.3 | `C₂`: `1`; `C₂²`: `4 − 6 + 2 = 0`; `S₃`: `1`; `S₄`: `2` | sound |
| 7.3 | `ℤ`, `2ℤ`; `ℤ²`, `2ℤ × ℤ` vs `ℤ × 2ℤ`: `0` vs `2` fixed cosets; finite `Γ`, `N = ⊥` | sound |

The remaining rows for the headline theorems are those of r5 (64 rows, computed on `9402ec8`), carried forward by r6 and r7. `Suggested.lean` is byte-identical at this head.

### Seeded sample

None of the fifteen sampled targets (0.5, 3.5, 3.6, 4.2, 5.1, 5.3, 5.4, 6.1, 6.8, 7.3, 8.1, 9.2, 9.3, 9.4, 10.1) lies in the changed passages. Their text and locators are those verified by earlier rounds, and the tables above carry their values. The diff cites no new source.

## Not verifiable

These items are unchanged from r7:

- guralnick-1980 (uncertified): attribution through kunyavskii-2020 only.
- gaschutz (waived): checked through szechtman-2015.
- huppert-1954 and hall-1940: image-only GDZ scans, no OCR on this worker.
- Uncertified: huppert-eg1, isaacs, perlis-1977, guralnick-1982.
- Waived: robinson, aschbacher, curtis-reiner-1962, reiner-maximal-orders, karpilovsky, bbnwz, collins, hall-1936, johnson-1971.

The diff adds no source citation.

## Source issues

- none
