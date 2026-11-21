# Review of ThetaSeries (pull request #2725 at 3b3196f)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding, and it is not about the mathematics: every statement, Check and worked example I recomputed is correct, `Suggested.lean` elaborates with `sorry` as its only warning, and no headline closes in one tactic. The finding is that the item ids of the README on main (1A–8E), which eight roadmap folders on main cite, are no longer carried by the items; a table maps them to §k.n, and a map does not keep an id. There are three small corrections and three format notes, none blocking. For the humans: no cited source could be read legally, so wording and arrangement were compared with no source.

## R01 (P1) — The item ids 1A–8E of the README on main are replaced by a mapping table, and roadmaps on main cite those ids

On main every item of Layers 1–8 carries its id in bold at its head ("**2C. Covolume, determinant, index.**", "**2H. The Kronecker symbol.**"). At this head the items are `### 2.3`, `### 2.8`, and so on, and the letters survive only in the table of *How to read the build* (lines 59–68: "2A, 2B, 2C, … | §§2.1–2.8, in that order"). An item of a roadmap on main keeps its id and its subject; an old-to-new numbering does not replace it, because a citation "ThetaSeries §2H" then points at no item, only at a row of a table.

The ids are in use on main: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 3120 (§2C) and line 1038 (2D, 2G); `QuadraticCharactersAndReduction/README.md` line 269 and `SieveMethodsAndPrimePatterns/README.md` lines 627, 2191, 2402, 4252 (§2H); `HypergeometricMotives/README.md` lines 1748, 1781 (2H); `LatticePackingsAndPerfectForms/README.md` line 1547 (7C–7D); `SpecialFunctionsTheta/README.md` line 978 (1A–1C, 1F); `CFSGBasicProperties/README.md` line 551 (8D); `HilbertModules/HeisenbergImprimitivity/README.md` lines 178–305 (1A, 1C, 1D, 1E, 2A, 2C). The open HalfIntegralWeightModularForms cites 6F.

The subjects are all kept, so the repair is mechanical: restore each id at its item, with its statement as it now stands. Either form would do: the letter in the heading (`### 2C (§2.3) Covolume, determinant, index`), or the heading as it is with the section opening on main's bold label (`**2C.**`). All 44 items, not only the cited ones. The table and the §k.n numbers can stay beside the ids.

## C01 — The module docstring of `Suggested.lean` points at a section that no longer holds the names

Lines 45–46 say that the headlines Tau Ceti already proves are not restated and that "`README.md` names them under *Exact supplier contracts*". At this head they are named on the *In Tau Ceti:* lines of the layers; *Exact supplier contracts* says so itself (lines 1856–1858) and lists only what is consumed besides them (`ZLattice.thetaForm`, for instance, is in §5.2 and not in the contracts). Write "names them on the *In Tau Ceti:* lines of its layers".

## C02 — §2.5 states for integral `L` a characterization of the level that exists only for even `L`

§2.5 (lines 523–526) says that for integral `L` the level agrees with "the order of the discriminant quadratic map of the rational model", and §2.4 (line 499) repeats it. By Convention 6 that map is defined for even `L` only; on the odd lattice `ℤ` the level is `2` and there is no quadratic map to have an order. Main made the statement for even `L`. What the pin proves for integral `L`, `ZLattice.level_ratModel` (`TauCeti/Algebra/Module/ZLattice/Level.lean` line 262), is equality with the level of the rational model, which `TauCeti/LinearAlgebra/IntegralLattice/Level.lean` line 100 defines as the generator of the integers `N` with `N · B(x, x)` even on the dual. Say "the level of the rational model (§2.4), which for even `L` is the order of its discriminant quadratic map".

## C03 — The description does not say that two sections of main are gone

Main's `## Ordering — the dependency graph`, with its table of blocks and status, and `## Acknowledgements` have no heading at this head. Their content is in the per-layer *Dependencies* and in the last paragraph of *Provenance*; the status table has no successor. One sentence under *What changes in form* would do: "Main's *Ordering* section is replaced by the per-layer *Dependencies* and the paragraph closing *How to read the build*, its status table is dropped, and the *Acknowledgements* are the last paragraph of *Provenance*." When R01 is repaired, the sentence on the lettered labels changes with it.

## N01 — Locators are coarse or missing

Layers 1, 2 and 4 and §§3.1–3.3, 3.5, 5.1, 5.4, 6.1, 6.4, 7.1, 7.2, 7.6, 8.1–8.5 name no source, and apart from Turaev §1.3, Miyake §4.9, Serre Ch. VII §6 and Conway–Sloane Ch. 2 §2.3 every locator is a whole chapter or appendix. A theorem or page number at each claim would let a reader check the hypotheses.

## N02 — §6.3, the corollary `8 ∣ n` at odd rank

