# Review of ArithmeticGaloisRepresentations (pull request #856 at f901260)

**Verdict:** needs changes

This is a full review. The folder changed by 268 lines since `8325334`:
- AnalyticNumberTheoryPartI §2.2a now supplies the finite-level conductors and their integrality.
- §3.6 has a new semisimplification route and three new Checks.
- `Suggested.lean` drops `lowerArtinConductor`, `lowerSwanConductor` and `lowerConductors_integral`.

Both findings of the previous review are repaired. Six new findings follow.

## R01 (P2) — Two objects that open roadmaps already own are handed to a nonexistent Part II

**Location:** `README.md:5530–5533` (Downstream consumers): "the Artin functional equation of finite-image representations and the Deligne–Langlands local constants of Weil–Deligne representations are ArithmeticGaloisRepresentations Part II's".

**Claim:** no roadmap plans these objects yet, so this roadmap's Part II will.

**Witness:**
- AnalyticNumberTheoryPartI `README.md:1996` (§2.41, at its head `979e68c`) builds `Λ(s,ρ) = w(ρ)Λ(1−s,ρ^∨)` for finite-image `ρ`. It uses its §2.18a Brauer continuation and §2.2a conductors.
- ArtinRepresentations `README.md:209` (§2.4) owns "the characteristic-zero higher-rank existence theorem, Weil–Deligne extension and transfer" of local constants.

Planning them again in a Part II gives each of them two owners.

**Repair:** replace the assignment with this text:

> The finite-image Artin functional equation is AnalyticNumberTheoryPartI §2.41's, on its §§2.2a and 2.18a. The higher-rank Deligne–Langlands local constants and their Weil–Deligne extension are ArtinRepresentations §2.4's. Both consume §2.7.

Keep a Part II only for an object that `roadmaps grep` finds no owner for. **Test:** after the edit, each of the two phrases has exactly one owner across main and the open heads.

## R02 (P3) — AnalyticNumberTheoryPartI §2.2a is cited at a generality it does not state

**Location:**
- `README.md:465–470`: "for a group `G` acting by ring automorphisms on a local ring `B`, … with their tame decomposition, isomorphism invariance, additivity on direct sums, vanishing and character values".
- The same attribution at `:2737–2739`.

**Claim:** §2.2a states these properties for every group acting on a local ring.

**Witness:**
- AnalyticNumberTheoryPartI `README.md:1275` defines the two sums in that generality.
- Its API bullet `:1284` states the tame decomposition, invariance, additivity and vanishing only for `a_v` and `Sw_v`, that is, for `G_w` acting on `O_{L_w}` with `L/F` a Galois extension of number fields. Character values are likewise stated only at `F_v`.
- Its `Suggested.lean:636–662` has only the two definitions and integrality.

**Repair:**
- In the contract, write "… and, for the decomposition groups of a Galois extension of number fields, their tame decomposition, …".
- In §3.2, restore these facts as this roadmap's own API, for every group acting on a local ring:
  - the Artin sum is the Swan sum plus `codim W^{G_0}`;
  - both sums depend only on the isomorphism class and are additive;
  - both vanish for `W = 0` and when `G_0` acts trivially.

  Add one clause saying that this extends §2.2a's number-field statements.

**Test:** §3.7's `F₂((t))`, `α² − α = t⁻¹`, with `G = ℤ/2` acting on `O_L`. §2.2a does not cover this case. The restored decomposition gives `a = 1 + 1 = 2`, which is §3.7's Check.

## R03 (P3) — §5.9 cites a theorem on Hecke eigenvalues for the Haar-measure density statements

**Location:** `README.md:3681–3683`: "(CG, App. §A.4, proof of Lemma A.8, p. 890; Serre 1981, Introduction, p. 124, and §7.2, Théorème 15 with Cor. 1–2, pp. 174–175)". The locator is attached to the clopen, closed and `μ(∂C) = 0` density claims.

**Claim:** Théorème 15 supports these claims.

**Witness:** `serre-1981-chebotarev` lines 1693–1736. Théorème 15 bounds the number of `p ≤ x` with `a_p = h(p)` for a non-CM cuspidal eigenform of weight `≥ 2`, and Cor. 1–2 are its consequences. Neither mentions `Σ_C` or Haar measure.

