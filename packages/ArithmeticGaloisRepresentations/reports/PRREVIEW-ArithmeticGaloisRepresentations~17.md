# Review of ArithmeticGaloisRepresentations (pull request #856 at a6dc48d)

**Verdict:** needs changes

This is an incremental re-review of the 9 lines changed since 5e9fd9c, all in one §3.3 Check (`README.md:2838–2844`). It also covers what that Check cites (§3.3's global conductor, §3.6) and the previous report's findings.

## R01 (P2) — Eight Tau Ceti names exist only at main's newer Tau Ceti, not at this branch's pin

**Location:**
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:728–729`: "at the pin they are Tau Ceti's `TauCeti.ContinuousRep`, `TauCeti.ContinuousRep.Iso`, `TauCeti.ContinuousRep.ofCharacter` and `TauCeti.ContinuousRep.baseChange`".
- The same names appear at `:366–368`, `:738` and `:742`, and in `Suggested.lean:30` (a docstring).
- `README.md:381`, `:4080` and `:4530`: `Matrix.transpose_mul_J_mul_eq_smul_iff`.
- `README.md:359–361` and `:2732–2734`: `TauCeti.LocalFieldsRamification.hasseArf`, `…artinConductorExponent` and `…artinConductorExponent_mul_card_lowerRamificationGroup_zero`.

**Claim:** these are declarations of the pinned Tau Ceti.

**Witness:**
- This head's `lake-manifest.json` still pins Tau Ceti `a91d3aa`, with toolchain `v4.35.0-rc3`, and the diff since 5e9fd9c leaves it unchanged.
- At `a91d3aa`, no `.lean` file contains `ContinuousRep`, `transpose_mul_J_mul_eq_smul_iff`, `hasseArf` or `artinConductorExponent`. The J lemma there is `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` (`LinearAlgebra/Matrix/SymplecticMultiplier.lean:86`).
- Main's pin `2fd255d` has all of them:
  - `RepresentationTheory/Continuous/ContinuousRep.lean:82`, with `toContRepresentation` at `:150`, `Iso` at `:165`, `ofCharacter` at `:318` and `baseChange` at `:391`;
  - `SymplecticMultiplier.lean:71`;
  - `NumberTheory/LocalField/Herbrand/HasseArf/Abelian.lean:50`;
  - `Herbrand/ArtinConductor.lean:69` and `:182`.

**Repair:**
- Rebase the branch on main. Main pins Tau Ceti `2fd255d` with `v4.36.0-rc2`, and a rebase keeps the diff outside the folder empty.
- Rerun `lake build TauCetiRoadmap.ArithmeticGaloisRepresentations.Suggested` and the gate on the rebased head.
- If the branch keeps `a91d3aa`, the alternative is:
  - write `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` at `:381`, `:4080` and `:4530`;
  - cite `ContinuousRep` only as EtaleCohomologyFoundations §F.4.0's carrier, at `:366–368`, `:728–729`, `:738`, `:742` and `Suggested.lean:30`;
  - drop the three LocalFieldsRamification names at `:359–361` and `:2732–2734`.
- Spot-checked at `a91d3aa`: the other contract names near these lines are present (`lowerRamificationGroup`, `exists_forall_ramificationGroup_eq_bot`, `charTwist`, `haarProb`, `jordanDecomposition`, `GL2Borel`).

## R02 (P3) — The rewritten `χ̄_{−4}` Check calls the whole exponent "wild", and its wrong-definition value reads as the same number

**Location:** `README.md:2838–2839`: "`ρ̄ = χ̄_{−4} ⊕ 1` over `F_3` has `N(ρ̄) = 4`: the wild exponent `a_2 = 2` is kept for coefficients of characteristic `3`, and a definition using only `codim ρ̄^{I_2}` gives `2`."

**Claim:** the wild exponent at `2` is `2`, and the tame-only definition "gives `2`".

**Witness:**
- `ℚ_2(i)` has `G_0 = G_1` of order 2 and `G_2 = 1` (`README.md:2741–2743`). So `a_2 = codim + Sw = 1 + 1`, and the wild (Swan) part is `1`.
- The sources use "wild" for the Swan term: Ulmer `a7a80395…` lines 169–170, and Serre 1987's "invariant sauvage" `b(V)` (`serre-1987-modular-galois` lines 107–108).
- The tame-only definition gives `N = 2`. Read next to `a_2 = 2`, the bare "`2`" looks like an exponent, which would not discriminate.

**Repair:** Replace with: "`ρ̄ = χ̄_{−4} ⊕ 1` over `F_3` has `N(ρ̄) = 4`: `a_2 = codim ρ̄^{I_2} + Sw = 1 + 1 = 2`, the Swan term `1` being kept for coefficients of characteristic `3`, while a definition using only `codim ρ̄^{I_2}` gives `N = 2`."

This was recomputed on the instance: `−1 ≠ 1` in `F_3`, and `χ̄` is nontrivial on `G_0 = G_1`. Hence the tame term is `1`, the Swan term is `(|G_1|/|G_0|)·1 = 1`, and `N = 2^2 = 4` against `2^1 = 2`.

## R03 (P3) — §3.6 cites Ulmer §6 for a residual inequality chain that Ulmer does not state

**Location:** `README.md:2962–2963`: "`a(ρ̄_Λ^ss) ≤ a(ρ̄_Λ) ≤ a(ρ)`, with `a(ρ̄_Λ^ss)` independent of `Λ` (Ulmer, §6, p. 5)". The changed Check now cites §3.6's factor.

**Claim:** Ulmer §6, p. 5 states the residual chain.

**Witness:** Ulmer §6 (`a7a80395…` lines 215–246, p. 5) proves two things. The first is the characteristic-zero identity `a(ρ_ℓ) = dim V_ss^I − dim V_ℓ^I + a(ρ_ss)` (line 236). The second is `δ(ρ^ss) = δ(ρ_ℓ|P) = δ(ρ̄)` (line 246). It says nothing about `a(ρ̄^ss)` against `a(ρ̄)`, or about independence of `Λ`.

**Repair:**
- Move "Ulmer, §6, p. 5" to the Swan equality: "`Sw(ρ̄_Λ) = Sw(ρ) = Sw(ρ̄_Λ^ss)` (Darmon–Diamond–Taylor 2007, Lemma 2.7, pp. 54–55; Ulmer, §6, p. 5)".
- Then give the chain its route: "`a(ρ̄_Λ^ss) ≤ a(ρ̄_Λ) ≤ a(ρ)`, since `I_K`-invariants are left exact along a composition series and the Swan terms agree, with `a(ρ̄_Λ^ss)` independent of `Λ` by §1.9".
- Tested on two instances, both consistent with the repaired text:
  - `ρ = χ_{−3} ⊕ 1` at `v = 3`, `ℓ = 2`: `0 ≤ 0 ≤ 1`.
  - Unipotent `ρ(σ) = (1 t_ℓ(σ); 0 1)` on the standard lattice: `ρ̄` is nontrivial on inertia with `a = 1`, `ρ̄^ss` is trivial with `a = 0`, and `a(ρ) = 1`. That gives `0 ≤ 1 ≤ 1`, with the first inequality strict.

## Previous findings

- R01 — not repaired: `README.md:728–729` "at the pin they are Tau Ceti's `TauCeti.ContinuousRep`, … `TauCeti.ContinuousRep.baseChange`", while `lake-manifest.json` still pins Tau Ceti `a91d3aa`, where none of these exist. Written again as R01 above.
- R02 — repaired: `README.md:2840–2844` "For `χ_{−3}` the quadratic character of `ℚ(√−3)`, ramified only at `3`, `ρ̄ = χ̄_{−3} ⊕ 1` over `F_5` has `N(ρ̄) = 3` … its `2`-adic lift … has `N^{(2)} = 3`". The rewording of the neighbouring `χ̄_{−4}` bullet in the same commit introduced R02 of this report.

## Verified sound

**Gate, dependency check, diff.**
- The gate as prescribed prints `gate ArithmeticGaloisRepresentations: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run on this head adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. Since 5e9fd9c only `README.md` changed (7 insertions, 2 deletions), and `Suggested.lean` is byte-identical (0 diff lines).
- The dependency check prints `depcheck: 244 roadmaps, 2473 edges, 0 problem(s)` (exit 0), with no UPWARD, CYCLE or `moved:` line. The roadmap is on line 46 of the merge order.
- `scratch/overlaps.md`: no other open pull request changes this folder, and no dropped or revision-only id. The changed lines cite no other roadmap and introduce no object, so the ownership result of the previous report stands.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 in 39 s. Its only warnings are the 21 `declaration uses sorry` warnings, one per theorem.
- The signatures file flags `ContinuousRep.baire_descent` (line 67). Its elaborated type carries every binder of its own signature: `[Group Γ]`, `[TopologicalSpace Γ]`, `[IsTopologicalGroup Γ]`, `[CompactSpace Γ]`, `[T2Space Γ]`, `[Fact ℓ.Prime]` and `[FiniteDimensional ℚ_[ℓ] K]`. It uses no section `variable`, so nothing is dropped.
- The other 35 types are unchanged since the previous report, which compared all 36 `#check @` types with the README. The file, the Mathlib pin and the Tau Ceti pin are all unchanged.
- The padding probe of the previous report (no theorem closes in one tactic in two runs) applies unchanged.

**Headline theorems.** The list is unchanged from the previous report, and all are stated in `Suggested.lean`:
- recognition by Frobenius polynomials and its algebraic inputs;
- the residual-image criteria (oddness, Dickson, adequacy, enormity);
- conductor integrality (`lowerConductors_integral`) and the wild bound (`lowerSwanConductor_le`);
- descent, projective lifting, Frattini detection and the multiplicative criterion.

The module docstring names the unstatable endpoints and the carrier each lacks.

**Seeded sample, where it meets the diff.** The changed Check sits in sample target 3.3 and cites sample target 3.6. Cached texts opened at each locator:

| Target | Locator | What the text says |
| --- | --- | --- |
| 3.3 global conductors | Serre 1987, §1.2, (1.2.1)–(1.2.3), pp. 180–181 | `serre-1987-modular-galois` lines 82–120: `N` is the Artin conductor restricted to places prime to `p`, and `n(l, ρ) = dim V/V^{G_0} + b(V)` with `b` the wild invariant. Also (a) integrality, (b) vanishing iff unramified, and `N = ∏_{l≠p} l^{n(l,ρ)}` prime to `p`. Supports the definition, the exclusion of the places above `p`, and the positive generator over `ℚ` |
| 3.3 Weil–Deligne conductor | Ulmer, §§6–8, pp. 5–7 | `a7a80395…` line 266 (§7, p. 6): `a(ρ,N) = a(ρ) + dim V^{I} − dim V_N^{I}`. Line 299: `= dim V − dim V_N^I + δ(ρ)`, the README's form. Lines 286–288: independent of `t_ℓ` and `Φ` up to isomorphism. Lines 300–304 (§8, p. 7): `a_D(ρ_ℓ) = a(ρ_ℓ)` |
| 3.6 reduction | Darmon–Diamond–Taylor 2007, Lemma 2.7, pp. 54–55 | `darmon-diamond-taylor-2007` lines 2053–2063: equal Swan integrals for `p ≠ ℓ`, `N(ρ) = N(ρ̄) ∏_{p≠ℓ} p^{dim ρ̄^{I_p} − dim ρ^{I_p}}`, and `N(ρ̄) ∣ N(ρ)`. Lines 2031–2032: `ρ(P_p) ≅ ρ̄(P_p)`, which gives `Sw(ρ̄^ss) = Sw(ρ̄)`. Supports the quotient the new Check uses |
| 3.6 chain | Ulmer, §6, p. 5 | Lines 215–246: see R03 |

The other sample targets (1.1, 1.8, 1.12, 2.1a, 3.4, 3.5, 5.1, 5.6, 5.13, 7.1, 7.2, 7.3, 7.8) are outside the diff and their text is unchanged since 5e9fd9c. Targets 1.1, 3.5, 7.2 and 7.3 were read in the previous report's sample table. The README flags no locator as unverified.

**Adversarial pass.** Matrices act on columns; `Φ` is arithmetic Frobenius. The new rows come first. The rows marked (r16) carry forward the previous report's values for statements the diff leaves untouched.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| §3.3 Check, `χ̄_{−4} ⊕ 1` over `F_3` (changed) | `ℚ_2(i)`: `σ(1+i) − (1+i) = −2i` has `v_L = 2`, so `G_0 = G_1 = C₂` and `G_2 = 1`. Since `−1 ≠ 1` in `F_3`: tame `1`, Swan `1`, `a_2 = 2`. The trivial summand gives `0`. The place `3` is excluded and unramified anyway, so `N = 4`. Tame-only: `codim ρ̄^{I_2} = 1`, `N = 2` | Values hold; the wording is R02 |
| §3.3 Check, `χ̄_{−3} ⊕ 1` (changed) | `ℚ_3(√−3)/ℚ_3` is tame of degree 2: `G_0 = C₂`, `G_1 = 1`, `a_3 = 1`. `−3 ≡ 5 mod 8`, so `2` is inert, and `5` is unramified. Over `F_5`: `−1 ≠ 1`, `N = 3`. Over `F_2`: trivial, `N = N^{{v∣2}} = 1`. The lift on `ℤ_2²` has `N^{(2)} = 3`. §3.6 factor: `3^{2−1} = 3 = 3/1` | Holds; discriminates reduction from lift |
| §3.6 local formula, same instance | `a_3(ρ) = 1`. `dim ρ̄^{I_3} − dim V^{I_3} = 2 − 1`, so `a_3(ρ̄) = 0`. `Λ^I ⊗ F_2 = F_2e₂` does not map onto `F_2²`, and the inertia image has order `2 = ℓ`, so the strict drop is allowed. Over `F_5` the order is prime to `5` and `a(ρ̄) = a(ρ) = 1` | Holds |
| §3.6 chain `a(ρ̄^ss) ≤ a(ρ̄) ≤ a(ρ)` | `χ_{−3} ⊕ 1`: `0 ≤ 0 ≤ 1`. Unipotent `(1 t_ℓ; 0 1)`: `0 ≤ 1 ≤ 1` | Holds; the locator is R03 |
| §3.3 global conductor definition | Trivial `ρ`: `N^Σ = (1)`. `ω_p`, `p` odd: ramified only at `p`, which is excluded, so `N = 1`. `χ_{−4}` as an Artin character: `N = 2^2 = 4` | Holds |
| `lowerConductors_integral` with `hC` (§3.5) (r16) | `ℚ_3(ζ_3,∛2)`: `G_0 = S₃`, `G_1 = C₃`, `G_2 = 1`, different `7`. Standard plane over `ℚ`: `3` and Swan `1`. Over `F_2`: `3` and `1`. Over `F_3`: `3/2`, excluded by `hC`. `μ_n` on `ℂ[[t]]`: `G_1 = 1` | Holds |
| `lowerArtinConductor`, `lowerSwanConductor` (§3.2) (r16) | `χ_8`: orders `4,4,2,2,1`, giving `3` and Swan `2` (unweighted `4` and `3`). Regular representation of `ℚ_2(i)`: `2 = v_2(−4)`. Infinite `G_0`: `0` | Holds |
| `lowerSwanConductor_le` (§6.6) (r16) | `ℚ_2(√2)`: `2 ≤ 2`. `χ_8`: `2 ≤ 3`. `S₃`: `1 ≤ 3` | Holds |
| §3.0–3.1 Checks (r16) | `ℚ_2(ζ_8)`: `d = 8`, `φ(3) = 2`, `ψ(u) = 4u − 5`. `ℚ_3(ζ_9)`: `d = 9`, `ψ = 6u − 4`. Artin–Schreier jumps `1, m`: `φ(m) = 1 + (m−1)/p` | Holds |
| 3.2 Characters (r16) | `(5,2)_2 = −1`, so the conductor of `ℚ_2(√2)` is `3 = 1 + 2`. `Sp(2)` lattice `O e₁ ⊕ ℓO e₂` reduces to an unramified representation | Holds |
| 3.3 `a(r, N)` (r16) | `Sp(2) ⊗ χ`, `χ` tame: `2 + 0 − 0 = 2`; with `ker N`, `1`. This agrees with Ulmer line 299 | Holds |
| §4.7 (a), (e) (r16) | Linear disjointness gives image `H`, and `F' = K` gives `1`. `PGL₂(F_3)^ab = ℤ/2`. For `p = 5`, `ℤ/4` is no quotient | Holds |
| §4.6 Checks (r16) | `ℚ(√2,√3)` at `3`: `e = f = 2`. `D₈` of order 16, and the projective inertia has order `4`. `x³ − x − 1`: `ω ∉ F_23` | Holds |
| 4.1 oddness (r16) | `χ_{−3} ⊕ χ_{−4}` over `F_5`: `ρ(c) = −1`. Cyclic cubic in `GL₂(F_2)`: `ρ(c) = 1`. Characteristic 2: `(ρ(c) − 1)² = 0` | Holds |
| 4.4 Dickson (r16) | `Q₈ ⊂ GL₂(F_3)`: image `C₂²`. `q = 9`: `5 > 3` squares, so `F_0 = F_9` | Holds |
| 1.5–1.8 descent, Brauer–Nesbitt (r16) | `n = 0`: vacuous. `ℤ` with `1 ↦ ℓ` is excluded. Over `F_2`, `1⊕1` against `(1 1; 0 1)`. `ℤ/3` over `F_4`: traces `0 = 0`, polynomials differ | Holds |
| 1.10 twists (r16) | Order `p² − 1`: `χ̄^p ≠ χ̄`, and argument conjugation returns `χ̄` | Holds |
| 2.1 decomposition (r16) | `p = 5` in `ℚ(∛2, ζ₃)`: `|D_Q| = 2`, not normal | Holds |
| 2.5a comparison (r16) | `S₃` standard: `1+T+T²` and `1 − T²`. Arithmetic against geometric `1 − ζT` | Holds |
| 2.6 strings, filtration, purity (r16) | `[H,N] = −2N`. For `Sp(2)`: `M_{−1} = M_0 = ⟨e₁⟩`, `w = −1`. Characteristic 2: `2N⊗N = 0` | Holds |
| 5.3 recognition (r16) | `1` against `ℚ(√5)`: density `½`. `χ_ℓ` against `χ_ℓ⁻¹`: `X − p ≠ X − p⁻¹` | Holds |
| 5.5–5.7 (r16) | `Q₈`, `ℝ`: `B = ℍ`, no real form. `ω ⊕ ω²` realised over `F_2`. `S₃` descends over `ℚ`; `Q₈` has no rational distinct-eigenvalue pair | Holds |
| 5.8 Haar (r16) | `n = 2`, `q = 2`: `3/8 = ½·¾`. `n = 1`: `1 − 1/p`. `n = 0`: `1` | Holds |
| 5.9 Haar Chebotarev (r16) | Quadratic `η`: density `½ = μ{1}` | Holds |
| 5.10 Carayol (r16) | `(1 ℓa; 0 1)` against `1`: equal traces, not conjugate, `habs` fails | Holds |
| 5.11 identities (r16) | Cayley–Hamilton. `(s−1)² = 0` for `m ≥ 2`. For `m = 1`, `s − 1 ≠ 0` | Holds |
| 6.2 determinant, eigensums (r16) | Swap: `{x ≡ y mod 2}`. `diag(1,−1)`: `ℤ²` | Holds |
| 6.3 criterion (r16) | `q = ℓ^p`: `m = p`, unramified. `q = ℓ`: ramified | Holds |
| 6.4a Frattini (r16) | `(1+ℓ)^{ℤ_ℓ}`: open. `P = 1`: `⊤`. `∏ ℤ/ℓ`: not open | Holds |
| 7.2 adjoint (r16) | Over `F_2`, rank 2: kernel `F_2·1`, cokernel `F_2`. `M = A ⊕ I`: determinant lines `A` and `I` | Holds |
| 7.3 similitudes (r16) | `PᵀJ₄P` is the BCGP21/CG matrix. `dim sp₄ = 10`, `dim gsp₄ = 11` | Holds |
| 7.9 adequacy (r16) | `A = (0 4; 1 4)` over `F_5`: `h₂` fails. `GL₂(F_7)`: `6 ≤ 7`. `SL₂(F_5)`: hypotheses fail | Holds |
| 7.10 enormity (r16) | `SL₂(F_7)` is enormous; `SL₂(F_5)` and `SL₂(F_3)` are not, on both sides | Holds |
| 7.11 vast and tidy (r16) | `ℚ(ζ_{p²})`: `δ = 2`. Scalar `ν = λ²` | Holds |
| 7.6 projective lifting (r16) | `n = 1`: `r = 1` | Holds |

**Library declarations opened.**
- Tau Ceti `a91d3aa`: `SymplecticMultiplier.lean:86`. Grep over all `.lean` files found no `ContinuousRep`, `transpose_mul_J_mul_eq_smul_iff`, `hasseArf` or `artinConductorExponent`.
- Tau Ceti `2fd255d`: `ContinuousRep.lean:82, 150, 165, 318, 391`, `SymplecticMultiplier.lean:71`, `HasseArf/Abelian.lean:50`, `ArtinConductor.lean:69, 182`.

## Not verifiable

- ACC+ journal numbering (Ann. of Math., paywalled). arXiv v2 Lemma 7.1.6 agrees; journal "Def. 6.2.29, p. 1044" is not confirmed.
- BHKT §2, p. 5 and Thm 4.8: the text is not in the cache.
- KW (II), Lemma 4.3, and Serre, *Local Fields*: recorded as uncertified in the manifest.
- Books cited by locator only: Deligne 1980, Fulton–Harris, Dixon–du Sautoy–Mann–Segal, Schneider, Isaacs, Jantzen, Dickson 1901, Steinberg, Milne 2008, Mumford, Silverman, Bushnell–Henniart.
- Outside the diff and not reopened: Brumer–Kramer 1994, GHT/GHTT, KT, NT23, Qian, Patrikis, BCG 2025.

## Source issues

- none
