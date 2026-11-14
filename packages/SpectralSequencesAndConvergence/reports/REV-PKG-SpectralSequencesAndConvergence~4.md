<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6869958972 -->
Review (claude) of 95b9647

Verdict: needs_changes

1. **F01** (P3) the stabilisation page for `q ≥ b` is below page 2 when `q < a`

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:1080`: "stabilises from page
   `max(2, q − a + 2, b − q + 1)`: from page `b − a + 1` at most if `a ≤ q < b`, and from page
   `q − a + 2` with zero limit page if `q ≥ b`".

   **Claim:** for `q ≥ b` the maximum equals `q − a + 2`.

   **Witness:** the README says "No order between `a` and `b` is imposed" (line 1063). The zero spectral
   object has bounds `a = 5`, `b = 0`; at `q = 1 ≥ b`: `max(2, −2, 0) = 2`, while `q − a + 2 = −2`, and
   no page below `2` exists.

   **Exact repair:** replace "and from page `q − a + 2` with zero limit page if `q ≥ b`" by "and from
   page `max(2, q − a + 2)` with zero limit page if `q ≥ b`".

   **Repair tested:** `a = 5`, `b = 0`, `q = 1`: `max(2, −2) = 2 = max(2, −2, 0)`. For `ℤ →(×2) ℤ` in
   degree `1` (`a = −2`, `b = 0`) at `q = 0`: `max(2, 4) = 4 = max(2, 4, 1)`, and
   `EInfty 0 1 = F_1/F_0 = (ℤ/2)/(ℤ/2) = 0`. The clause `a ≤ q < b` is unaffected (`b − a + 1 ≥ 2`).

2. **F02** (P3) "first-quadrant filtered complex" is used and not defined

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:1813`: "For a first-quadrant
   filtered complex the regularity and lower-bound hypotheses hold, and the theorem reduces to 5.3."

   **Claim:** the term names a class of filtered complexes for which 7.5 reduces to 5.3.

   **Witness:** the term occurs only here (lines 593 and 863 define first-quadrant *spectral
   sequences*). Read as "`E_1` in the first quadrant" it does not give 5.3's hypotheses on
   `H^m(F^s K)`; read as a condition on the filtration it does.

   **Exact repair:** replace the bullet by: "For a filtered complex with `K^m = 0` for `m < 0`,
   `F^0 K = K` and `F^{m+1} K^m = 0` for every `m` (so `E_1^{p,q} = 0` unless `p, q ≥ 0`), the
   filtration is finite in each degree, hence exhaustive and complete, the spectral sequence is
   bounded, hence regular, and `E_1^{p,n−p} = 0` for `p < 0`; the theorem then gives the strong
   convergence that 5.3 gives."

   **Repair tested:** the complex of 5.3's second Check (`K^m = ℤ` for `m ≥ 0`, `d = 0`,
   `F^p K^m = ℤ` exactly when `p ≤ m`) satisfies the three conditions; `E_1^{m,0} = ℤ` lies in the
   first quadrant, every differential is zero, and both 5.3 and 7.5 give `gr^n H^n = ℤ = E_∞^{n,0}`.

Two findings, both P3 (P1 = 0, P2 = 0). The round-3 finding is repaired. The elaboration passes, no
sorried theorem is padding, the dependency check is clean, and all eight Lean statements survived
the computed checks below. Both findings are one-clause README repairs; no Lean signature changes.

## Verified sound

### The previous finding