**Repair:** replace "§7.2, Théorème 15 with Cor. 1–2, pp. 174–175" with "n° 2.1, Théorème 1, p. 131". That theorem (lines 302–305) gives `S_C` density `|C|/|G|`, which is the clopen case through a finite quotient. Keep "Introduction, p. 124" for closed null sets.

## R04 (P3) — §3.7 "(same locator)" points to a page without the ℚ₂ and ℚ₃ values

**Location:** `README.md:3013–3015`: "the ramified quadratic characters of `G_{ℚ_2}` have conductor `2` for `ℚ_2(√−1)`, `ℚ_2(√3)` and `3` for `ℚ_2(√±2)`, `ℚ_2(√±6)`; and every ramified character of order `3` of `G_{ℚ_3}` has conductor `2` (same locator)".

**Claim:** Serre 1987, §1.2 (c), p. 181 contains these values.

**Witness:** `serre-1987-modular-galois` lines 100–120 (p. 181) contain only (1.2.1)–(1.2.3) and (a)–(c). The quadratic discriminants are at lines 434–438, §2.6, *Exemple*, p. 188.

**Repair:** replace "(same locator)" with:

> (conductor–discriminant formula of §3.5: `v_2(𝔡) = 2` for `ℚ_2(√−1)` and `ℚ_2(√3) = ℚ_2(√−5)`, and `3` for `ℚ_2(√±2)` and `ℚ_2(√±6) = ℚ_2(√∓10)`, Serre 1987, §2.6, Exemple, p. 188; for order `3`, §3.2's character comparison with `(1 + 3ℤ_3)³ = 1 + 9ℤ_3`)

**Test:** `3·(−5) = −15 ≡ 1 mod 8` and `6·(−10) = 4·(−15)`, so both ratios are squares in `ℚ_2`.

## R05 (P3) — Two library results are restated instead of cited

**Location:**
- (a) `README.md:1206–1207`: "Prove that if `d!` is invertible in `k`, semisimple `V, W` of dimension `d` with equal traces are isomorphic". Also the clause "equal in characteristic `0`" at `:1197`.
- (b) `README.md:530–531`: "the vanishing of `H²` of a finite cyclic group with divisible coefficients are §3.2 here". §3.2's proof at `:2802` uses this vanishing.

**Witness:**
- (a) Tau Ceti `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:63`): over any field of characteristic `0`, finite-dimensional semisimple representations of a monoid with equal characters are equivalent, with no bound on the dimension. Tau Ceti also has `IsSemisimpleModule.nonempty_linearEquiv_of_trace_eq` (`RingTheory/Semisimple/Trace/Basic.lean:109`). Neither is in "From Tau Ceti".
- (b) Mathlib `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` (`RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:80`) gives `H^{2i}(G, A) ≅ ker(ρ(g) − 1)/im N`. For trivial divisible `A`, `im N = |G|·A = A`.

**Repair:**
- (a) Cite the Tau Ceti theorem in §1.8 and in "From Tau Ceti", and restrict the `d!` clause to characteristic `p > d`, the case Tau Ceti lacks.
- (b) Cite the Mathlib isomorphism in §3.2's *Needs:* and in "From Mathlib", and drop the vanishing from the ownership sentence at `:530`.

**Test:**
- (a) For `k = ℚ` and `d = 7` the Tau Ceti theorem applies directly.
- (b) For `G = ℤ/2` and `A = ℂ^×`, `im N = (ℂ^×)² = ℂ^×`, so `H² = 0`.

## R06 (P3) — A name catalogue in `Suggested.lean` and a Check that names the Lean file

**Location:**
- `Suggested.lean:122–124`: "-- Supplied by AnalyticNumberTheoryPartI: -- §2.2a `TauCetiRoadmap.AnalyticNumberTheoryPartI.lowerArtinConductor`, `lowerSwanConductor` and `lowerConductors_integral` …".
- `README.md:4348` (§6.6 Checks): "in `Suggested.lean` the natural-number truncation of `v_L(p) = ∞` is `0`".

**Witness:**
- The Lean form allows one module docstring plus declaration docstrings, and no catalogues of names. Module docstring lines `:42–46` already say the same thing.
- A Check never names a Lean counterpart.

