# Review of FiniteGroupInvariants (pull request #1708 at 60b9e45)

**Verdict:** accepted

This is an incremental re-review of the 26 lines changed since `d5204cb`. All of them are in `TauCetiRoadmap/FiniteGroupInvariants/README.md`:

- the InductionRestriction Layer 7 clause of the `## Scope and ownership` bullet (lines 59–62);
- 4.4 *Stem groups*: the multiplier sentence (865), the Tau Ceti sentence and its new caveat (868–875), and the new second Check (881–885);
- the curtis-reiner-1962 entry of `## References` (1732–1733).

`Suggested.lean` and `metadata.toml` are byte-identical to `d5204cb`. Nothing outside the roadmap folder changed.

No findings.

## Previous findings

- R01 — repaired: "For an algebraically closed field `k`, Tau Ceti proves the existence of a finite stem extension `π : E → G` whose character transgression `Hom(ker π, kˣ) → H²(G, kˣ)` is bijective … These theorems do not identify `ker π` with `M(G)`" (868–875). Line 865 now reads "a quotient of `M(G) = H₂(G, ℤ)`".
- R02 — repaired: the clause ", which landed after this repository's Tau Ceti pin" is gone. Line 873 now ends "…`RepresentationGroup/{Basic,Lifting}.lean`)."

## Verified sound

### The changed passages

