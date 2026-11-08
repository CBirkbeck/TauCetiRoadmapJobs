# Review of ArithmeticGaloisRepresentations (pull request #856 at 5e9fd9c)

**Verdict:** needs changes

## R01 (P2) — Eight Tau Ceti names exist only at main's newer Tau Ceti, not at this branch's pin

**Location:**
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:728–729`: "at the pin they are Tau Ceti's `TauCeti.ContinuousRep`, `TauCeti.ContinuousRep.Iso`, `TauCeti.ContinuousRep.ofCharacter` and `TauCeti.ContinuousRep.baseChange`". The same names appear at `:366–369`, `:738` and `:742`, and in `Suggested.lean:30`.
- `README.md:381`, `:4075`, `:4525`: `Matrix.transpose_mul_J_mul_eq_smul_iff`.
- `README.md:358–361`, `:2730–2735`, `:3011–3012`: `TauCeti.LocalFieldsRamification.hasseArf`, `…artinConductorExponent` and `…artinConductorExponent_mul_card_lowerRamificationGroup_zero`.

**Claim:** these are declarations of the pinned Tau Ceti.

**Witness:**
- `lake-manifest.json` on this branch pins Tau Ceti `a91d3aa`. At that pin none of `ContinuousRep`, `transpose_mul_J_mul_eq_smul_iff`, `hasseArf` or `artinConductorExponent` occurs in any `.lean` file.
- The J lemma at that pin is `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` (`LinearAlgebra/Matrix/SymplecticMultiplier.lean:86`).
- All of these names exist at main's Tau Ceti pin `2fd255d`: `RepresentationTheory/Continuous/ContinuousRep.lean:82`, `SymplecticMultiplier.lean:71`, `Herbrand/HasseArf/Abelian.lean:50`, and `Herbrand/ArtinConductor.lean:69, 182`.

**Repair:**
- Rebase the branch on main. Main's manifest pins Tau Ceti `2fd255d` with toolchain `v4.36.0-rc2`.
- Rerun `lake build TauCetiRoadmap.ArithmeticGaloisRepresentations.Suggested` and the gate on the rebased head.
- Checked on `2fd255d`: all five `TauCeti.*` imports of `Suggested.lean` exist, and every other one of the 118 names in the Tau Ceti contract is present.
- If the branch keeps `a91d3aa` instead, the alternative repair at that pin is:
  - restore `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` at `:381`, `:4075` and `:4525`;
  - cite `ContinuousRep` only as EtaleCohomologyFoundations §F.4.0's carrier;
  - drop the three conductor names, as the previous review asked.

## R02 (P3) — The characteristic-two half of a §3.3 global-conductor Check is vacuous

**Location:** `README.md:2838–2839`: "`ρ̄ = χ̄_{−4} ⊕ 1` over `F_3` has `N(ρ̄) = 4`, while over `F_2` the same representation is trivial with `N(ρ̄) = 1`: the conductor of a reduction is computed from the reduction."

**Claim:** the `F_2` case shows that the conductor is computed from the reduction and not from a lift.

**Witness:** `N(ρ̄) := N^{{v | 2}}(ρ̄)` excludes the place `2` (`:2824`), and `χ_{−4}` ramifies only at `2`. So the characteristic-zero lift `χ_{−4} ⊕ 1` also gives `1`, and the wrong definition passes. The `F_3` half gives `4` either way.

**Repair:**
- Use a character ramified away from `2`: "`ρ̄ = χ̄_{−3} ⊕ 1` over `F_5` has `N(ρ̄) = 3`. Over `F_2` it is trivial with `N(ρ̄) = 1`, whereas the lift `χ_{−3} ⊕ 1` has prime-to-`2` conductor `3`."
- Rechecked: `χ_{−3}` has conductor `3` and takes the value `−1 ≠ 1` in `F_5` on inertia at `3`, a tame term of `1`. Modulo `2` its values `±1` become `1`.

## Previous findings

- **R01 (Tau Ceti names absent at the pin): partly repaired.** The three conductor and Hasse–Arf names are still at `README.md:358–361`, `:2730–2735` and `:3011–3012`. They resolve at main's Tau Ceti `2fd255d`, but not at this branch's `a91d3aa`. This head adds `TauCeti.ContinuousRep` and renames the J lemma, and both of those also exist only at `2fd255d`. This is R01 above.
- **R02 (§4.7 (a) over an unconstrained `F'`): repaired.** `:3271–3274` now reads "on `G_{F'(ζ_p)}` for every finite separable `F'/F` linearly disjoint from `K(μ_p)` over `F`". The Check `F' = K` at `:3293–3295` and the `p = 5` argument for (e) at `:3282–3285` are added. Both are recomputed below.
- **R03 (`CharZero C`): repaired.** `Suggested.lean:159` now has `(hC : ringChar C = 0 ∨ ringChar C ≠ ringChar (IsLocalRing.ResidueField B))`. `README.md:2911–2928` matches it, cites Serre 1987 §1.2 (a), p. 181, and gives the characteristic-`ℓ` route. The `S₃` Checks over `ℚ`, `F_2` and `F_3` are at `:2938–2948`.
- **R04 (dropped Lean name): repaired.** `:1932–1934` gives "*GaloisRep.grothendieck_quasiUnipotent* → SmoothRepresentationsOfLocalGroups SR.5.2 `wd-complete-coefficients`, `grothendieck_quasiUnipotent_complete`". LefschetzPencilsAndVanishingCycles still cites the old name at its `README.md:941` and `:1041` (`roadmaps grep`); repointing that is the other pull request's edit.
- **R05 (Weil-group locator): repaired.** `:1956` reads "Deligne 1973, 2.2.2–2.2.4, pp. 521–522". In `deligne-1973-constantes`, 2.2.2 is at line 570 (p. 521) and 2.2.3–2.2.4 at lines 600–612 (p. 522).
- **R06 (§5.11 generality): repaired.** `:3683–3692` states the identity over a number field `F` and `GL_m`, `m ≥ 1`. BCGP25's `m = 4`, `F = ℚ` application is kept as the instance.
- **Pull-request description:** unchanged. It still names "LocalFieldsRamification Layers 3a/4a" and lists LFunctions and CFSGBasicProperties among open pull requests. It is not a file of this folder and is not counted.

## Verified sound

**Gate and dependency check.**
- The gate as prescribed prints `gate ArithmeticGaloisRepresentations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check prints `depcheck: 240 roadmaps, 2444 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on line 46 of the merge order.

**Elaboration, signatures and the padding probe.**
- `lake env lean` on `Suggested.lean` exits 0 in 19 s, with exactly 21 `declaration uses sorry` warnings at the 21 theorems.
- A scratch file with `#check @…` for all 36 declarations elaborates (exit 0), and each type matches its README statement.
  - `lowerConductors_integral` keeps `[Finite G]`, `[IsDiscreteValuationRing B]`, `[IsAdicComplete …]`, `[PerfectField (ResidueField B)]`, `[FaithfulSMul G B]` and `[FiniteDimensional C W]`, and now has the explicit `hC` binder.
  - `lowerSwanConductor_le` keeps `[CharZero B]`, `[CharP (ResidueField B) p]`, `hC` and `hc`.
  - The signatures file's one flag (section `n : Type` in `isEnormous_symPower`) is a variable shadowed by the theorem's own `n : ℕ`, so nothing is lost.