**Repair:**
- Delete `Suggested.lean:122–124`.
- Move the truncation sentence to the *Lean:* note at `README.md:4339`, as: "the `.toNat` of `v_L(p) = ∞` is `0`, so the statement needs `[CharZero B]`".
- Keep the Check's mathematics: for `y^p − y = t^{−m}`, `c = 1` and `Sw = m`, so the Swan conductor is unbounded.

## Previous findings

- **R01 — repaired.** `lake-manifest.json` now pins Tau Ceti `2fd255d`, and `README.md:371` reads "the jointly continuous carrier `TauCeti.ContinuousRep` with `TauCeti.ContinuousRep.Iso`, …". All eight names exist at that pin:
  - `ContinuousRep.lean:82` (`ContinuousRep`), `:165` (`Iso`), `:318` (`ofCharacter`), `:391` (`baseChange`);
  - `SymplecticMultiplier.lean:71` (`transpose_mul_J_mul_eq_smul_iff`);
  - `HasseArf/Abelian.lean:50` (`hasseArf`);
  - `ArtinConductor.lean:69, 182` (`artinConductorExponent` and its lower-sum lemma).
- **R02 — repaired.** `README.md:2980–2983` reads "At each `v ∤ ℓ` a `G_F`-composition series of `ρ̄_Λ` restricts to a `G_{F_v}`-stable filtration … give `a_v(ρ̄_Λ^ss) ≤ a_v(ρ̄_Λ)`". The text says explicitly that this is not the local chain at `v`. The `11a1` Check recomputes as shown in the table below.

## Verified sound

**Gate, dependency check, diff.**
- The prescribed gate prints `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run also has `build=0`.
- The dependency check prints `depcheck: 237 roadmaps, 2442 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on line 57 of the merge order, and AnalyticNumberTheoryPartI is on line 49.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `scratch/overlaps.md` lists no pull request changing this folder and no dropped or revision-only id.