`REV-PKG-SpectralSequencesAndConvergence~3` had one finding, F01 (P3); none was marked not
actionable. **Repaired.** `packages/SpectralSequencesAndConvergence/Suggested.lean:140` now reads
"the target of the first is the page object, by Mathlib's `spectralSequencePageXIso`". Checked at
the pin: `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:142` gives `mapFourδ₁Toδ₀'` as
`E(i₀ ≤ i₂ ≤ i₃ ≤ i₄) ⟶ E(i₁ ≤ i₂ ≤ i₃ ≤ i₄)`; the theorem applies it at
`(⊥, q − r + 2, q, q + 1, q + r − 1)`, and `HasSpectralSequence.lean:143` gives the recipe indices
`(q − r + 2, q, q + 1, q + r − 1)`, so the target is the page object. The repair report's second
change (`Suggested.lean:53`, "the inverse of `isoMapFourδ₁Toδ₀'` and … `isoMapFourδ₄Toδ₃'`") agrees
with `EpiMono.lean:191` and `:224`. Same pattern searched in README lines 194, 257–266, 1085–1098
and 1164: all directions correct.

### Elaboration, signatures, padding

- `lake env lean` on `Suggested.lean` from the content checkout: exit 0, eight "declaration uses
  `sorry`" warnings (lines 99, 111, 150, 175, 194, 224, 250, 270), nothing else. No `set_option`,
  no sorried data, `theorem` only, imports `Mathlib` and five `TauCeti.*` modules that exist.
- `#check @name` for all 11 declarations in a scratch copy: every binder of the README statements
  is present (`HasColimitsOfShape ℕ C`, `HasExactColimitsOfShape ℕ C`, `HasCountableProducts C`,
  `TauCeti.IsReplete C`, the four `ObjectProperty` classes). Nothing lost, nothing changed.
- One-tactic probe on all eight theorems with `simp`, `rfl`, `infer_instance` and `exact?`, one
  scratch file per tactic: all 32 attempts fail. No padding.
- All 11 Lean names occur in the README, and the README attributes no other backticked name to
  this roadmap.