- The one-tactic probe ran twice on scratch copies, and no theorem closes in either run. Nothing is padding.
  - `first | rfl | simp | infer_instance | decide | trivial | exact?` gives 21 errors, one per theorem: 11 `exact?` failures, 9 `simp` calls leaving goals, and 1 timeout.
  - `first | infer_instance | trivial | exact?` gives 19 `exact?` failures and 2 heartbeat timeouts. The timeouts are `realizable_of_charpoly_mem` and `conj_into_of_trace_mem_of_distinct_eigenvalues`, which are Deligne–Serre Lemme 6.13 and BLGGT Lemma A.1.5 and are not one-lemma consequences.
- All 15 definitions have real bodies. Each is needed to state a headline.

**Library declarations opened.**
- Tau Ceti `a91d3aa`:
  - `SymplecticMultiplier.lean:86` (`det_eq_of_transpose_mul_J_mul_eq_smul`);
  - the `RepresentationTheory/Continuous/` directory, which has no `ContinuousRep` structure.
- Tau Ceti `2fd255d`:
  - `ContinuousRep.lean:82`: the structure has fields `toRepresentation` and `continuous_action`, for any topological module, so it does not assume finite projectivity; `ofCharacter` is at `:318` and `baseChange` at `:391`;
  - `SymplecticMultiplier.lean:71` (`Aᵀ J A = d • J ↔ det A = d`);
  - `ArtinConductor.lean:69` and `:182` (`f(χ) · #G_0 = Σ_{χ(G_i) ≠ 1} #G_i`);
  - `HasseArf/Abelian.lean:50`.