**Elaboration.**
- `lake env lean Suggested.lean` exits 0 in 11 s with 20 `declaration uses sorry` warnings and nothing else.
- I ran `#check @` on all 33 declarations in one scratch file: 0 errors. Every theorem carries its binders. The flagged `baire_descent` lists `[IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]` anonymously because its conclusion does not mention them, but they are present. The image-algebra section variables, including `[Algebra k K]`, appear in `imageAlgebra_isCentralSimple` and `realizable_iff_imageAlgebra_split`.
- **Padding probe:** in a scratch copy, every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | trivial | decide`. All 20 theorems still fail. None restates a definition or mirrors a Check.

**Headline theorems.**
- The Summary names recognition by Frobenius polynomials, the Tate-module adapters, and the residual-image criteria.
- Recognition is stated as `iso_of_frobenius_charpoly_eq`, with inputs `iso_of_charpoly_eq` (any characteristic, any monoid; Tau Ceti has only characteristic `0`) and `carayol_conj_of_trace_eq`. The residual-image criteria are stated as `isAbsolutelyIrreducible_of_isOddAt`, `dickson_projectiveImage`, `isAdequate_*` and `isEnormous_*`.
- The docstring names the unstatable endpoints: the abelian Tate adapters, infinite-inertia conductors, unit-filtration reciprocity and function-field recognition. The elliptic determinant is already Tau Ceti's `det_tateModuleGaloisRepresentation` (`TateModule/Determinant.lean:52`).

**Seeded sample (15 targets).** Each locator was opened in the cached or fetched text.

| Target | Locators verified | Not verified |
| --- | --- | --- |
| 1.3 | Deligne 1973 Prop. 1.2, p. 508 (lines 177–186: `det Ind = ε^{dim}·det∘t`); NT26 proof of Lemma 3.7(3), p. 19 (Mackey) | — |
| 1.8 | DDT Prop. 2.6, pp. 53–54 (lines 2006–2021); DS Lemme 6.13, p. 523 (line 616); NT26 §1.2, p. 7 | Chenevier, Ribet 1976 |
| 1.10 | KW (I) §1.5, p. 4 preprint (line 143); DP Remark 2, p. 5; NT26 (1.1), p. 3 (arithmetic Frobenius on coefficients); NT26 proof of Lemma 5.8, p. 43 (inertia fixes the residual class) | — |
| 2.5 | Deligne 1973: 3.5, p. 528; 3.8(ii), p. 530; 3.9, p. 531; 8.5–8.6, p. 570; 8.12, p. 572. Saha Def. 2.1, p. 2, and Lemma 2.3, p. 3 | — |
| 3.7 | DDT Prop. 2.12, p. 57; Serre 1961 n° 4.4 Lemme 4, pp. 144–145; Deligne 1974 (8.12)–(8.13), p. 306; Ulmer §10, Prop. 1, p. 8 | "(same locator)": R04 |
| 4.3 | NT26 proof of Lemma 5.7, p. 41 (quadratic or equal fields; conjugate up to Frobenius twist) | Dickson 1901, Steinberg |
| 4.6 | DP Def. 1.12, p. 7; Lemmas 1.13–1.14, pp. 8–9 (projective inertia of order `≤ 2`) | Serre 1972 |
| 5.8 | Serre 1981 Introduction, p. 124; §6.4 Prop. 13, p. 168 | Conrad, DDMS, Schneider |
| 5.9 | Serre 1981 Introduction, p. 124 | Théorème 15: R03; CG App. A |
| 5.12 | BCGP25 Lemma 10.2.3, p. 212. Its structural part uses no de Rham hypothesis, so the README's wider statement is supported by the proof | — |
| 5.13 | SGA 1, V, Prop. 8.2 (line 4798) | Serre 1965, Kisin–Zhou |
| 6.3 | DDT §2.2 Prop. 2.12, pp. 57–58; DDT §1.7, p. 46 (local factor at good primes) | Silverman |
| 6.4 | — | Milne 2008, Ribet 1992, Masser–Zannier |
| 7.2 | CHT Lemma 2.1.8, p. 13 (complete Noetherian case; the README's general case follows by Nakayama, as it says) | ACC+ journal pages, BCG |
| 7.9 | Th12 Def. 2.3 and Lemma 2.4(ii), p. 7; GHT Rem. 6.1, p. 28; GHT Cor. 9.4, p. 50; GHT Cor. 9.5, p. 51; BLGG Def. A.1.1, pp. 28–29; Rem. A.1.2, Lemma A.1.3, p. 29; Prop. A.2.1, p. 30; Lemma A.3.1, p. 35; GN Lemma 3.2.3, p. 15; NT26 Lemma 2.3, p. 11 | GHTT pp. 71–72; Th17 |

**Adversarial pass.** Matrices act on columns, and `Frob` is arithmetic. The changed passages come first, then the 20 Lean theorems, then the sample.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| §3.2 regular-representation Artin sum `= f·d(L/K)` | `ℚ_2(i)`: `1·1 + 1·1 = 2 = v_2(−4)`, Swan `1`. `ℚ_3(ζ_3,∛2)`: `(6/6)(6−1) + (3/6)(6−2) = 7 = 1·d` | Holds |
| §3.5 integrality via `lowerConductors_integral` | Standard `S₃` representation: `2 + ½·2 = 3` and Swan `1`, over `ℚ` and `F₂`. Over `F₃` the value is `1 + ½ = 3/2`, which `hC` excludes | Holds |
| §3.5 local (c) against §2.2a's local form | `ℚ_2(i)/ℚ_2`, `V = 1`: `δ = 1·2 = 2 = a(1 ⊕ χ_{−4})`; §2.2a's sum over `u|v` gives `2 + 0` | Holds |
| §3.5 global, `Σ = ∅`, finite image | `ℚ(i)/ℚ`, `ρ = 1`: `𝔡·Nm(1) = (4) = 𝔣(χ_{−4})` | Holds |
| §3.6 Check `11a1`, `ℓ = 3` | `Δ = −11⁵`, `c₄ = 496`, `−c₆ = −20008 ≡ 1 (mod 11)` (a square). `#E(F₂) = 5` gives `a₂ = −2 ≢ 0 (mod 3)`, so `E[3]` is irreducible. `3 ∤ 5` gives `a₁₁(ρ̄) = 1`, and the chain is `1 ≤ 1 ≤ 1` | Holds |
| §3.6 Check `ℓ = 5` | `(5,5)`: `125 − 25 − 50 − 20 = 30 = 25 + 5`. `5 \| v(q)` makes `E[5]` unramified at 11; quotient `11^{2−1}` | Holds |
| §3.6 Kummer lattices | `ℤ_ℓe₁ ⊕ ℤ_ℓe₂` gives `a = 1`; `ℤ_ℓe₁ ⊕ ℓℤ_ℓe₂` has matrix `(χ ℓc; 0 1) ≡ χ̄ ⊕ 1`, so `a = 0`, drop `2 − 1` | Holds |
| `baire_descent` | `n = 0`: `E = K`. A map `∏ ℤ/p_n → ℚ̄_ℓ^×` sending factor `n` to `ζ_{p_n}` has `\|ζ − 1\| = 1` and is discontinuous, so compactness and continuity are what exclude an infinite field | Holds |
| `exists_integral_conj_GL` | `Γ = ℤ` discrete, `1 ↦ ℓ ∈ GL₁(ℚ_ℓ)`: not integral; `CompactSpace` excludes it | Holds |
| `iso_of_charpoly_eq` | `F₂`, `ℤ/2`: `1 ⊕ 1` against the unipotent; the latter is not semisimple. `F₄`, `ℤ/3`: `(X−1)² ≠ (X−ω)²`. Group-element polynomials suffice by Amitsur's formula; DS, line 623, uses the same | Holds |
| `isAbsolutelyIrreducible_of_isOddAt` | Order-3 image in `GL₂(F₂)` through a totally real cubic: `ρ(c) = 1` fails `hodd`. `χ_{−3} ⊕ χ_{−4}` over `F₅`: `det = 1 ≠ −1` | Holds |
| `dickson_projectiveImage` | `GL₂(F_q)`: `F₀ = F_q` (squares generate, since `(q+1)/2 > √q`), image `PGL₂`. `SL₂(F₃)`: image `A₄`. `λ·g` with `λ² = det g⁻¹` over `F_{q²}`: `tr²/det ∈ F_q` | Holds |
| `iso_of_frobenius_charpoly_eq` | The Frobenius lifts above `Pl` meet every coset `gU` (Chebotarev on `Gal(L/F)`, conjugation-stable), so they are dense, and `E` is Hausdorff | Holds |
| `imageAlgebra_isCentralSimple` | `Q₈`, `k = ℝ`: `B = ℍ`, dimension `4 = n²`. `k(ρ)`-coefficients follow from the invertible Gram matrix `tr(ρ(γ_iγ_j))`, in any characteristic | Holds |
| `realizable_iff_imageAlgebra_split` | `Q₈`: `L = ℝ` gives `ℍ ≇ M₂(ℝ)` and no realization; `L = ℚ(i)` splits, and `Q₈ ⊂ GL₂(ℚ(i))` | Holds |
| `realizable_of_charpoly_mem` | `χ: ℤ/3 → F₄^×`: `X − ω ∉ F₂[X]` (hypothesis fails). `χ ⊕ χ²`: `X² + X + 1` gives the companion matrix over `F₂` | Holds |
| `conj_into_of_trace_mem_of_distinct_eigenvalues` | `Q₈` over `ℚ`: rational traces but no element with distinct rational eigenvalues, so the hypothesis fails, consistent with Schur index 2 | Holds |
| `carayol_conj_of_trace_eq` | `1 ⊕ 1` against `(1 ℓt; 0 1)`: equal traces and reductions, not conjugate; `habs` excludes this | Holds |
| `compact_matrix_frattini_isOpen` | `1 + ℓℤ_ℓ` (ℓ odd): `Φ = 1 + ℓ²ℤ_ℓ`, open. `P` finite: trivially. `∏ C_ℓ` is not a compact subgroup of any `GL_n(E)` | Holds |
| `multiplicative_residual_unramified_iff` | `11a1` over `ℚ_11`, `v(j) = −5`: `p = 5` unramified, `p = 3` ramified; `p = 11` excluded | Holds |
| `lowerSwanConductor_le` | `ℚ_2(√2)`: `2 ≤ 1·(2/2)·2 = 2`. `ℚ_2(ζ_8)`: `2 ≤ (4/4)·3`. Trivial `G`: `0 ≤ N·v(p)/(p−1)`. Characteristic `p`: `.toNat ⊤ = 0`, excluded by `[CharZero B]` | Holds |
| `isAdequate_of_coprime_or_large` | `SL₂(F₇)`: `d = 2`, `6 ≤ 7`. `SL₂(F₅)`: `6 > 5`, not applicable (and not adequate) | Holds |
| `isAdequate_tensor` | `A = (0 4; 1 4)` over `F₅`: `A³ = 1`, and `A + 3I` is a trace-zero centraliser, so `h₂` fails (negative control) | Holds |
| `isEnormous_iff_isAdequate_rankTwo` | `SL₂(F₇)`: both true. `SL₂(F₅)`: both false. `PGL₂(F₅)` type: both true (GN 3.2.3, GHT 9.5) | Holds |
| `isEnormous_of_contains_SL`, `isEnormous_symPower` | `n = 3`, `p = 5`: `X³ − 1` has distinct roots. `n = 2`, `p = 5` is excluded by `2n+1 < p`, matching `SL₂(F₅)` | Holds |
| `exists_linear_lift` | `n = 1`: `PGL₁ = 1`, `r = 1`; `n = 0` excluded | Holds |
| §1.3 `det Ind` | `ℤ/2`, `H = 1`: `det(1 ⊕ sgn) = sgn = sgn_{Γ/H}·1` | Holds |
| §1.10 lifts | `ℚ_ℓ(ζ_ℓ)`: `1` and `C_ℓ → μ_ℓ` both reduce to `1` | Holds |
| §2.5 factors | Tame `C₃` over `F₃`: `1 − X` against `(1−X)²`. Cyclic block `φ = 2`: `X² − 2`. Block count `n = 0`: `det(1 − Xφ₀) = 1` against `det(1 − id) = 0`, so `n ≥ 1` is needed | Holds |
| §2.7 Gauss sum | `ℚ₃`: `e^{−2πi/3} − e^{−4πi/3} = −i√3`, `ε = −i·3^{1/2−s}` | Holds |
| §3.7 Artin–Schreier | `F₂((t))`, `t⁻¹`: break 1, `a = 2`, different 2. `F₃((t))`, `t⁻²`: 2, 3, 6. `t^{−p} → t⁻¹` | Holds |
| §4.3 | `diag(2,1)` is outer on `PSL₂(F₅)` (2 is not a square mod 5). Least indices `2, 3, 5, 7, 6, 11` | Holds |
| §4.6 | `x³ − x − 1`, `p = 23`: `p* = −23`, `C₃` irreducible over `F₂₃` and split over `F₂₃²`. `ℚ(√2,√3)`, `p = 3`: `D₁₆`, projective inertia `ord(z²) = 4` | Holds |
| §5.8 | `μ(GL_n(O)) = ∏_{i=1}^n (1 − q^{−i})`; `n = 1` gives `1 − 1/p` | Holds |
| §5.9 Check | Quadratic `η` with `f = x − 1`: density `1/2 = μ({1})` | Holds |
| §5.12 | `Q₈` restricted to its centre: `a = 2`, `b = 1`, image `C₂²` | Holds |
| §5.13 | Constant cover: density `1/a`. `ℙ¹_{F_{Q²}}/F_Q`: `2(Q²+1)` points | Holds |
| §6.3 | `q = p^ℓ`: `E[ℓ]` unramified. `ℚ₃`, `q = 3³`: `μ₃` ramified. `T² + T + 1` over `ℚ₂`: unramified | Holds |
| §6.4 | `c[i] = −[i]c` on `y² = x³ − x` | Holds |
| §7.2 | `ad⁰ → ad/A·1` has kernel `A[n]·1` and cokernel `A/nA`. `ℤ[√−5]`, `M = A ⊕ I`: determinant lines `A` against `I³ ≅ I` | Holds |
| §7.9 | `SL₂(F₄)`, `ad⁰`: `0 → sl₂ → M₂ → k → 0` with `H¹(M₂) = Ext¹(V,V) = 0` gives `H¹(ad⁰) = k ≠ 0` | Holds |
| §7.10 | `Q₈ ⊗ Q₈`: eigenvalues `±1, ±i`, never four distinct. Anisotropic `x² + y² + 3z²` over `ℚ₃`: `λ² = 1` | Holds |