| Passage | Checked against | Outcome |
|---|---|---|
| Scope 59–62: InductionRestriction Layer 7 owns "the group `H²(G, kˣ)` of factor-set classes, which is `TauCeti.schurMultiplier` and not the integral multiplier `M(G)` below" | InductionRestriction README on main (`9ce8311`): Layer 7 heading at 721 ("…factor sets, and the Schur multiplier"), `TauCeti.schurMultiplier` at 731, `H²(G, kˣ)` classifying factor sets at 781–782, representation group as Schur cover at 817–818. The open revision (#1187 head) has the same content at 722, 732 and 819. Tau Ceti defines `schurMultiplier k G := H2 (Rep.ofMulDistribMulAction G kˣ)` at `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148` (branch pin `358314d`) and `:122` (main's pin `2fd255d`). Its docstring describes the group as the classes of factor sets of projective representations. `M(G) = H₂(G, ℤ)` is defined three lines later in the same bullet. | sound |
| 4.4 line 865, "a quotient of `M(G) = H₂(G, ℤ)` by InductionRestrictionPartII §RS.0.1" | Same supplier and statement as r8, which verified it at the InductionRestrictionPartII head (§0.1 at 312, stem surjectivity of `τ_S` at 337). Only the name changed: "the Schur multiplier" is now `M(G)`. | sound |
| 4.4 lines 868–873, the Tau Ceti sentence | Tau Ceti `2fd255d`. `RepresentationGroup/Basic.lean:54–63`: `[Field k] [IsAlgClosed k] [Group G] [Finite G]` give a finite `M` and a factor set `α` such that `ker (rightHom α) ≤ center`, `ker ≤ commutator`, and `α.characterTransgression (A := kˣ)` is bijective. `GroupExtension/Character/Basic.lean:59`: `characterTransgression` goes from the equivariant characters `M → kˣ` (trivial action) to `H2 (Rep.ofMulDistribMulAction G kˣ)`, which is `Hom(ker π, kˣ) → H²(G, kˣ)` as written. `Lifting.lean:46–55`: one finite stem `p : E →* G` lifts every `q : G →* PGL(ι, k)` with `[Fintype ι]` ("finite-dimensional"). Its proof builds `E` as the extension of `Basic.lean:59` and lifts through `exists_lift_pgl_of_characterTransgression_surjective`, so a single `E` has both properties, as the sentence says. | sound |
| 4.4 lines 874–875, "do not identify `ker π` with `M(G)`… need not be a Schur cover" | `Lifting.lean:22` says that no identification of the kernel with integral second homology is asserted. `Basic.lean:31–33` says the kernel has order prime to the characteristic. "Need not" is witnessed by the new Check (row below). | sound |
| 4.4 second Check, lines 881–885 | computed below | sound |
| References 1732–1733, curtis-reiner-1962 "§36, §70" | The body cites §70 at 1052 and 1085 (6.4, 6.5) and §36 at 1657, 1668 and 1687–1688 (10.5). The entry now lists both. This settles r8's remark on untouched text. | sound |

The diff adds no object and no supplier. It changes no `*Needs:*` line and no `### Dependencies` line, and adds no source citation beyond the §70 locator, which the body already used.

### Gate, dependency check, elaboration, signatures

- **Worker's gate at this head (`gate.md`):** every check 0, `build=0 OK`.
- **My gate runs:**
  - The brief's gate command with the configured order gives every check 0 except `depcheck: NOT IN ORDER: FiniteGroupInvariants (insert it after its last supplier)`. That order does not list this roadmap yet, which is not a finding.
  - With `--order` set to the candidate merge order and `--build`, the run gives `set_option=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Dependency check** (the brief's `--depcheck … --movable` command against the candidate order and the content checkout): `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The candidate order lists InverseGaloisAndArithmeticFundamentalGroups at line 54, ArithmeticStatisticsPartV at 56, ArithmeticGaloisRepresentations at 58, InductionRestrictionPartII at 64 and FiniteGroupInvariants at 65. RepresentationTheory/InductionRestriction is on main.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteGroupInvariants'` is empty, and so is the diff of `lake-manifest.json`, `lean-toolchain` and the lakefiles. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- **Pins:**
  - The branch pins Tau Ceti `358314d` and Mathlib `f6090c7`; main pins `2fd255d` and `1b1ccf4`. The branch does not touch the manifest, so the merge takes main's pins.
  - The two `RepresentationGroup` names cited in 4.4 exist at `2fd255d` (lines above) and not at `358314d`.
  - `TauCeti.schurMultiplier` exists at both pins.
  - The three `TauCeti.*` modules that `Suggested.lean` imports (`GroupTheory/SpecificGroups/CFSG/Classification`, `RepresentationTheory/CharacterTable/Table`, `RingTheory/KrullSchmidt/Indecomposable`) exist at `2fd255d`.
- **Elaboration:** `lake env lean` of `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` exits 0 with exactly 53 warnings, all `declaration uses 'sorry'`. There is no error and no other diagnostic.
- **Signatures:** I elaborated the scratch file of 95 `#check @…` lines (one per declaration) once: exit 0, no error. The declarations next to the diff elaborate as `IsStemGroup : (G : Type u_1) → [Group G] → Prop` and `exists_isoclinic_isStemGroup : ∀ (G) [Group G] [Finite G], ∃ H _ (_ : Finite H), IsStemGroup H ∧ Isoclinic G H`. Both match README 4.4. No signature changed, since the file is unchanged.
- **Headlines and padding:** unchanged since `9ec616f`, with 53 sorried theorems. The module docstring names the character form of Herbrand's theorem (9.3) as not statable. The one-tactic probe of r5 found nothing that closes, and that result carries over. The two Tau Ceti theorems and the Schur-cover existence in 4.4 belong to suppliers (Tau Ceti, InductionRestriction Layer 7, IG.3.4), so they are rightly not headlines here.
- **Citation leads** (`citations.md`, 4 names): unchanged since r7. `GaloisRep.traceField`, `GaloisRep.imageAlgebra` and `GaloisRep.realizable_iff_imageAlgebra_split` are ArithmeticGaloisRepresentations §5.5 names. `Gassmann.almostConjugate_iff_permutation_equiv` is InductionRestriction §2.1's. None is a library declaration claimed at the pins.
- **Overlaps and ownership:** `overlaps.md` lists no open pull request that changes this roadmap, no dropped id, and no id that only an open revision defines. The closest roadmap whose ownership the diff touches is InductionRestriction (#1187). Its open head keeps Layer 7 and `TauCeti.schurMultiplier` at the lines above. This roadmap still owns only isoclinism and stem groups (Scope 70–71).

### Adversarial table

Rows computed at this head for the changed statements:

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 4.4 Check 2, `H²(C₂ × C₂, 𝔽̄₂ˣ) = 0` | `x ↦ x⁴` on `𝔽̄₂ˣ`; `4 · H²` | `𝔽̄₂ˣ` has odd-order torsion only (`x² = 1 ⇒ (x − 1)² = 0 ⇒ x = 1`) and is divisible, so `x ↦ x⁴` is an automorphism and induces one on `H²`; that induced map is `4 · id = 0`, so `H² = 0`. Universal coefficients agree: `Hom(M(G), kˣ) ⊕ Ext(G^ab, kˣ) = Hom(C₂, 𝔽̄₂ˣ) ⊕ 0 = 0`. | sound |
| 4.4 Check 2, the identity extension | `π = id : C₂² → C₂²` over `𝔽̄₂` | `ker = 1 ≤ Z ∩ [G, G]`, so `π` is stem. `Hom(1, kˣ) = 0 → H² = 0` is bijective. A projective representation's obstruction lies in `H² = 0`, so it lifts to `G → GL_n(k)` itself. `|ker| = 1` against `|M(C₂²)| = 2`, while `|D₄| = |Q₈| = 8 = 4 · 2`. | sound |
| 4.4 Check 2, over `ℂ` | `C₂²`, `ker π` central in a finite `E` | `ker π` is finite abelian, so `|Hom(ker π, ℂˣ)| = |ker π|`; bijectivity onto `H²(C₂², ℂˣ) ≅ Hom(C₂, ℂˣ) = C₂` gives `|ker π| = 2`, the kernel order of `D₄ → C₂²` and `Q₈ → C₂²` | sound |
| 4.4 lines 874–875, the caveat in both directions | char `2` with `M(C₂²) = C₂`; char `p ∤ |M(G)|` | The first instance is Check 2: not a Schur cover. In the second, `ker π` is a quotient of `M(G)` (RS.0.1) and so of order prime to `p`, so `|ker π| = |Hom(ker π, kˣ)| = |H²(G, kˣ)| = |M(G)|`, giving a Schur cover. "Need not" is exactly as strong as the instances allow. | sound |
| 4.4 line 865, kernel a quotient of `M(G)` | `1`; `C₈ → C₄`; `D₄ → C₂²`; `S₃` | r8's values, statement unchanged except the name `M(G)` | sound (r8) |
| Scope 59–62, `TauCeti.schurMultiplier` is `H²(G, kˣ)`, not `M(G)` | `C₂²` over `𝔽̄₂`; `C₂²` over `ℂ` | `schurMultiplier 𝔽̄₂ C₂² = 0`, while `M(C₂²) = C₂`, so the two differ. Over `ℂ` both have order `2`, isomorphic only through universal coefficients. | sound |

Rows for sampled targets that r8 did not carry, computed at this head (all in untouched text):

| Sampled target | Instances | Values | Result |
|---|---|---|---|
| 1.2 metacyclic | `C₂³`; `A₄`; `Q₈`; `C₂²` | For `C₂³`, cyclic normal subgroups have order `≤ 2` and the quotients `C₂²`, `C₂³` are not cyclic, so it is not metacyclic. `C₂²` is metacyclic (`C₂` with quotient `C₂`), so the class is not closed under products. For `A₄`, `⊥` has quotient `A₄` and `V₄`, `A₄` are not cyclic, so it is not metacyclic. For `Q₈`, `⟨i⟩ ≅ C₄` with quotient `C₂` makes it metacyclic, and its Sylow `Q₈` is not cyclic, so it is not a Z-group. | sound |
| 1.3 A-groups | `S₃`; `A₄`; `S₄`; `Q₈`; `C₂²` | Sylow subgroups `C₂, C₃` and `V₄, C₃` are abelian. `D₄` and `Q₈` are not, so `S₄` and `Q₈` are not A-groups. `C₂²` is abelian but has a non-cyclic Sylow, so it is an A-group and not a Z-group. | sound |
| 1.7 `e(G)`, `h(G)` | `1`; `C₃`; `C₆`; `S₃` | trivial group: empty product `1` and elementary, both sides true. `C₃ = C₁ × C₃`: `e = 3`. `C₆ = C₃ × C₂ = C₂ × C₃`: `e = 6`. For `S₃`, `p`-elementary means `C × P`, which is abelian, so `e = 1` and it is not elementary. | sound |
| 3.4 subgroup counts | `Q₈`; `S₃`; `C₆`; `1` | `Q₈`: `ch, n, c, s = 3, 6, 6, 6`. `S₃`: `3, 3, 4, 6`; `n ≠ c` and `c ≠ s`, with a non-normal `C₂`. `C₆`: `4 = d(6)` four times. Trivial group: `1, 1, 1, 1`. | sound |
| 4.3 isoclinism | `C₂ ~ C₄`; `D₄ ~ Q₈`; `S₃`, `C₂`; `C₂ ~ 1`; `G × A` | `C₂`, `C₄`: `G/Z = 1`, `G' = 1`. `D₄`, `Q₈`: `G/Z ≅ C₂²`, `G' ≅ C₂`. `S₃`, `C₂`: `|G'| = 3` vs `1`. `C₂ ~ 1`: classes `1` vs `0`, which is why the statement needs nonabelian groups; derived lengths also differ, `1` vs `0`. `G × A`: `Z = Z(G) × A` and `(G × A)' = G' × 1`. | sound |
| 6.5 rational representations | `Q₈`; `C₃`; trivial | `Q₈`: `m_ℚ(χ) = 2` (Hamilton quaternions over `ℚ`), `|o| = 1`, `χ(1) = 2`, `dim = 4`, character `2χ = (4, −4, 0, 0, 0)`. `C₃`: `m = 1`, `|o| = 2`, `dim = 2`, `ω + ω² = −1`. Trivial: `1 · 1 · 1`. | sound |
| 7.4 Bauer, Perlis | `ℚ(√2)`, `ℚ(√3)`; `ℚ(⁸√−15)`, `ℚ(⁸√−240)`; biquadratic | Coefficient of `2^{−s}`: `1`, `1` (both ramified). Coefficient of `3^{−s}`: `0` (`(2/3) = −1`, inert) and `1` (ramified). For `a = −15`, none of `±15, ±30` is a square, and the Galois closure has degree `32` (desmit-perlis lines 29–32). Normal `H ≠ K` of equal index: `|C ∩ H| ∈ {0, |C|}`, so Gassmann equivalence would force `H = K`. | sound |
| 9.1 Jordan–Zassenhaus | rank-1 `ℤ[C₂]`; `ℤ[C₂] ⊆ ℤ × ℤ`; `ℤ[x]/(x²)` | rank 1: `g ↦ ±1`, two classes. The image `{(a + b, a − b)}` is the same-parity pairs, of index `2`, and contains `2(ℤ × ℤ)` (`1 + g ↦ (2, 0)`), the bound `|C₂|`. For `ℤ[x]/(x²)`, `coker [[0, a], [0, 0]] = ℤ ⊕ ℤ/a`, pairwise distinct. | sound |
| 10.5 Jordan | `SL(2,5)`; `SL(2,p)`; Schur at `n = 0`; `ℚˣ` | `SL(2,5)`: `|SL(2,5)| = 120` with abelian normal subgroups `1` and `{±1}` only, indices `120` and `60`. `SL(2,p)`: index `p(p² − 1)/2` of `{±1}`, unbounded. Schur at `n = 0`: `(0 + 1)^0 − (0 − 1)^0 = 0 < 1`, hence `n ≥ 1`. `ℚˣ`: `index ⊥ = 0`, an infinite index excluded by the clause, and `A = B` has index `1`. | sound |

Carried from r8 (computed on unchanged text; see the r8 report): 3.6 divisions (`C₃`, `C₄`, `A₄`, `A₅`, `S₄`, `Q₈`), 4.2 the commutator map, 5.1 Möbius (`A₄`, `C₂²`, `C₆`, `1`), 5.4 permutation degree, 6.1 character fields, 6.8 `irrDegreeC_lt_top_iff`, 8.1 `b(ℚ, G)`, 9.2 Diederichsen–Reiner (`p = 2, 3, 23`: `3, 3, 7` classes), 9.3 Herbrand, 9.4 Kuroda and Kubota (`ℚ(√2, √3)`: `q = 4`; `ℚ(ζ₈)`: `q = 2`; `7` orbits), 10.1 lattices. Also carried from r8: its rows for the 4.4 multiplier statements (`C₂²` by `D₄` and `Q₈`, `A₅` by `SL(2,5)`, IG.3.4's `τ⟨ī, j̄⟩ = −1`), and through r7 the rows of 0.5, 3.5, 5.3 and 7.3. The remaining rows for the headline theorems are r5's 64 rows on `9402ec8`, carried by r6, r7 and r8. `Suggested.lean` is byte-identical at this head.

### Seeded sample

None of the fifteen sampled targets (1.2, 1.3, 1.7, 3.4, 3.6, 4.3, 5.1, 6.1, 6.5, 7.3, 7.4, 9.1, 9.2, 9.4, 10.5) lies in the changed passages.
- **Values:** the tables above give computed values for each, nine computed this round and six carried from r8.
- **Text and locators:** these are as earlier rounds verified them.
- **Sources:**
  - 6.5 and 6.4 depend on the changed References entry. Their §70 citation of curtis-reiner-1962 now agrees with it. That source is waived (below).
  - 7.4's desmit-perlis locator (lines 29–32) supports the degree-32 Check as written.

### Remarks on untouched text (no change requested)

- none.

## Not verifiable

These items are unchanged from r8:

- guralnick-1980 (uncertified): attribution through kunyavskii-2020 only.
- gaschutz (waived): checked through szechtman-2015.
- huppert-1954 and hall-1940: image-only GDZ scans, and this worker has no OCR. 4.3 and 4.4 cite hall-1940 pp. 132–135.
- Uncertified: huppert-eg1, isaacs, perlis-1977, guralnick-1982.
- Waived: robinson, aschbacher, curtis-reiner-1962 (including the §70 locator the diff adds to References), reiner-maximal-orders, karpilovsky, bbnwz, collins, hall-1936, johnson-1971.

## Source issues

- none