- A mechanical presence check of all 118 Tau Ceti contract names at both pins found exactly the six base names of R01 missing at `a91d3aa`, plus the `Iso`, `ofCharacter` and `baseChange` members under the absent `ContinuousRep`.

**Cross-roadmap citations and ownership.**
- `scratch/overlaps.md` lists no other pull request changing this folder and no dropped id. `scratch/citations.md` lists only this roadmap's own Lean names and supplier names already resolved by the previous review.
- `roadmaps grep --lean-only` for `lowerArtinConductor|lowerSwanConductor|lowerConductors_integral`, `IsAdequate`, `IsEnormous`, `iso_of_charpoly_eq`, `carayol` and `dickson_projectiveImage` finds them only in this folder.
- README-wide searches for Swan conductors, Brauer–Nesbitt, Carayol and adequate/enormous subgroups find consumers that cite this roadmap. Examples are InverseGaloisAndArithmeticFundamentalGroups (`README.md:428`, "ArithmeticGaloisRepresentations §§3.1, 3.4") and PadicDifferentialEquationsAndRigidCohomology (`README.md:490–492`, §§3.1, 3.4). That roadmap's differential Swan conductor is a different object. ArtinRepresentations defines no conductor exponent, as found in the previous review.
- gap:unit-filtration-reciprocity is stated with supplier ClassFieldTheory and a precise needs sentence (`README.md:463–472`). The package has no `design/plan.json` to carry the slug, as in previous rounds.

**Seeded sample** (the cached text opened at each locator).

| Target | What the cited text says |
| --- | --- |
| 1.1 | DDT `darmon-diamond-taylor-2007` lines 1960–1965 (p. 52: a `d`-dimensional representation, continuous homomorphisms for topological `K`); Newton–Thorne `6a156f7a…` lines 295–316 (§1.2, p. 7: continuous `ρ` and its semisimple residual `ρ̄`) |
| 1.10 | NT lines 96–98 (display (1.1), p. 3: arithmetic `ϕ_p`, twisting coefficients); NT lines 1994–2001 (proof of Lemma 5.8, p. 43: inertia twists have isomorphic residuals); `khare-wintenberger-2009-i` lines 143–154 (§1.5, printed p. 4: Teichmüller lift `ω_p`); Dieulefait–Pacetti `0c6850da…` lines 195–200 (Remark 2, p. 5) |
| 2.1 | DDT lines 1919–1926 (p. 51); Deligne 1973 line 870 (3.12, p. 533) |
| 2.5a | Marzec–Neururer `040f864d…` lines 2583–2598 (Def. 5.11, p. 62: `det(1 − ρ|_{V^{I}}(Frob) N𝔭^{−s})⁻¹`); Deligne 1973 3.5.1 and 8.12 |
| 2.6 | FSY `835580aa…` lines 2588–2592 (p. 57: uniqueness of the monodromy filtration, purity on `gr_a` of weight `w + a`); Tate 1979 `a79bd282…` lines 772–775 ((4.1.5): Φ-semisimple indecomposables are `ρ' ⊗ Sp(n)`) |
| 3.2 | Serre 1961 `serre-1961-corps-locaux` lines 1284–1333 ((28)–(33), pp. 137–138); Serre 1987 `serre-1987-modular-galois` lines 100–114 ((1.2.1)–(1.2.2), p. 181) |
| 3.5 | Serre 1961 lines 1302–1313 (Thm 2 and (31), p. 138) and 1343–1351 (Remarque 2°, p. 139); Serre 1987 line 110 ((a): `n(l, ρ)` an integer for `F̄_p` coefficients at `l ≠ p`) |
| 4.6 | Dieulefait–Pacetti lines 317–318 (Def. 1.12, p. 7), 325–363 (Lemma 1.13 with proof, p. 8) and 367–394 (Lemma 1.14; projective inertia of order at most 2, pp. 8–9) |
| 5.7 | Deligne–Serre `65b390f6…` lines 616–624 (Lemme 6.13, p. 523); BLGGT `c953df62…` lines 3963–3995 (Lemma A.1.5, p. 85) and 3301 (proof of Lemma 5.3.1, p. 71) |
| 5.8 | Serre 1981 `serre-1981-chebotarev` lines 61–63 (p. 124: the trace-zero locus is null) and 1501–1521 (§6.4, Prop. 13, p. 168: analytic sets with empty interior are null); Conrad `2b6789ab…` line 2264 (Thm 10.1, p. 37) |
| 5.9 | Serre 1981 lines 1713–1736 (Thm 15, Cor. 1–2, pp. 174–175); Calegari–Geraghty `fff30587…` lines 3469–3482 (Lemma A.8 with proof, journal p. 890: positive measure by Chebotarev) |
| 7.2 | CHT `9d3b7079…` lines 467–475 (Lemma 2.1.8, p. 13: centraliser `R^×`); the README's version without completeness follows by Nakayama, as it says |
| 7.3 | BCGP21 `boxer-calegari-gee-pilloni-2021` lines 771–785 (§2.1.1, pp. 15–16: `gJgᵗ = νJ`, `J = (0 s; −s 0)`); CG lines 232–242 (§2.1, journal p. 807: `MᵗJM = νJ`, same `J`); BLGGT §1.1 |
| 7.9 | Thorne 2012 `537af005…` lines 265–289 (Def. 2.3 and Lemma 2.4(ii), p. 7); BLGG `cf27d300…` lines 1454–1468 (Def. A.1.1, pp. 28–29; Rem. A.1.2) and 1525–1532 (Prop. A.2.1, p. 30, arXiv v1); Gee–Newton `068818a4…` lines 690–692 (Lemma 3.2.3) |
| 7.11 | BCGP21 lines 9560–9601 (Def. 7.5.2, Lemma 7.5.3, Rem. 7.5.4, Lemma 7.5.5, pp. 198–199), 9626–9635 (Def. 7.5.6, Rem. 7.5.8, p. 199) and 9681–9700 (Def. 7.5.11, Lemmas 7.5.12–7.5.15, p. 201) |