Line 1140: "for odd `n` the formula applied to `L ⊕ L`, of rank `2n`, gives `4 ∣ n`" reads as a conclusion; main added "and contradicts oddness". Restore those words.

## N03 — References, Schoeneberg

"Ch. IX is the coset-splitting proof that Layer 7 follows" (line 1938): a roadmap does not say it follows a source. "the coset-splitting proof that is Layer 7's route of record" says the same.

## Previous findings

The previous review, of `047e91a`, had no finding and one format note.

- N01 (locators coarse or missing) — not repaired; N01 above. The six sections of Layer 1 are back, each without a source.
- The repair it confirmed still holds at this head: §1.2 again states its targets (the lattice of an orthonormal basis, the slice bound, absolute summability) and keeps the partial transforms out: "needs partial Fourier transforms, which are AnalyticNumberTheoryPartII §5.3g's" (lines 321–323), with the *Owned elsewhere* bullet unchanged.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.3 change of variables | `E = ℝ`, `A = 2`, Gaussian | `𝓕(f∘A)(ξ) = ½ 𝓕f(ξ/2)`; formula `|det A|⁻¹ 𝓕f((A⁻¹)ᵀξ) = ½ 𝓕f(ξ/2)`; `Aᵀ` variant gives `𝓕f(2ξ)` | true | none |
| §1.6 Check | `τ = i`; doubled exponent | `(i/i)^(-n/2) = 1`, `-1/i = i`; `exp(-2π‖x‖²) ↦ 2^(-n/2) exp(-π‖ξ‖²/2)` | true | none |
| §2.3 | `√2 ℤ²`, `A₂`, `ℤ` | covol `2`, det `4`, `|L^∨/L| = 4`; det `3`, `ℤ/3`; covol `L^∨ = ½ = 2⁻¹` | true | none |
| §2.4 with Layer 2 Examples | `⟨2m⟩`, `A_n`, `D₄ ⊕ D₄` | `‖x/2m‖²/2 = 1/(4m)`; `n/(2(n+1))`; `10 − 6 = 4 = √16·i⁴` | true | none |
| §2.5 | `√2 ℤ²`, `A₂ ⊕ A₂`, `ℤ` | level `4`, exponent `2`; det `9`, level `3`; `ℤ`: level `2`, no quadratic map | true except the wording of C02 | C02 |
| §2.6 Fricke partner | `√2•E₈`, `A₂`, `√2 ℤ²`, `2ℤ²` | `2/gcd(2,2) = 1`; `3/1 = 3`; `4/1 = 4`; `N = 8`, `c = 2`, partner `√2 ℤ²` of level `4 = 8/2` | true | none |
| §2.8 Checks | `(−1/0)`, `(−1/3)`, `(5/2)`, `(−4/−1)` | `1`, `−1`, product rule fails only at numerator `−1`; `−1`; `−1 = sign(−4)` | true | none |
| §2.9 | `√2 ℤ ⊕ √2 ℤ`, `A₂ ⊕ A₂` | `1 + i + i − 1 = 2i = (1+i)²`; `(i√3)² = −3 = √9·i²` | true | none |
| §3.3 | `ℤ` (period 2), `A₂` coset, `Θ_L(iy)` | coefficients `1, 2, 0, 0, 2`; `N q_L(γ) = 1`, exponents `≡ 1 (mod 3)`; sum of positive terms with `v = 0` giving `1` | true | none |
| §3.4 | `ℤ ⊕ ℤ`, sup norm, `E₈ ⊕ E₈`, `√2 ℤ` | `2·1 + 1·2 = 4`; sup norm `8`; `2·240 = 480 = 480 σ₇(1)`; factor `c² = 2` | true | none |
| §4.1 Checks | `ℤ`, `A₂` | difference `4e^{πiτ} + 4e^{9πiτ} + …`; `‖γ‖²/2 = 1/3`, period `3` | true | none |
| §4.2 | `ℤ²`, `√2 ℤ²`, slash form | `(τ/i) = (−i)τ`; `τ/(2i)`; `τ^{−k}·(−i)^k τ^k = (−i)^k` | true | none |
| §4.3 | Poisson at the translated Gaussian, `σ = −1/τ`; `γ = 0` | `(σ/i)^{−k} = (−iτ)^k`, character `e(+⟪v, m⟫)`; `γ = 0` returns §4.2 | true | none |
| §4.4 | double inversion; `ℤ²` | `(−i)^{2k}·covol⁻¹·covol = (−1)^k`; `k = 1`: `−1` | true | none |
| §5.1 route | `n ≡ 2, 6 (mod 8)`, odd `n` | `2n ≡ 4`; `4n ≡ 4 (mod 8)`; `(−1)³Θ = −Θ` against `(−1)^k = 1` | true | none |
| §5.2 | `8 ∣ n`; rank `0` | `k ≡ 0 (mod 4)`, `(−i)^k = 1`; constant `1` of weight `0` | true | none |
| §5.3 | `E₈ ⊕ E₈`, rank `0` | coefficient `480` in weight `4 + 4 = 8`; constant `1` | true | none |
| §6.1 | `√2 ℤ²`, `c = 2`; completing the square | `(1 + e(1/2))² = 0`; residual phase `d·b·‖m‖² ∈ ℤ` | true | none |
| §6.2, `gaussSum_eq_mul_dualGaussSum` | `√2 ℤ²` at `(1,2)`, `(3,1)`, `(2,2)`; `A₂` at `(1,1)`, `(3,3)`; route constants | `0 = 0`; `∑_{u mod 6} e(−u²/12) = √3(1−i)`, `1 = ⅓·½·i·(−6i)`; `4 = ½·i·(−8i)`; `1`; `9`; `ε` and `Im(−1/ε) = a²/(c²t)` rederived | true | none |
| §6.3, `sum_cexp_norm_sq_discriminantGroup` | `A₂`, `D₄`, `√2 ℤ²`, `E₈`, rank `0` | `1 + 2e(1/3) = i√3`; `1 − 3 = −2`; `2i`; `1`; `1 = 1` | true | N02 (wording) |
| §6.4 | `√2 ℤ²`, `a = 3`, `c = 4`; `c = 12`; `t = +4` | `(2 + 4e(−1/3))² = −12 = 4·(−1)·3`; `36 ≠ −12`; `(2i√3)² = −12` | true | none |
| §6.5, `gaussSum_eq_sqrt_card_mul_jacobiSym` | `√2 ℤ²`: `(1,4)`, `(3,4)`, `(1,2)`, `(3,12)` | `8i = 8i`; `−8i = −8i`; `0 ≠ 4i`; `72i ≠ −24i` | true; controls separate | none |
| §6.6, `conductor_kroneckerChar_dvd_level`, `nebentypus` | `A₂`, `D₄`, `√2 ℤ²`, `E₈` | `(−3/7) = 1`, `(3/7) = −1`; `D = 4`, `N = 2`, trivial; `χ(3) = −1`; modulus `1` | true | none |
| §7.1 | `!![−2,−3;3,4]`; `c = 0` | det `1`, in `Γ(3)`; `T³·A = !![7,9;3,4]`; `T·A` has `b = 1`; `εI·T^{εb} = !![ε,b;0,ε]` | true | none |
| §7.2 | `A = S`; `N ∣ c` | `G_L(0,1;m) = 1`, §4.2; `d − ad² = −bcd`, phase `1` on `L` | true | none |
| §7.3, `thetaSeries_slash_of_mem_Gamma0` | constant; `A₂`, `√2 ℤ²`, `−I`, `N = 1` | `(−i)^k c^{−k} det^{−½}·c^k det^{½} i^k (D/a) = (D/a)`; `(−3/2) = −1`; `(−4/3) = −1`; `(−1)^k`; trivial | true | none |
| §7.5, `thetaCoset_slash_of_mem_Gamma` | `A₂`, `T`, `T³`; `D₄`; `√2 ℤ²` | `e(1/3) ≠ 1`, `e(1) = 1`; `−I ∈ Γ(2)`, `k = 2`; `−I ∉ Γ(4)` | true | none |
| §7.6 | raw and normalized constants; square | `N^{k−1}(Nτ)^{−k}(Nτ)^k`; `(√N)^{2−k} N^{k−1} = N^{k/2}`; `(−i)^{2k} = (−1)^k`; `N^{2(k−1)}(−N)^{−k} = (−1)^k N^{k−2}` | true | none |
| §8.1 | Sturm bounds | `⌊4/12⌋ = ⌊8/12⌋ = 0`; `E₄²` has `q`-coefficient `480` | true | none |
| §8.3 with §8.4 | `q²`; Leech at `m = 2, 3`; `E₈³` | `(65520/691)(2049 + 24) = 196560`; `(65520/691)·176896 = 16773120`; `r(2) = 720` | true | none |
| §8.5 | both lattices | `480` roots each; the non-isometry is the pin's, not recomputed | true | none |
| §8.6, the two representation numbers | `A₂` at `m ≤ 4`; `D₄` at `m ≤ 3`; Sturm | `6, 0, 6, 6`; `24, 24, 96` (`8 + 16` at norm `4`); `⌊6/12⌋ = ⌊8/12⌋ = 0`; `B_{1,χ} = −1/3`, `a₀ = 1/6` | true | none |
| Lettered ids | main's 44 items against the head's headings | 44 subjects kept; 0 of 44 ids at an item; cited on main from 8 roadmap folders | not kept | R01 |

