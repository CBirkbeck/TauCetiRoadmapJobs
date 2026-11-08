# Review of ArithmeticGaloisRepresentations (pull request #856 at 72dcbb9)

**Verdict:** needs changes

## R01 (P2) — Four Tau Ceti names cited as existing are absent at the pinned Tau Ceti

**Location:**
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:358–362` (From Tau Ceti): "Hasse–Arf for abelian extensions `TauCeti.LocalFieldsRamification.hasseArf`, and the conductor exponent of a character `TauCeti.LocalFieldsRamification.artinConductorExponent` with Serre's lower-sum formula …".
- `README.md:2722–2727`, the last API bullet of §3.2 *Finite-level conductors*.
- `README.md:2984–2985` (Layer 3 Dependencies): "Hasse–Arf and character-conductor declarations listed in the supplier contracts".
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean:30`: "§2.4 to Tau Ceti's `TauCeti.ContinuousRep`".

**Claim:** the pinned Tau Ceti provides `TauCeti.LocalFieldsRamification.hasseArf`, `…artinConductorExponent` and `…artinConductorExponent_mul_card_lowerRamificationGroup_zero`. §3.2 states an API comparison with the second, and the module docstring calls `ContinuousRep` a Tau Ceti declaration.

**Witness:**
- In the pinned Tau Ceti (`a91d3aa`, the rev in `lake-manifest.json`), none of the four last components occurs in any `.lean` file. Its only Hasse–Arf results are the prime-degree `UpperJump.eq_of_finrank_prime` and `UpperJump.exists_eq_intCast_of_finrank_prime` (`NumberTheory/LocalField/Herbrand/HasseArf.lean:48, 137`).
- `hasseArf` is a planned export of the *Hasse–Arf* target of `Completed/LocalFieldsRamification/README.md:1022–1039` on main.
- The README itself attributes `ContinuousRep` to EtaleCohomologyFoundations §F.4.0 (`:46`, `:594`).
- A mechanical check of all 28 `TauCeti.*` names in the two files, and of the 118 names in the Tau Ceti contract, finds these four absent and every other name present.

**Repair:**
- Delete the three names from the Tau Ceti contract (`:358–362`). Cite Hasse–Arf by its owners, already in the contracts: LocalFieldsRamification *Hasse–Arf* for finite residue fields and RamificationOfCompleteDiscretelyValuedFields §3a.3 for perfect residue fields.
- Delete the `artinConductorExponent` bullet at `:2722–2727`. The comparison of a character's conductor with ClassFieldTheory's `characterConductorExp` is already the **Characters** target of §3.2.
- At `:2984–2985`, keep only "Tau Ceti's `TauCeti.IsLocalRing.ramificationGroup`" (present at `RingTheory/LocalRing/RamificationGroup.lean:114`).
- In `Suggested.lean:30`, write "EtaleCohomologyFoundations §F.4.0's `ContinuousRep`, which has no carrier at the pins".
- Rerun the name check: it then reports no absent name.

## R02 (P2) — §4.7 (a) quantifies over an unconstrained `F'` and is false as written

**Location:** `README.md:3243–3244`: "(a) for `p` odd, absolute irreducibility on `G_{F(ζ_{p^m})}`, `G_{F(ζ_p)}` and `G_{F'}` are equivalent".

**Claim:** for `p` odd these three absolute irreducibilities are equivalent. `F'` has no hypothesis in this paragraph; the paragraph before introduces it only as an arbitrary finite separable extension.

**Witness:**
- Take `F = ℚ`, `p = 7`, and `ρ̄` the 7-torsion of `y² + y = x³ − x`, which has image `GL₂(F_7)` (Serre 1972, 5.5.6, p. 310; `93970ed9…` lines 2031–2033).
- `ρ̄(G_{ℚ(ζ_7)}) = SL₂(F_7)`, which is absolutely irreducible.
- For `F' = ℚ(E[7])` the restriction to `G_{F'}` is trivial, which is not irreducible in dimension 2.