**Library declarations opened.**
- Tau Ceti `2fd255d`:
  - `RepresentationTheory/Continuous/ContinuousRep.lean:82, 165, 318, 391`;
  - `RingTheory/LocalRing/RamificationGroup.lean:118` (`G_i` acts trivially on `S/𝔪^{i+1}`; integer index) and `:325`;
  - `RepresentationTheory/Semisimple.lean:63`; `RingTheory/Semisimple/Trace/Basic.lean:109`;
  - `TateModule/Determinant.lean:52`;
  - `LinearAlgebra/Matrix/SpecialLinearGroup/Solvable.lean:34`.
- Mathlib `1b1ccf4`:
  - `LinearAlgebra/Projectivization/PSL/PSL2.lean:124`;
  - `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`;
  - `LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:122`;
  - `MeasureTheory/Measure/Haar/DistribChar.lean:84`; `MeasureTheory/Group/Measure.lean:286`;
  - `GroupCohomology/FiniteCyclic.lean:80`.

**Cross-roadmap citations resolved.**
- AnalyticNumberTheoryPartI at `979e68c`: §2.2a (`README.md:1273–1290`); `Suggested.lean:636, 643, 655` (`lowerArtinConductor`, `lowerSwanConductor`, and `lowerConductors_integral` with `hC`). It cites nothing of this roadmap, so there is no cycle.
- Main:
  - ReductiveGroupsPartII `README.md:2878, 2955`;
  - AdicSpacesPartIII `Suggested.lean:859, 868, 877`;
  - PivotalSpherical `leftTrace`/`rightTrace`;
  - SchemeAndStackFoundations §5.11 (`README.md:7273`);
  - RepresentationTheory `SemisimpleAlgebras`, `CompactGroups`, `InductionRestriction` Layer 7.