**Headline theorems.**
- The README's end theorems are:
  - recognition by Frobenius polynomials (`iso_of_frobenius_charpoly_eq`, with `iso_of_charpoly_eq`, `carayol_conj_of_trace_eq`, `imageAlgebra_isCentralSimple`, `realizable_iff_imageAlgebra_split`, `realizable_of_charpoly_mem` and `conj_into_of_trace_mem_of_distinct_eigenvalues`);
  - the residual-image criteria (`isAbsolutelyIrreducible_of_isOddAt`, `dickson_projectiveImage`, `isAdequate_of_coprime_or_large`, `isAdequate_tensor`, `isEnormous_iff_isAdequate_rankTwo`, `isEnormous_of_contains_SL` and `isEnormous_symPower`);
  - conductor integrality and the wild bound;
  - descent, projective lifting, Frattini detection and the multiplicative criterion.
- All are stated.
- The module docstring names the unstatable endpoints and what each lacks: the Weil–Deligne adapter and purity, the absolute-filtration conductors, the character-conductor comparison (gap), the general Tate-module adapters (`AbelianTate`), function-field recognition, and reductive and Taylor–Wiles verification statements.
- Grothendieck monodromy is cited from its owner. No headline is forced through a stand-in.

**Computed adversarial pass.** Matrices act on columns; `Φ` is arithmetic and `F = Φ⁻¹` geometric Frobenius.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| `lowerConductors_integral` with `hC` (§3.5) | `L = ℚ_3(ζ_3, ∛2)`: `(y+2)³ − 2` Eisenstein, different `1 + 2·3 = 7 = 5 + 2`, so `G_0 = S₃`, `G_1 = C₃`, `G_2 = 1`. Standard plane over `ℚ`: `2 + ½·2 = 3`, Swan `½·2 = 1`. Over `F_2` (`(1,1,1)` not in the plane, no invariants): `3`, `1`. Over `F_3`: `1 + ½ = 3/2` and Swan `½`, excluded since `ringChar F_3 = 3`. `μ_n` on `ℂ[[t]]`: `ζt ≡ t mod t²` iff `ζ = 1`, so `G_1 = 1`, Artin sum `codim W^{G_0}`, and `hC` always holds | Holds |
| `lowerArtinConductor`, `lowerSwanConductor` (§3.2) | `χ_8` on `ℚ_2(ζ_8)`: orders `4,4,2,2,1`, `χ_8(5) = −1`: `1+1+½+½ = 3`, Swan `2`; unweighted `4`, `3`. `ℚ_2(i)`, `σ(1+i) − (1+i) = −2i` of valuation `2`, so `G_0 = G_1 = C₂`, regular representation `1+1 = 2 = v_2(−4)`. Infinite `G_0`: `Nat.card = 0`, sum `0` | Holds |
| `lowerSwanConductor_le` (§6.6) | `ℚ_2(√2)`: `σ√2 − √2 = −2√2`, `i(σ) = 3`, `Sw = 1+1 = 2 ≤ 1·1·(1+1)`. `χ_8`: `2 ≤ 3`. `S₃` on `ℚ_3(ζ_3,∛2)`: `v_L(3) = 6 = |G_0|`, `c = 1`: `1 ≤ 2·1·(1+½) = 3` | Holds |
| §3.3 Check (R02) | `χ_{−4} ⊕ 1` over `F_2`: reduction gives `N = 1`, lift gives `N^{(2)} = 1` (place `2` excluded). `χ_{−3} ⊕ 1` over `F_2`: reduction `1`, lift `3`; over `F_5`: `3` | R02 |
| §3.0–3.1 Checks | `ℚ_2(ζ_8)`: `d = 3+3+1+1 = 8`, `φ(3) = 1+½+½ = 2`, `ψ(u) = 4u − 5`. `ℚ_3(ζ_9)`: `G_1 = G_2 = C₃`, `d = 5+2+2 = 9`, `ψ = 6u − 4`. `(ℤ/p)²` Artin–Schreier: lower jumps `1`, `1 + p(m−1)`; jumps `1, m` give `φ(m) = 1 + (m−1)/p`. Imperfect `z^p − t^{p−1}z = s`: `e = 1 ≠ |G_0| = p` | Holds |
| 3.2 Characters | `(5,2)_2 = (−1)^{(25−1)/8} = −1`, so `U^2` is not in the norms and `U^3 = 1 + 8ℤ_2` consists of squares, giving conductor `3 = 1 + 2`. `Sp(2)` lattice `O e₁ ⊕ ℓO e₂`: `ρ(σ)(ℓe₂) = ℓe₂ + ℓt(σ)e₁ ≡ ℓe₂`, unramified | Holds |
| 3.3 `a(r, N)` | `Sp(2) ⊗ χ`, `χ` tame: `0 + 2 − 0 = 2`; with `ker N`: `1`. Tate 1979 (4.1.6) has the same formula (`a79bd282…` line 781) | Holds |
| §4.7 (a), (e) | Linear disjointness of `F'` from `M = K(μ_p)` gives `M ∩ F'(ζ_p) = F(ζ_p)`, so the image is `H`. `F' = K` gives image `1`. (e), `p = 3`: `det(λ) = λ² = 1` on `F_3^×`, `PGL₂(F_3)^ab = ℤ/2 ≅ (ℤ/3)^×`. `p = 5`: `A₅^ab = 1`, `S₅^ab = ℤ/2`, and `PSL₂/PGL₂(F_{5^r})^ab` has order at most `2`, so `ℤ/4` is no quotient | Holds |
| §4.6 Checks | `ℚ(√2,√3)` at `3`: `e = f = 2`, `−2 ≡ 1` a square in `ℚ_3`, so `ℚ_3(√2) = ℚ_3(i)`. `Gal(L/F) = D₈` of order `16`, `crc = r⁻¹`, inertia `⟨r⟩`. `ρ̄(r) = diag(z, z⁻¹)`, so `π`(inertia) has order `ord(z²) = 4`. `x³ − x − 1`: `23 ≡ 2 mod 3`, so `ω ∉ F_23`. Cyclic `Gal(L/F)` criterion proved via the permutation of eigencharacters | Holds |
| 4.1 oddness (headline) | `χ_{−3} ⊕ χ_{−4}` over `F_5`: `ρ(c) = −1`, `det = 1`. Order-3 cyclic cubic in `GL₂(F_2)`: `ρ(c) = 1`, splits over `F_4`. Characteristic 2: `(ρ(c) − 1)² = 2 − 2ρ(c) = 0` | Holds |
| 4.4 Dickson (headline) | `Q₈ ⊂ GL₂(F_3)`: image `C₂²`, `n = 2`, `3 ∤ 2`. `q = 9`: `(9+1)/2 = 5` squares exceed `|F_3| = 3`, so `F_0 = F_9` | Holds |
| 1.5–1.8 descent, Brauer–Nesbitt (headlines) | `n = 0`: vacuous, `E = K`. `χ_ℓ`: entries in `ℚ_ℓ`, norm `1`. `ℤ` with `1 ↦ ℓ` is non-compact and unbounded, so it is excluded. `F_2`, `ℤ/2`: `1⊕1` against `(1 1; 0 1)`, both `(X−1)²`, the second not semisimple. `ℤ/3` over `F_4`: traces `0 = 0`, polynomials `(X−1)² ≠ (X−ω)²` | Holds |
| 1.10 twists | `χ̄` with an element of order `p² − 1`: `x^p = x` iff `x ∈ F_p`, so `χ̄^p ≠ χ̄`; argument conjugation returns `χ̄` (abelian target) | Holds |
| 2.1 decomposition | `p = 5` in `ℚ(∛2, ζ₃)`: `3³ = 27 ≡ 2`, `x² + 3x + 4` has discriminant `−7 ≡ 3`, a nonsquare, so `|D_Q| = 2`, not normal in `S₃` | Holds |
| 2.5a comparison | `S₃` standard: order 3 gives `(1−ωT)(1−ω²T) = 1+T+T²`, a transposition gives `1 − T²`. Cube root `ζ`: `1 − ζT`, geometric `1 − ζ⁻¹T`, `ρ^∨(Φ⁻¹) = ρ(Φ)^T` gives back `1 − ζT` | Holds |
| 2.6 strings, filtration, purity | `[H,N] = −2N`, `[H,E]e_i = 2i(d−i+1)e_{i−1}`, `[E,N]e_i = (d−2i)e_i`. `Sp(2)`: `M_{−2} = 0`, `M_{−1} = M_0 = ⟨e₁⟩`, `M_1 = V`; `F` on `gr_{−1}` is `q⁻¹` (weight `−2 = w − 1`), so `w = −1`. Characteristic 2: `(N⊗1 + 1⊗N)² = 2N⊗N = 0` | Holds |
| 5.3 recognition (headline) | `1` against the character of `ℚ(√5)`: agreement density `½`, so `hPl` is needed. `χ_ℓ` against `χ_ℓ⁻¹`: `X − p ≠ X − p⁻¹` | Holds |
| 5.5–5.7 (headlines) | `Q₈`, `k = ℝ`: traces `2, −2, 0`, `B = ℍ`, `4 = 2²`; `L = ℝ`: `ℍ ≇ M₂(ℝ)`, no real form; `L = ℂ`: both sides true. `ω ⊕ ω²` of `C₃`: `X² + X + 1 ∈ F_2[X]`, realised by `(0 1; 1 1)`. `S₃` over `ℚ`: transposition eigenvalues `±1`, descends. `Q₈` over `ℚ`: no rational pair of distinct eigenvalues | Holds |
| 5.8 Haar | `#GL_n(F_q)/q^{n²} = ∏_{i=1}^n (1 − q^{−i})`. `n = 2`, `q = 2`: `6/16 = 3/8 = ½·¾`. `n = 1`: `1 − 1/p`. `n = 0`: `1`. `X^q − X` on `F_q` has measure `1` | Holds |
| 5.9 Haar Chebotarev | `η` quadratic and `x − 1`: density `½ = μ{1}`. Closed `C = ⋂ CU` gives upper density at most `μ(C)` | Holds |
| 5.10 Carayol (headline) | `r = (1 ℓa; 0 1)`, `r' = 1`: equal residues, traces `2 = 2`, not conjugate; `habs` fails | Holds |
| 5.11 identities | `s = ρ`: Cayley–Hamilton. `m ≥ 2`, `s = (1, log_p χ_p; 0, 1)`: `(s−1)² = 0`, so `(s−1)^m = 0`. `m = 1`: `s − 1 ≠ 0` for some `g`. `s = χ`: `(χ − 1)^m ≠ 0` | Holds |
| 6.2 determinant, eigensums | Swap on `ℤ²`: eigensum `{x ≡ y mod 2}`. `diag(1,−1)`: `ℤ²` | Holds |
| 6.3 criterion (headline) | `q = ℓ^p`, `p ≠ ℓ`: `m = −v(j) = v(q) = p`, `p ∣ p`, so unramified. `q = ℓ`: `m = 1`, ramified | Holds |
| 6.4a Frattini (headline) | `(1+ℓ)^{ℤ_ℓ}`: `Φ = (1+ℓ)^{ℓℤ_ℓ}`, open. `P = 1`: the infimum over no coatoms is `⊤`. `∏ ℤ/ℓ`: `Φ = 1`, not open | Holds |
| 7.2 adjoint | `ad⁰ → ad/A·1` has kernel `A[n]·1` and cokernel `A/nA`; over `F_2`, rank 2: `F_2·1` and `F_2`. The class of `(a b; c d)` maps to `b e₁² + (d − a) e₁e₂ − c e₂²` (via `e₁* = −e₂ ⊗ ω`, `e₂* = e₁ ⊗ ω`), and the identity maps to `0`. `M = A ⊕ I`: `End/A = A ⊕ I ⊕ I⁻¹`, determinant line `A`; `Sym²` has determinant line `I³ ≅ I` | Holds |
| 7.3 similitudes | `P = diag(1₂, swap)`: `PᵀJ₄P` has entries `(1,4) = 1`, `(2,3) = 1`, `(3,2) = −1`, `(4,1) = −1`, the BCGP21/CG matrix; `J² = −1`, so both conventions give the same group. `dim sp₄ = 10`, `gsp₄ = 11`. Over `F_2`, `1 ∈ sp₄` | Holds |
| 7.9 adequacy (headlines) | `A = (0 4; 1 4)`: `A² = (4 1; 4 0)`, `A³ = 1`, `X² + X + 1` of discriminant `2` (nonsquare mod 5), `A + 3I = (3 4; 1 2)` of trace `0`, so `h₂` fails and the conclusion fails. `GL₂(F_7)`: `d = 2`, `6 ≤ 7`. `SL₂(F_5)`: `6 > 5` and `5 ∣ 120`, so the hypotheses fail, and it is not adequate | Holds |
| 7.10 enormity (headlines) | `SL₂(F_7)` enormous, `SL₂(F_5)` not (`H¹ ≠ 0`), `SL₂(F_3)` not (`ℤ/3`), on both sides of the rank-two equivalence. `X³ − 1` separable over `F_5`. `n = 2`, `p = 5`: `5 ≮ 5`, excluded | Holds |
| 7.11 vast and tidy | `F = ℚ(ζ_{p²})`: image `1 + p²ℤ_p`, `δ = 2`, so `N ≥ 3` (`p ≥ 5`) and `N ≥ 4` (`p = 3`). Scalar `λ`: `ν = λ²`; over `F_3`, `λ² = 1` | Holds |
| 7.6 projective lifting (headline) | `n = 1`: `PGL₁ = 1`, `r = 1` | Holds |