**Repair:**
- Replace `G_{F'}` by "`G_{F'(ζ_p)}` for `F'/F` finite and linearly disjoint from `K(μ_p)` over `F`". By the first paragraph of §4.7, `ρ̄(G_{F'(ζ_p)}) = ρ̄(G_{F(ζ_p)})`, which gives the equivalence.
- On the witness, `F' = ℚ(E[7]) = K` is not disjoint from `K(μ_7)`, so it is excluded.
- The `ζ_{p^m}` clause stays: `Gal(F(ζ_{p^m})/F(ζ_p))` is a `p`-group with `p` odd. It has no index-2 subgroup to swap two lines, and a scalar restriction would leave `G` with `p`-group projective image, which fixes a line in characteristic `p`.
- Clause (e) asserts `p > 3`, but its locator, ACC+ Lemma 7.1.6(1) (`7c882c4d…` lines 7871–7878), assumes `l > 2m + 3`, that is `l ≥ 7` for `m = 1`. For `p = 5` the source's own argument works. Linear disjointness gives `ad ρ̄(G_{F'}) = ad ρ̄(G_F) ∈ {A₅, S₅}`, with abelianisation `1` or `ℤ/2`. Since `5` is unramified in `F'`, `Gal(F'(ζ_5)/F') ≅ ℤ/4`, which is not a quotient of either group. Add this sentence after the locator.

## R03 (P3) — `Conductor.lowerConductors_integral` assumes characteristic-zero coefficients; its sources need only characteristic different from `p`

**Location:**
- `Suggested.lean:156`, `[Field C] [CharZero C]`.
- `README.md:2902–2905`: "a finite-dimensional representation `W` of `G` over a field of characteristic zero".

**Claim:** integrality of the finite-level conductors is stated for characteristic-zero coefficients.