- Source locators checked against the text: 0 of 19; no cited work has a legal copy the sources service could read (below).
- Library declarations opened at the pin: 22, among them `ZLattice.gaussTerm`, `gaussSum`, `dualGaussSum`, `IsEven.dualGaussSum_eq_jacobiSym` (`TauCeti/Algebra/Module/ZLattice/GaussSum.lean` lines 133, 176, 449, 613), `ZLattice.level`, `level_ratModel` (`Level.lean` lines 113, 262), `TauCeti.conductor_kroneckerChar_dvd_iff` (`NumberTheory/LegendreSymbol/KroneckerSymbol.lean` line 433), the three Fricke identities (`NumberTheory/ModularForms/ThetaSeries/Fricke.lean` lines 72, 95, 115), `frickeScalar` (`Fricke/Involution.lean` line 86), the coset splitting (`CosetSplitting.lean` lines 68, 140), `IsEven.even_of_level_dvd_two` (`ZLattice/Milgram.lean` line 64). Tau Ceti's Milgram theorem (`LinearAlgebra/IntegralLattice/Milgram.lean`, `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`) is the invariant in `ℤ/8` on the rational model, not the complex identity of §6.3; no declaration of `Suggested.lean` is proved at the pin.
- Cross-roadmap citations resolved on main: AnalyticNumberTheoryPartII §5.3g (lines 619–624, the partial transform for an orthogonal decomposition); ModularForms §0.1 (lines 124–154: `a₀ = 1/6`, `a₁ = 1` for the character modulo 3) and Layer 6 with its Fricke normalization (lines 109–110, 514–518); IntegralLattices 6D and its Layer 8 boundary (lines 188–217); the completed integral-lattices roadmap, Layer 3; the five downstream consumers.
- The record: main's 8 layers and 44 items, the acceptance list of Layer 2, the worked examples and the 11 boundary checks are all present with their statements; the only content of an item that left is the partial Fourier transforms of 1B, cited to their owner on main. The ids are R01.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 172 roadmaps, 2005 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `lake env lean TauCetiRoadmap/ThetaSeries/Suggested.lean` gives 10 `sorry` warnings and nothing else. One-tactic probe (`first | rfl | simp | infer_instance` on a copy): none of the 10 theorems closes. The elaborated signatures were compared with the README statements: every declaration carries `FiniteDimensional`, `DiscreteTopology`, `IsZLattice`, evenness and `finrank = 2k` in its own signature; none lost a binder.
- Headlines: level one, `E₈`, Leech, the rank-16 pair and the Fricke identities are proved at the pin and named on *In Tau Ceti:* lines; reciprocity, Milgram, the closed form, the conductor theorem with the nebentypus, Hecke–Schoeneberg in both spellings, the coset series on `Γ(N)` and the `A₂`, `D₄` numbers are stated in `Suggested.lean`. None statable is absent; none is padding.
- The description against the head: the lists of realised and open sections, the eleven "stated more generally" items, the additions and the paragraph on `Suggested.lean` agree with the head; C03 is what it leaves out.