### Adversarial table (sampled targets, headlines, findings)

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| 1.1 presentations | `B = 4ℤ ≤ Z = ℤ`: preimages of `0, 2ℤ/4, ℤ/4` are `4ℤ, 2ℤ, ℤ`. Inside `ℤ/4`, `(0, 2ℤ/4)` and `(2ℤ/4, ℤ/4)` both present `ℤ/2`. | sound |
| 1.4 limit page | `K = (ℤ →id ℤ)`, `F^p K^1 = ℓ^{p−1}ℤ`: `gr^0 K = ℤ[0]`, `gr^p K = ℤ/ℓ[−1]`; `Z_r(0,0) = ℓ^{r−1}ℤ`, `B_r = 0`, so `E_r ≅ ℤ`, `Z_∞ = 0 = E_∞`. If `E_r(pq) = 0` then `Z_∞ ≤ Z_r = B_r ≤ B_∞`. | sound |
| 2.2 and Lean 99, 111 | First quadrant, `β(n) = n + 1`, `α(n) = −1`, `e = 0`: leaving needs `r ≥ n + 2 − p = q + 2`, entering `r ≥ p + 1`; together `r > max(p, q + 1)`. At `(1, 0)`: `r ≥ 2`, targets `(3, −1)` and source `(−1, 1)` are zero. | sound |
| 3.1 filtrations | `ℓ`-adic `ℤ`: join `ℤ`, meet `0`, `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`. Zero filtration of `X ≠ 0`: meet `0`, join `0 ≠ X`, `lim X/0 = X`. `ℤᵒᵖ`-indexed: a morphism `op q ⟶ op p` exists for `p ≤ q`, so `F^q ≤ F^p`. | sound |
| 3.2 convergence | `d_1 = ×2`: `E_∞^{0,0} = 0`, `E_∞^{1,0} = ℤ/2 = gr^1 H^1`. Zero pages with constant `H^0 = ℤ`: all `gr = 0`, meet `ℤ ≠ 0`. | sound |
| 3.6 consequences | Two rows, `d_2 : (0,1) → (2,0)` an isomorphism: `(H^0, H^1, H^2, H^3) = (ℤ, 0, 0, ℤ)`. Extended five-term: `d_r` for `2 ≤ r ≤ m` meets rows `0 < q < m` only, so `E_{m+1}^{0,m} = E_2^{0,m}` and `E_{m+1}^{m+1,0} = E_2^{m+1,0}`; at `m = 0` the composite of the edge maps is `1 ≠ 0`. | sound |
| 4.1 towers | `×2` at native `(1, −1)`, `r = 3`: `Z_3 = ker(ℤ →×2 ℤ) = 0`. `Fin` recipe at pin: `i₀ = (q − (r − 2)).toNat`, `i₃ = clamp(q + r − 1)`; `l = 2, r = 3` gives `(0,0,1,2)`, `(0,1,2,2)`. Last Check: `H^0(1 ≤ 2) = ℤ ≠ 0` violates `isZero_H_obj_mk₁_i₃_le` at `(1, 0)`. | sound |
| 4.2 abutment | `n = 1`: `F^3 = abutmentFiltration (−1) 1 = im(ℤ → ℤ/2) = ℤ/2`, `F^4 = 0`. | sound |
| 4.3 comparison | Boundary side proved: a class of `H^n(q ≤ q+1)` dying in `H^n(q ≤ ⊤)` maps into `im(δ : H^{n−1}(j ≤ ⊤) → H^n(q ≤ j))`, which factors through `ker(H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)) = 0`. `×2` at `(3, −2)`: `max(2, 3) = 3`. | sound |
| 4.4, Lean 124, 150 | `×2`, `n = 1`, `a = −2`, `b = 0`: `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4`; `q = −2` needs `r ≥ max(2, 2, 3) = 3`; page 2 is `ℤ`, page 3 is `ℤ/2`. `a = −1` fails (`H^1(⊥ ≤ −1) = ℤ`). `ℤ[0]` with `G_j = 0`: top map `0 → ℤ` is mono, not iso; filtration not exhaustive. `a = 5`, `b = 0`, `q = 1`: see R01. | R01 |
| 4.5 quadrants | First: `a = min(0, n + 1)`, `b = n + 1`; outer terms `H^{n−1}(j ≤ ⊤)`, `H^n(j ≤ ⊤)` vanish for `j ≥ n + 1` (`isZero₂`). Third, `m = −2`: `a = −2`, `b = 1`, positions `(0,2), (1,1), (2,0)`; `(p, q)` carries `EInfty (m + p) m = EInfty (−q) m`. | sound |
| 4.6, Lean 175 | Proof route checked: page isomorphisms propagate, give `EInfty q n` for `a ≤ q < b`, then five lemma from `F_a = 0` to `F_b = H^n`. `ℤ[0] → (ℤ →id ℤ)` non-exhaustive: pages iso, `H^0`: `ℤ → 0`; excluded since the top map `ℤ → 0` is not iso. | sound |
| 5.3, Lean 194 | `K^m = ℤ` (`m ≥ 0`), `F^p K^m = ℤ` iff `p ≤ m`: `p₁ = n`, `p₀ = n + 2`, `gr^n H^n = ℤ`. `ℚ →×2 ℚ`: native page 2 has `ℚ` at `(1, −1)`, `(3, −2)`; sum `1 − 1 = 0 = 0 − 0`; with sign `(−1)^p` it is `−2`. `s = ∅`: all `H^n = 0`, both sums `0`. `v` of a zero object: `v = 2v`, so `0`. | sound |
| 5.4, Lean 224 | `Z_∞ = Z_r` from `F^s K^{n+1} = 0`; `B_∞ = Bᵗ` from the join on `K^{n−1}`; filtration of `H^n` zero from `−a`, exhaustive from the join on `K^n`. `ℤ → ℤ_ℓ`: pages iso, cokernel `ℤ_ℓ/ℤ`, no zero stage. | sound |
| 7.1 lim, lim¹ | Completeness ⇒ `lim¹ = 0`: with `τ_n = c − σ_n`, `τ_n − τ_{n+1} = σ_{n+1} − σ_n = π_n`, a section of `1 − s`. `×ℓ` tower: `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`. Constant `F^p = X`: `lim¹ = 0`, `lim X/F^p = 0 ≠ X`. | sound |
| 7.2, Lean 250, 261, 270 | Shear: compatible `(x_n, t)` satisfy `x_n − f_n x_{n+1} = π_n t`. Converse: kernels `K_n` have epimorphic transitions, six terms give `lim F ↠ F_0`. ML: stable images are an epimorphic subtower, quotient pro-zero. `ℤ/ℓ` with zero maps: `m = n + 1`; `×ℓ` on `ℤ`: images `ℓ^{k−n}ℤ` strictly decrease. | sound |
| 7.3 double tower | `i = ×ℓ`: `Q = 0`, `RQ = ℤ_ℓ/ℤ`, transition `×ℓ` bijective on `ℤ_ℓ/ℤ`; sequence `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0`. Constant: `0 → 0 → 0 → 0 → 0`. | sound |
| 7.4 (headline) | Limit step couple: `A_1^{+∞} = ℤ`, `A_0^{+∞} = 0`, `gr^0 = ℤ = E_∞^{0,0}`. Whole-plane example: `Z_r(−m, m−1)` everything for `r ≤ 2m − 1`, `0` from `2m`; `ker ∩ Im^r = ⨁_{i ≥ r−m} k`, `lim¹ = ∏/⨁`, `W^0 ≠ 0`. | sound |
| 7.5 complete convergence | `1 − s` invertible on `∏_s F^s K` gives `lim = lim¹ = 0` on `H^n(F^s K)`; half-plane: `coker i ⊂ E_1` (degree `n`), `ker i = im k` (degree `n − 1`). `ℤ_ℓ[0]`: `gr^p = 𝔽_ℓ`, `W = 0`. Third Check: see R02. | R02 |