## Not verifiable

- ACC+ journal numbering and pages (Ann. of Math. is paywalled). In arXiv v2, Lemma 7.1.6 (lines 7871–7894) agrees with the README's restatement; the journal "Def. 6.2.29, p. 1044" was not confirmed.
- BHKT §2, p. 5 and Thm 4.8 (§§1.1, 1.5–1.6): the text was not found in the cache.
- KW (II), Lemma 4.3, and Serre, *Local Fields*: the manifest records both as uncertified.
- Books cited by locator: Deligne 1980 §1.6, Fulton–Harris §11.1, Dixon–du Sautoy–Mann–Segal Thms 8.32 and 9.6, Schneider Thm 27.1, Isaacs Cor. 11.22, Jantzen, Dickson 1901, Steinberg, Milne 2008, Mumford, Silverman, Bushnell–Henniart.
- Not opened this round: Brumer–Kramer 1994 (§§2, 6), Ulmer 2016, GHT and GHTT, KT, NT23, Qian, Patrikis, BCG 2025.

## Source issues

- **Error** in BLGG (arXiv:1106.5586v1) at Prop. A.2.1, p. 30, and Point 5 of its proof, p. 34: the source says projective image `PGL₂(F_5)` also has nonzero `H¹(G, gl₂)`, so it is not adequate; it should list only `PSL₂(F_5)` at `l = 5`, as Gee–Newton Lemma 3.2.3 states citing the published version; affects a stated result.