- `scratch/citations.md` lists 31 unresolved names. 28 of them are declared in `Suggested.lean`; the other three are the supplier names above.

**Observed in other open roadmaps (not findings of this folder):**
- ArtinRepresentations `README.md:137–138` cites `GaloisRep.dense_frobeniusSet` and `GaloisRep.iso_of_charpoly_eq_on_dense`. This README has not defined either since before the previous review.
- GeometryOfNumbersAndQuadraticArithmetic `README.md:1116` links `#finite-order-hecke-functional-equation`, which this README no longer has.

## Not verifiable

- **Serre 1972** (§§2.1–2.6, 5.2; Props 14–18): the service reports DOI 10.1007/BF01405086 as paywalled.
- **CG 2020, App. §A.4, Lemma A.8, p. 890:** arXiv:1907.08691v1 (fetched) has no Appendix A, and the journal is paywalled.
- **GHTT, Thm 9, pp. 71–72:** arXiv:1107.5989v1 (fetched, 59 pp.) does not contain the appendix, and the journal pages are 855–920. No listed edition has pages 71–72.
- **Not fetched in this review:** Dickson 1901, Steinberg, Milne 2008, Ribet 1992, Masser–Zannier, BCG, Th17, Chenevier, Kisin–Zhou.
- **ACC+:** its locators use journal pages, which the cached arXiv v2 cannot check.
- **Uncertified in the manifest:** Serre, *Local Fields*, and KW (II).

## Source issues

- **Error** in BLGG (Barnet-Lamb–Gee–Geraghty, arXiv:1106.5586v1) at Prop. A.2.1, p. 30: the source says that for `l = 5` an irreducible `G` with projective image `PGL₂(F₅)` is not adequate; it should list only `PSL₂(F₅)`, since `H¹(GL₂(F₅), ad⁰) = 0` (torus weight `(b/a)²` on `H¹(U, sl₂)`); affects a stated result; corrected in print at GHT, Cor. 9.5, p. 51, and GN, Lemma 3.2.3, p. 15.
- **Error** in CHT (Clozel–Harris–Taylor 2008) at Cor. 2.5.4, p. 57: the source says `l > 2n − 1` suffices for bigness; it should be `l > 2n + 1`, since `n = 2`, `l = 5` gives `SL₂(F₅)` with `H¹(Sym²) ≠ 0`; affects a stated result; corrected in print at GN, proof of Lemma 3.2.5, p. 15.