### Source sample

All 15 seeded targets checked; the author flagged no locator as unverified.

- 1.1, 1.4: stacks-012K line 2612–2631 (construction after Definition 20.1, Definition 20.2, tag
  011O); helle-rognes2024 line 65–77 (Lemma 2.2, Definition 2.3). Agree.
- 2.2: stacks-012K line 3107–3130 (Definition 24.7, Lemma 24.8, tags 0BDU, 0BDV). Directions of
  bounded below and above agree.
- 3.1: stacks-012K line 2349–2368 (Definition 19.1, tag 0121); helle-rognes2024 line 81–84.
- 3.2: helle-rognes2024 line 94–98 (Definition 2.7); stacks-012K line 3131–3143 (Definition 24.9,
  tag 012U). The Conventions dictionary matches both texts.
- 4.1: helle-rognes2024 line 291–303, 334–335 (Definition 4.5, Remarks 4.6, 4.10); formulas agree
  after `r ↦ r − 1`.
- 4.2: helle-rognes2024 line 145–152 (Definition 3.6). 4.3: stacks-012K line 3072–3106, 3144–3151
  (Lemmas 24.6, 24.10, tags 012Q, 012V).
- 4.4, 4.5, 5.3: stacks-012K line 3202–3240 (Lemma 24.13, tag 0BK5), line 3152–3197 (Lemmas 24.11,
  24.12, tags 012W, 0BDW). Hypotheses agree; the README's top condition is in degree `n`, which
  is what the proof needs (see Source issues).
- 7.1: helle-rognes2024 line 71–93. 7.3: line 225–229 (sequence (3.1)) and 213–214 (Lemma 3.15 (c)).
- 3.6 and 7.5 cite only weibel1994, mccleary2001 and eilenberg-moore1962 (uncertified): statements
  checked mathematically (rows above), locators not read.
- Also read: stacks-012K line 1151–1182, 2964–3014, 3038–3054, 3715–3735 (and the headings of
  Definition 21.1 to Lemma 21.4 at line 2653–2687, for their tags);
  bhatt-scholze2015 line 701–702, 755–770; browning-sawin2020 line 57–75, 568–587;
  helle-rognes2024 line 136–247, 943–969. Every tag in the README's reference list resolves.