**Witness:**
- Serre 1987 §1.2 (a) states integrality for representations over `F̄_p` at residue primes `l ≠ p` (`serre-1987-modular-galois` line 110). The README cites this item for its own setting-level statement at `:2913–2917`, for coefficients of characteristic `≠ p`. That case is the residual one behind `N(ρ̄)` in §3.3, and its images are finite, so it is statable with these carriers.
- The hypothesis cannot be dropped entirely. Take `L = ℚ_3(ζ_3, ∛2)`, with `G_0 = S₃`, `G_1 = C₃` and `G_2 = 1` (§3.0's Check). Let `W` be the reduction mod 3 of the standard representation, `{x ∈ F_3³ : Σ xᵢ = 0}`, which contains `(1,1,1)`. Then `codim W^{S₃} = codim W^{C₃} = 1`, and the lower Artin sum is `1 + (3/6)·1 = 3/2`.

**Repair:**
- Replace `[CharZero C]` by `(hC : ringChar C = 0 ∨ ringChar C ≠ ringChar (IsLocalRing.ResidueField B))`.
- In residue characteristic 0 with `char C = ℓ > 0` the statement still holds, since `G_1 = 1`.
- Change `README.md:2904` accordingly, adding the locator Serre 1987, §1.2 (a), p. 181. The route is unchanged: the wild part is lifted to characteristic zero, as in §3.2's *Wild characters*.
- Add the `S₃` mod-3 computation (`3/2`) as a negative-control Check.
- Rechecked: the standard representation of `S₃` over `ℚ` gives `2 + (1/2)·2 = 3` and Swan sum `1`, both natural numbers.

## R04 (P3) — The removed `GaloisRep.grothendieck_quasiUnipotent` is still cited by an open roadmap

**Location:**
- `README.md:1925–1926`: "this specialization is an adapter and has no statement of its own in `Suggested.lean`".
- The declaration is gone from `Suggested.lean`.

**Claim:** dropping the declaration needs no notice to consumers.

**Witness:** LefschetzPencilsAndVanishingCycles (open pull request #873, a new folder) cites "ArithmeticGaloisRepresentations Layer 2, §2.4 (`GaloisRep.grothendieck_quasiUnipotent`)" at `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:941`, and "operator of `GaloisRep.grothendieck_quasiUnipotent`" at `:1041`. Neither main nor any other open head cites it.

**Repair:**
- Add one old → new line to §2.4: "`GaloisRep.grothendieck_quasiUnipotent` → SmoothRepresentationsOfLocalGroups SR.5.2 *wd-complete-coefficients*, `grothendieck_quasiUnipotent_complete`".
- In the same author's #873, repoint `:941` and `:1041` to that target.

## R05 (P3) — The §2.4 Weil-group locator points at the absolute-value notation

**Location:** `README.md:1948`: "(Deligne 1973, §2.2.1, p. 521; ClassFieldTheory Layer 9, …" for open inertia in `W_K`, the degree map and `W_K = I_K ⋊ ⟨Φ⟩`.

**Claim:** Deligne 1973 §2.2.1 defines the local Weil group and its topology.

**Witness:**
- In Deligne 1973, 2.2.1 is the normalized absolute value and the quasi-character `ω_s` (`b03f483c…` lines 558–569, pp. 520–521).
- The inertia/wild-inertia filtration and Frobenius are 2.2.2 (lines 570–594, p. 521).
- The Weil group as the elements acting by an integral power of Frobenius, with `I` open, is 2.2.4 (lines 605–612, p. 522).

**Repair:** cite "Deligne 1973, 2.2.2–2.2.4, pp. 521–522".

## R06 (P3) — §5.11 is stated only for `G_ℚ` and rank 4, though its proof is general

**Location:** `README.md:3640–3644`: "`ρ : G_ℚ → GL₄(ℚ̄_p)` and `s : G_ℚ → GL_n(ℚ̄_p)` … (BCGP25, §4.11, p. 109)".

**Claim:** the annihilation identity is a rank-4, `G_ℚ` statement.

**Witness:**
- The proof uses only that `g ↦ P_ρ(g)(s(g))` is continuous and that Frobenius lifts above a density-one set are dense. §5.1 proves that density for every number field `K`.
- Rank 4 and `ℚ` come from BCGP25's `GSp₄` application (Prop. 4.11.1, `51d7eacc…` lines 4884–4892), which states no rank-4 identity of its own; the continuity step is inside the proof of Prop. 4.11.2 (lines 4931–4935).

**Repair:**
- State it for a number field `F`, `ρ : G_F → GL_m(ℚ̄_p)`, `m ≥ 1`, and a set of finite places of Dirichlet density one, keeping `GSp₄`/`ℚ` as the BCGP25 instance.
- Rechecked: the existing Checks (`s = ρ`; `ρ = 1^{⊕m}` with a unipotent `s`, where `(s(g) − 1)^m = 0`; the scalar `χ` counterexample) hold verbatim with `m` in place of 4.

## Previous findings

- **R01 (supplier monodromy restated): repaired.** `GaloisRep.grothendieck_quasiUnipotent` is deleted, and the supplier target is cited as "`wd-complete-coefficients` (Grothendieck monodromy, `grothendieck_quasiUnipotent_complete`)" (`README.md:647`, `:683`, `:1893–1894`, `:1912–1913`, `:1923`, `:2456`). The anchor `#grothendieck-monodromy` resolves at the SmoothRepresentationsOfLocalGroups head (its README heading `#### Grothendieck monodromy`, line 4637 of `roadmaps show --pr 1688`). Two consequences are raised above: the docstring attributes `ContinuousRep` to Tau Ceti (R01), and a consumer still cites the old name (R04).
- **R02 (finite-level conductors): repaired.** Added `Conductor.lowerArtinConductor`, `Conductor.lowerSwanConductor`, `Conductor.lowerConductors_integral` and `Conductor.lowerSwanConductor_le` on Tau Ceti's `IsLocalRing.ramificationGroup`. The docstring's "not statable" sentence is restricted to `G_K`-level conductors. The generality of the integrality hypothesis is R03 above; the new Tau Ceti contract lines are in R01.
- **R03 (Dickson locators): repaired.** "Darmon–Diamond–Taylor 2007, Thm 2.47(b), p. 81, and KW (I), §6, p. 9", "Lemma 6.1, pp. 9–10", and the trace-ratio proof are at `README.md:3140–3150`. KW (I) §6 starts at `khare-wintenberger-2009-i` line 349, preprint page 9, and Lemma 6.1 runs over lines 358–371 (pp. 9–10). Both KW References entries now say which pagination is used.
- **R04 (§1.12 finite quotient): repaired.** The text at `README.md:1462–1466` now says that none of the five statements passes through a finite quotient. A Check (`χ_ℓ ⊕ 1` on `G_{ℚ_p}`) is added at `:1487–1489`.
- **R05 (References): repaired.** All seven works are now listed in References (`README.md:5440–5602`; for example Fulton–Harris at `:5498`, SGA 1 at `:5504`, Rosengarten at `:5558`). The SGA 1 locator became "Exposé V, Prop. 8.2", which `grothendieck-raynaud-sga1` lines 4798–4805 (Exp. V, p. 117 of the edition) support as described.
- **R06 (pull-request description): not repaired.** The "Supplier amendments" paragraph still names "LocalFieldsRamification Layers 3a/4a" for what is the new folder RamificationOfCompleteDiscretelyValuedFields (#1410). It still lists LFunctions and CFSGBasicProperties among other authors' open pull requests, although both are folders on main. The description is not a file of this folder, so it is not counted as a finding of this review; the author can correct those two sentences when editing the description.

## Verified sound

**Gate and dependency check.**
- The gate as prescribed prints `gate ArithmeticGaloisRepresentations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's `gate.md` adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check prints `depcheck: 240 roadmaps, 2442 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration, signatures, probe.**
- `lake env lean` on `Suggested.lean` exits 0 in 59 s with exactly 21 `declaration uses sorry` warnings, at lines 67, 77, 88, 153, 178, 195, 226, 266, 283, 297, 311, 329, 357, 368, 389, 452, 465, 476, 485, 502 and 523. All five `TauCeti.*` imports have object files.
- A scratch file with `#check @…` for all 36 declarations elaborates every one. Compared with the README:
  - `lowerConductors_integral` keeps `[Finite G]`, `[IsDiscreteValuationRing B]`, `[IsAdicComplete …]`, `[PerfectField (ResidueField B)]`, `[FaithfulSMul G B]`, `[CharZero C]` and `[FiniteDimensional C W]`.
  - `lowerSwanConductor_le` keeps `[CharZero B]`, `[CharP (ResidueField B) p]`, `hC : ringChar C ≠ p` and `hc`.
  - The flag on `isEnormous_symPower` (`[Fintype n] [DecidableEq n]`) concerns the section variable `n : Type`, shadowed by the theorem's own `n : ℕ`, so nothing is lost.
- The one-tactic probe replaced every `sorry` by `first | rfl | simp | infer_instance | decide | trivial`. It gives 21 errors at the 21 theorems, so there is no padding.
- The two new definitions have real bodies (finsums over `i : ℕ` of `Nat.card` ratios times `finrank` of quotients by invariants), and each is needed to state a headline.

**Library declarations opened at the pins.**
- Tau Ceti `IsLocalRing.ramificationGroup` (`RingTheory/LocalRing/RamificationGroup.lean:114`, `ℤ`-indexed, `⊤` for `i ≤ −1`).
- `exists_forall_ramificationGroup_eq_bot` (same file, `:321`, under `[IsNoetherianRing S] [FaithfulSMul G S] [Finite (ramificationGroup G S 0)]`, which every DVR with finite `G` satisfies).
- `LocalFieldsRamification.lowerRamificationGroup` (`NumberTheory/LocalField/RamificationGroup.lean:97`, defined as the former on `𝒪[L]`).
- `HasseArf.lean` (prime degree only, see R01).
- Every name of the Mathlib contract (91) and of the Tau Ceti contract (118, of which three are absent: R01) was searched in the pinned sources.

**Cross-roadmap citations resolved.**
- SmoothRepresentationsOfLocalGroups at #1688: *wd-complete-coefficients* (README line 4639), `grothendieck_quasiUnipotent_complete` (its `Suggested.lean:348`), and the *full-wd-construction* specialization to finite `E/ℚ_ℓ` (line 4688).
- RamificationOfCompleteDiscretelyValuedFields at #1410: its §3a.3 Hasse–Arf, `hasseArf_dvd_sum_card_ramificationGroup` (`Suggested.lean:70`), uses the same carrier `TauCeti.IsLocalRing.ramificationGroup` in lower-numbering form for abelian `G`. It states no representation conductor, so `lowerConductors_integral` is not a restatement.
- ArtinRepresentations at #1711 consumes §§3.1–3.6 by name and "defines no conductor exponent" (its `README.md:201–206`). `roadmaps grep` over every open head and main finds no other `artinConductor`/`swanConductor` declaration.
- `scratch/overlaps.md` lists no dropped id and no conflicting head; the dropped Lean name is R04.
- `scratch/citations.md` lists only this roadmap's own declarations, two ReductiveGroupsPartII `Building.*` names, the AdicSpacesPartIII trace and `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`, which is present in Tau Ceti.

**Seeded sample** (cached texts opened at the locator).

| Target | What the cited text says |
| --- | --- |
| 1.4 | DDT `darmon-diamond-taylor-2007` lines 1985–1992 (p. 53: compact totally disconnected subgroups of `GL_d(ℂ)` are finite; mod `ℓ` representations have finite image); Chenevier `f3c0e0d8…` lines 1606–1610 (Ex. 2.34, p. 39: discrete topology, continuity); Serre 1987 lines 75–79 (1.1, p. 180: finite image in `GL₂(F_q)`). |
| 2.1 | DDT lines 1919–1926 (p. 51: the algebraic elements of the completion form `ℚ̄_p`, `G_p ≅ G_{ℚ_p}`); Deligne 1973 3.12 on p. 533 (`b03f483c…` line 870). |
| 2.4 | Deligne 1973 lines 1791–1807 (8.1, Thm 8.2, p. 566), 1869–1871 (8.3.7, p. 568), 1881–1905 (8.4.2–8.4.3, p. 569); FSY `835580aa…` lines 2436–2444 (§5.3.1, p. 54: quasi-unipotency and the formula `ρ(σF^n) = r(σF^n)exp(−t(σ)N)`); the Weil-group locator is R05. |
| 2.5a | Deligne 1973 (3.5.1) at line 761 (p. 528) and 8.12 at line 1972 (p. 572); Marzec–Neururer by locator. |
| 2.6 | FSY lines 2560–2592 (§5.3.2, pp. 56–57) and 2629 (Lemma 5.40, p. 58); Deligne 1980, Fulton–Harris and Tate 1979 by locator. |
| 2.7 | Deligne 1973 3.2 (line 690, p. 526), 3.4 (lines 723–740, pp. 527–528), 5.4–5.7 (to line 1294, p. 550); Tate 1979 and Kudla by locator. |
| 3.1 | Serre 1961 `serre-1961-corps-locaux` lines 1284–1293 (n° 3.7, (28)–(29), p. 137); the eventual Herbrand formula recomputed below. |
| 3.2 | Serre 1961 lines 1302–1333 (Thm 2, (31)–(33), p. 138) and 1343–1351 (Remarque 2°, p. 139: reduction of the totally ramified case to an algebraically closed residue field); Serre 1987 lines 1583–1601 ((4.9.1)–(4.9.2), p. 215). |
| 4.1 | Serre 1987 (1.3.8), p. 182, and 3.3, p. 198, as in the previous review; statements recomputed below. |
| 4.7 | Caraiani–Newton `57abc79a…` lines 4562–4572 (Lemma 6.1.4, p. 88) and 4726–4732 (Lemma 7.1.1, p. 92); ACC+ `7c882c4d…` lines 7871–7894 (Lemma 7.1.6) and 7947–7975 (Lemma 7.1.8, the normal subgroup `Δ` with surjective determinant); Newton–Thorne `6a156f7a…` lines 478–487 (Lemma 2.3(3), p. 11). Clause (a) is R02. |
| 5.2 | DDT Thm 2.3, p. 52; Tau Ceti Frobenius-on-`√d` names present at the pin. |
| 5.11 | BCGP25 `51d7eacc…` lines 4880–4935 (§4.11, pp. 109–110); generality is R06. |
| 6.6 | Serre 1987 lines 1564–1620 (§4.9: `K` of characteristic 0, perfect residue field, coefficients of characteristic `≠ p`, `e_K = v_K(p)`, Prop. 9 `b ≤ N e_K (c + 1/(p−1))`, p. 215; proof p. 216). |
| 7.8 | CHT Lemma 2.5.2 and Jantzen II.2.16 by locator; statements recomputed below. |
| 7.10 | Gee–Newton `068818a4…` lines 637 (standing `p > n ≥ 2`), 674–714 (Def. 3.2.1, Lemmas 3.2.3–3.2.5, p. 15); ACC+ lines 5988–6023 (enormous, its field invariance and the KT comparison) and 7852–7862 (Lemma 7.1.4). |

**Computed adversarial pass.** Matrices act on columns; `Φ` is arithmetic and `F = Φ⁻¹` geometric Frobenius.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| `lowerArtinConductor`, `lowerSwanConductor` (§3.2) | `χ_8` on `Gal(ℚ_2(ζ_8)/ℚ_2)`: orders `4,4,2,2,1`, `χ_8(5) = −1` so `codim = 1` for `i ≤ 3`; Artin `1+1+½+½ = 3`, Swan `2`; unweighted `4`, `3`. Regular representation of `Gal(ℚ_2(i)/ℚ_2)`: `1 + 1 = 2 = v_2(−4) = f·Σ(|G_i| − 1)`. `W = 0`: `0`. Infinite `G_0`: `Nat.card = 0`, every weight `x/0 = 0`. Non-faithful action: the kernel lies in every `G_i`, infinite support, finsum `0` | Holds; Checks agree |
| `lowerConductors_integral` (§3.5) | Standard `S₃` over `ℚ` on `ℚ_3(ζ_3, ∛2)` (`d = 7 = 5 + 2`, so `G_1 = C₃`, `G_2 = 1`): `2 + ½·2 = 3`, Swan `1`. Its reduction over `F_3`: `1 + ½ = 3/2`, excluded by `CharZero C`, but Serre 1987 §1.2(a) allows `char C ≠ p`. A faithful action on a complete DVR with perfect residue field makes `K = L^G` complete with perfect residue field (a finite extension `E` of an imperfect field `F` is never perfect, since `[F^{1/p^n} : F] → ∞`). Residue characteristic 0: `G_1 = 1`, Artin `= codim W^{G_0}` | Holds; R03 |
| `lowerSwanConductor_le` (§6.6) | `ℚ_2(√2)`: `G_0 = G_1 = G_2`, `G_3 = 1`, `Sw = 2`, `v_L(2) = 2 = |G_0|·1`, `c = 1`: `2 ≤ 1·1·2`. `χ_8` on `ℚ_2(ζ_8)`: `2 ≤ 1·1·(2+1) = 3`. Non-faithful `χ_{−4}` on `ℚ_2(ζ_8)`: `Sw = 1 ≤ 3`. `S₃` standard over `ℚ_3`: `v_L(3) = 6 = |G_0|`, `c = 1`: `1 ≤ 2·1·(1 + ½) = 3`. Equal characteristic: `addVal 0 = ⊤`, `toNat = 0`, bound `0`, excluded by `CharZero B` | Holds |
| 3.0–3.1 Herbrand Checks | `ℚ_3(ζ_9)`: `G_0 = 6`, `G_1 = G_2 = 3`, `G_3 = 1`, `d = 5+2+2 = 9`, `φ(2) = 1`, `ψ(v) = 6v − 4` for `v ≥ 1 = eu − d + e − 1`. Artin–Schreier `m = 1`: `d = 2(p−1)`, `ψ = pu − p + 1`. Imperfect `F_p(s)((t))`: `z = ty`, `z^p − t^{p−1}z = s`, inseparable residue, `|G_0| = p ≠ e = 1` | Holds |
| 1.4 no small subgroups | `|ζ_6 − 1| = 2 sin 30° = 1`, `|−1 − 1| = 2`; `(1 t; 0 1)^n − 1 = (0 nt; 0 0)`; `1 + pℤ_p` has `sup = p⁻¹`; `|λ^n − 1| ≤ r < 1` for all `n ∈ ℤ` forces `|λ| = 1`, then `λ = 1` | Holds |
| 2.1 decomposition | `p = 5` in `ℚ(∛2, ζ_3)`: `5 ≡ 2 mod 3` inert in `ℚ(ζ_3)`; `x³ − 2 ≡ (x − 3)(x² + 3x + 4)`, discriminant `9 − 16 ≡ 3` a nonsquare, so `|D_Q| = 2`, not normal in `S₃` | Holds |
| 2.4 adapter | `ρ(Φ)N(T⁻¹1)ρ(Φ)⁻¹ = N(χ_ℓ(Φ)T⁻¹1) = q N'`; Tate curve: `Φe₁ = qe₁`, `Φe₀ = e₀`, `Ne₀ = e₁`; `ℓ = p`: `χ_p(I_p) = ℤ_p^×` is not unipotent | Holds; locator R05 |
| 2.5a comparison | `ρ^∨(Φ⁻¹) = ρ(Φ)^T`, so `det(1 − Tρ^∨(Φ⁻¹)) = det(1 − Tρ(Φ))`; `S₃` dihedral: order 3 gives `1 + T + T²`, a transposition gives `1 − T²`; `χ_{−4}` at 2: `P = 1`, `Ind 1`: `1 − T` | Holds |
| 2.6 strings and filtration | `[H,N]e_i = −2e_{i+1}`, `[E,N]e_i = ((i+1)(d−i) − i(d−i+1))e_i = (d−2i)e_i`, `[H,E]e_i = 2i(d−i+1)e_{i−1}`. `Sp(2)`: `M_{−2} = 0`, `M_{−1} = M_0 = ⟨e₁⟩`, `M_1 = V`; `F` on `gr_{−1}` is `q⁻¹` (weight `−2 = w − 1`) and on `gr_1` is `1`, so `w = −1`; dual `M_{−1}(V^∨) = ⟨e₀*⟩ = ker(−N^T)` | Holds |
| 2.7 constants | `ℚ_3`, `ψ = e^{−2πi{x}}`, `c = 3`: `e^{−2πi/3} − e^{−4πi/3} = −2i sin(2π/3) = −i√3`; `𝔤 = 3^{−½}(−i√3) = −i`, `ε = −i·3^{½−s}`. Real: `∫x e^{−πx²}e^{2πixy}dx = i y e^{−πy²}`. Complex: `4∫r^{k+2t+2s−1}e^{−2πr²}dr = Γ_ℂ(s+t+k/2)`; `Γ_ℂ(1) = 1/π` | Holds |
| 4.1 oddness (headline) | `χ_{−3} ⊕ χ_{−4}` over `F_5`: `ρ(c) = −1`, `det = 1`. Order-3 element of `GL₂(F_2)`: charpoly `X² + X + 1`, no root in `F_2`, `ρ(c) = 1`, splits over `F_4`. Characteristic 2: `(M − 1)² = M² + 1 = 0` | Holds |
| 4.4 Dickson (headline) | `SL₂(F′)` traces cover `F′` via `(t −1; 1 0)`; for `q = 9` the squares (5 elements) exceed the proper subfield `F_3`, so `F_0 = F_9`. `Q₈ ⊂ GL₂(F_3)`: image `C₂²`, `n = 2`, `3 ∤ 2` | Holds |
| 4.7 restriction | (a) `F' = ℚ(E[7])` breaks it (R02). (d) `[G,G] ⊇ SL₂(F_p)` perfect. (g) normal subgroups of `GL₂(F_3)`: `1, ±1, Q₈, SL₂, GL₂`, and scalars have `det = λ²`. Persistence: `PSL₂(F_25)` minimal index `26 > 10`; `2.A₄ ⊂ SL₂(F_5)` has index `5 < 10`. (e) for `p = 5`: `A₅, S₅` have no `ℤ/4` quotient | R02 |
| 5.2 symbols | `(6/p) = (2/p)(3/p)`, so never three nonresidues; `(8/p) = (2/p)³`; density `1/[M:ℚ]` for the unique `σ` | Holds |
| 5.3 recognition (headline) | `ℤ/3` over `F_4`: traces `0 = 0`, polynomials `(X−1)² ≠ (X−ω)²`. `χ_ℓ` against `χ_ℓ⁻¹`: `X − p ≠ X − p⁻¹`. `1` against the character of `ℚ(√5)`: agreement density `½`, so `hPl` is needed | Holds |
| 5.4 rank two | `g = diag(2,3)`, `h = 1`: `6·(½+⅓) − 10 + 5 = 0`, with `T(gh⁻¹)`: `30 − 10 + 5 = 25` | Holds |
| 5.5–5.7 (headlines) | `Q₈` over `ℝ`: traces `2, −2, 0`, `B = ℍ`, `finrank 4 = 2²`; `L = ℝ`: `ℍ ≇ M₂(ℝ)` and no real form; `L = ℂ`: both true. `ω ⊕ ω²` of `C₃`: `X² + X + 1 ∈ F_2[X]`, realised by `(0 1; 1 1)`; `ω` alone has `X − ω ∉ F_2[X]`. `S₃` over `ℚ`: transposition eigenvalues `±1`, so it descends; `Q₈` over `ℚ` has no element with two distinct rational eigenvalues and no `ℚ`-form | Holds |
| 5.10 Carayol (headline) | `r = (1 ℓa; 0 1)`, `r' = 1` over `ℤ_ℓ`: equal residues, traces `2 = 2`, not conjugate; `habs` fails (span `{1}`) | Holds |
| 5.11 identities | `s = ρ`: Cayley–Hamilton; `ρ = 1^{⊕4}`, `s` unipotent: `(s(g)−1)^4 = 0`; `s = χ`: `(χ(g)−1)^4 ≠ 0` | Holds; R06 |
| 6.2–6.3 Tate curve (headline) | `q = p^ℓ`: `v(q) = ℓ`, so `E_q[ℓ]` is unramified; `q = p`: ramified; Lean `m = −v(j) = v(q)`, `p | m ⇔ p | v(j)`; `ℚ_2`: `T² + T + 1` has discriminant `−3`, a unit; swap eigensum `{x ≡ y mod 2}` | Holds |
| 6.4a Frattini (headline) | `(1+ℓ)^{ℤ_ℓ}`, `ℓ` odd: `Φ = (1+ℓ)^{ℓℤ_ℓ}` open; `P = 1`: infimum over no coatoms is `⊤`; `∏_ℓ ℤ/ℓ`: `Φ = 1` not open | Holds |
| 7.8 Clebsch–Gordan mod `p` | Transvection on `Sym^p V`: invariants `x^p`, `y^p − x^{p−1}y` (two blocks); `(u−1)^{p−1}(xy^{p−1}) = (p−1)! x^p ≠ 0`, so blocks `p, 1` against `2, p−1`. `SL₂(F_2)`: `x² + xy + y²` fixed; `y ↦ y + ux` adds `(u² + u)x²`. Trivial constituents at `2i ∈ {0, p+1, 2p−2}` | Holds |
| 7.9 adequacy (headlines) | `A = (0 4; 1 4)` over `F_5`: `A² = (4 1; 4 0)`, `A³ = 1`, charpoly `X² + X + 1` with `3 ∤ 4`, so `h₂` fails. `GL₂(F_7)`: `pGenerated = SL₂(F_7)`, `d = 2`, `6 ≤ 7`, adequate. `SL₂(F_5)`: `6 > 5` and `5 | 120`, hypotheses fail, and it is not adequate | Holds |
| 7.10 enormity (headlines) | `Q₈ ⊗ Q₈`: `g ⊗ h` of order-4 factors has eigenvalues `{−1, 1, 1, −1}`, never four distinct. `SL₃(F_5)`: companion of `X³ − 1`, separable as `5 ∤ 3`. `n = 2`, `p = 5`: `2n + 1 = 5 ≮ 5`, and `SL₂(F_5)` is not enormous | Holds |
| 7.6 projective lifting (headline) | `n = 1`: `PGL₁ = 1`, `r = 1` | Holds |
| 1.5–1.8 descent, Brauer–Nesbitt (headlines) | `a ↦ (1+ℓ)^a`: `E = K`; `F_2`, `ℤ/2`: `1 ⊕ 1` against `(1 1; 0 1)`, both `(X−1)²`, the second not semisimple; `d = 2` over `F_2` for a group: `det = 1`, so trace determines `X² − tX + 1` | Holds |

**Ownership.** Searched by object over main, the board packages and every open head (`roadmaps grep`, `roadmaps show`). The objects were finite-level Artin and Swan conductors, Hasse–Arf, Grothendieck monodromy, Dickson, image algebra, Carayol, adequacy and enormity. Only the R04 citation was found; ArtinRepresentations and RamificationOfCompleteDiscretelyValuedFields consume or state different objects (above).

## Not verifiable

- ACC+ published numbering and pages (Ann. of Math. is paywalled). In the cached arXiv v2 the enormity definition is Def. 6.2.28, field invariance Lemma 6.2.29 and the KT comparison Rem. 6.2.30 (`7c882c4d…` lines 5988–6023, pp. 148–149). The README's "Def. 6.2.29, Lemma 6.2.30, Rem. 6.2.31, pp. 1044–1045" is consistent with a uniform shift by one in the journal version, but that was not confirmed. The numbers of Lemmas 7.1.4, 7.1.6 and 7.1.8 agree with v2.
- KW (II), Lemma 4.3 (manifest: uncertified); Serre, *Local Fields* (manifest: uncertified).
- Books cited by locator: Jacobson *Basic Algebra II* §5.2, Fulton–Harris §11.1, Tate 1979, Kudla, Jantzen II.2.16, Dickson 1901, Isaacs Cor. 11.22, Silverman *Advanced Topics* V.5, Mumford, Milne 2008, Bushnell–Henniart §32.6, Schneider §27, Dixon–du Sautoy–Mann–Segal.
- Not opened this round: Calegari–Geraghty 2018, Marzec–Neururer, Saha, Ulmer, Deligne 1980, Boxer–Calegari–Gee 2025 Thm 3.1, CHT Lemma 2.5.2, Clozel–Thorne 2017.

## Source issues

- none