Overlap check: read HalfIntegralWeightModularForms, IntegralLattices (on main and its open revision), Rank24LatticeConstructions, SiegelModularForms, MaassForms, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, ModularForms. Theta series, Poisson summation on a lattice and the real model: owner ThetaSeries, cited as such by each that mentions them. The rank-16 pair and Milgram at every signature: owner IntegralLattices, cited here. Character Eisenstein series, Sturm bound, Fricke operators: ModularForms or Tau Ceti, cited here. Partial Fourier transforms: AnalyticNumberTheoryPartII §5.3g, cited here. Nothing has two owners.

Source independence: 0 passages compared with 0 sources, because no cited source could be read legally; largest share Ebeling, *Lattices and Codes*, 6 of 19 locators; its table of contents could not be read. By the README's own account of it (References: Ch. 2 for theta series, Poisson summation and inversion, Ch. 3 for the general level and the examples), eight layers do not map one to one onto two chapters.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic consume Layer 7 and LFunctions consumes Layer 1. Rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Seeded sample, source side (§3.4: Ebeling Ch. 2; §§5.2, 5.3: Serre Ch. VII §6; the other sampled sections cite no source): Serre, Ebeling, Milnor–Husemoller and Conway–Sloane resolve only to the publisher's paywalled pages; Turaev 1998 resolves to a Cambridge page with no legal copy. The sources service was asked for each by DOI; nothing else was tried.
- Schoeneberg, Ogg, Iwaniec, Miyake: books with no open copy; not requested beyond the above, cited by locator only.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, *Lattices and Codes*, has the largest share of the locators (6 of 19). Neither its text nor its table of contents could be read, nor any other cited source, so wording and arrangement were compared with no source.
- R01: earlier reviews accepted the mapping table of *How to read the build* for the lettered ids; eight roadmap folders on main cite the letters. Whether the table suffices is a decision on the record rule.