- `sources.toml`: ten works, each cited work has one entry; four certified, six uncertified.

### Pinned declarations opened

Mathlib: `SpectralSequence/Basic.lean:60, 90, 99, 114, 118, 128`; `ComplexShape.lean:36, 47`;
`SpectralObject/HasSpectralSequence.lean:143, 176, 214, 260, 303, 394, 402, 406, 437`;
`FirstPage.lean:47, 54, 59, 64, 78`; `EpiMono.lean:84, 142, 148, 183, 191, 216, 224`;
`SpectralSequence.lean:488`; `Filtration/Basic.lean:44, 73, 145`;
`GrothendieckAxioms/Basic.lean:126, 166`; `ModuleCat/AB.lean:30, 38`; `Projective.lean:60`;
`EpiMono.lean:67`; `Functor/EpiMono.lean:158`; `ArtinianObject.lean:55, 69`;
`ObjectProperty/Kernels.lean:76, 123`, `ContainsZero.lean:38`, `Extensions.lean:42`;
`EulerCharacteristic.lean:56, 119, 154`; `HomologicalComplex.lean:431, 436`;
`CofilteredSystem.lean:137` (Mittag–Leffler for functors to `Type` only).
Tau Ceti: `SpectralObject/Abutment.lean:44, 50, 54, 76, 92, 114, 123`; `Stabilization.lean:39, 45,
51`; `Comparison.lean:42, 78, 121` (needs `a ≤ b` and top vanishing in degrees `n − 1`, `n`);
`SpectralSequenceMap.lean:64, 230`; `Map.lean:106, 223, 284`; `Filtered/SpectralObject.lean:147,
191, 224, 304, 409, 425`; `FirstPage.lean:89`; `Stabilization.lean:44, 60, 83`;
`Convergence.lean:51, 91, 118`; `Comparison.lean:70`; `Exhaustive.lean:102, 177, 200` (modules,
with an upper hypothesis `hFb`); `Bicomplex.lean:410, 497`; `TowerDifference.lean:77, 122, 150,
165`; `Limits/Replete.lean:91, 97, 107, 118, 357`; `Sites/Replete.lean:48`;
`Condensed/Light/Replete.lean:45`; `ModuleCat/Tower/Basic.lean:170, 174`,
`MittagLeffler.lean:70, 191`; `GrothendieckGroup/Abelian.lean:216`,
`EulerCharacteristic.lean:165`; `Functor/ProZero.lean:67`. Every name cited in the README and the
Lean file exists where cited. None of the eight theorems is at the pins.

### Headlines

Stated: bounded stabilisation (99, 111); spectral-object convergence in a degree (150) and its
comparison (175); the Euler identity for filtered complexes (194); the exhaustive bounded-below
comparison (224); repleteness through `lim¹` (250) and Mittag–Leffler vanishing (270). Named in the
module docstring as not statable, with the missing carrier: convergence structures and 3.4–3.6
(limit page `E_∞`), quadrant convergence 4.5, 5.4 and 7.5 (`E_∞`, `W^n`), 6.1–6.3 and 7.4 (bigraded
exact couples). No statable headline is absent and none is a stand-in.

### Suppliers, gap, order

    depcheck: 240 roadmaps, 2170 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Resolved on main: StableHomotopyKTheory §§7.21–7.26 (lines
2596–2683); DGFloer Layer 1 items 2 and 3 (lines 226–230, 621–656, same native dictionary
`(2p + q + 1, −p − 1)`); AlgebraicTopology Stage 6 item 0 (line 879); DerivedModuleAlgebra §S.1
(line 955; `DoubleComplex.edgeBottom`, `edgeLeft` at line 65, so the two "found nowhere" leads are
that roadmap's names); SchemeAndStackFoundations §2.2, §2.17 (lines 4184, 4977, with
*IsReplete.derived_limits* and the `μ_{ℓ^n}` tower on `Spec ℚ`); EnhancedDerivedSheaves
E2:towers.1, E2.1, E2.2 (lines 1294, 2035, 2083); ComplexKahlerGeometry K8 (line 77).
`gap:exact-couple-morphisms`: same slug and sentence in `design/plan.json:1881` and README:340;
supplier StableHomotopyKTheory §7.22, which has couples and derived couples and no morphisms;
precise and minimal. Acceptance after the repairs stays conditional on it.

No second copy on main, no open pull request changes this roadmap, no cited id is dropped
(`scratch/overlaps.md` checked). No other roadmap cites this one yet. Object search over main and
the open heads for the limit page, convergence bounds, bidegree assignments, the whole-plane
obstruction and Mittag–Leffler towers in an abelian category: the only other statement is
StableHomotopyKTheory §7.26, for towers of spectra with abelian-group homotopy, which the README
cites and generalises (Scope, line 83–87).

Overlap check: read AlgebraicTopology, EnhancedDerivedSheaves, ArithmeticGaloisDuality,
DerivedModuleAlgebra, StableHomotopyKTheory; exact couples and their derived couples:
StableHomotopyKTheory §7.22; Boardman convergence for towers of spectra: StableHomotopyKTheory
§7.26, the abelian-category form here; module towers: Tau Ceti and AlgebraicTopology Stage 6
item 0; first-quadrant double complexes: DerivedModuleAlgebra §S.1; derived limits on replete
topoi: EnhancedDerivedSheaves E2.1–E2.2; nothing has two owners.

### Shape, residue, independence

Summary, scope, conventions, contracts, build paragraph, seven layers each ending in Examples and
Dependencies, consumers, references: present. No LaTeX delimiters, pull-request numbers, dates,
paths or process words in the README or the Lean file.

Layers against stacks-012K's contents (line 7–41, §§19–25 and 31): Layer 1 ↔ §20, Layer 2 ↔ part
of §24, Layer 3 ↔ §19 with part of §24, Layer 4 ↔ none, Layer 5 ↔ §24, Layer 6 ↔ §21, Layer 7 ↔
§31. Not a one-to-one run; the order is forced by 3.2 → 1.4, 2.1; 4.4 → 3.2, 4.3; 5.3 → 4.4;
6.3 → 4.1, 5.1; 7.4 → 6.2.

Source independence: 21 passages compared with 4 sources, none shared beyond formulas and standard
names; largest share stacks-012K, 42 of 86 locators; contents compared with stacks-012K:
independent. The six uncertified sources could not be compared.

## Not verifiable

- weibel1994 (§§3.5, 5.2, 5.5, 5.9), eilenberg-moore1962 (§7), boardman1999, mccleary2001,
  massey1952, cartan-eilenberg1956: settled as uncertified; locators not read. Boardman's numbers
  were checked only as helle-rognes2024 quotes them.
- Journal numbering of bhatt-scholze2015 and browning-sawin2020: the arXiv versions were read, as
  the manifest records.

## Source issues

- **Misprint** in helle-rognes2024 at Lemma 2.2, proof, draft p. 2, line 69: the source says the image of the differential leaving position s lies in the object at s; it should be the image of the differential from s + r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9, proof, draft p. 6, line 332: the source says the boundaries come from the differential indexed s − r; it should be s + r, as the proposition itself states; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.11, proof, p. 65, line 3162: the source says the filtration step of the degree-n term vanishes for large index; it should be the step of the degree-(n+1) term; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13, proof, p. 67, line 3225: the source says the preimage is the image under d of a filtration step plus cycles; it should be the filtration step itself plus cycles; affects the proof.
- **Error** in stacks-012K at Lemma 24.13, proof, p. 67, line 3229–3232: the source says an isomorphism on cohomology in degree n − 1 gives the equality of boundaries; it should use injectivity on cohomology in degree n; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "95b9647864f4ffd91c90aa8cd7194e03de75f188", "job": "REV-PKG-SpectralSequencesAndConvergence~4", "model": "fable", "worker": "chris-x29"} -->
