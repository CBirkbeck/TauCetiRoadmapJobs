# Review of ArithmeticGaloisRepresentations (pull request #856 at 8325334)

**Verdict:** needs changes

This is an incremental re-review of the 43 lines changed since a6dc48d, all in `README.md`: §3.1 (finite wild image, Swan API), §3.3 (Weil–Deligne conductor API, one Check) and §3.6. `Suggested.lean` is byte-identical to a6dc48d.

## R01 (P2) — Eight Tau Ceti names exist only at main's newer Tau Ceti, not at this branch's pin

This is R01 of the previous report, and it is not repaired.

**Location:**
- `README.md:728–729`: "at the pin they are Tau Ceti's `TauCeti.ContinuousRep`, `TauCeti.ContinuousRep.Iso`, `TauCeti.ContinuousRep.ofCharacter` and `TauCeti.ContinuousRep.baseChange`".
- The same names appear at `:366–368`, `:738`, `:742` and `Suggested.lean:30`.
- `Matrix.transpose_mul_J_mul_eq_smul_iff` appears at `:381`, `:4091` and `:4541`.
- `TauCeti.LocalFieldsRamification.hasseArf` and `…artinConductorExponent` (with its `_mul_card_lowerRamificationGroup_zero` lemma) appear at `:359–361`, `:2735` and `:2737`.

**Claim:** these are declarations of the pinned Tau Ceti.

**Witness:** `lake-manifest.json` pins Tau Ceti `a91d3aa`. Grepping its `.lean` files for `ContinuousRep`, `transpose_mul_J_mul_eq_smul_iff`, `hasseArf` and `artinConductorExponent` finds 0 files for each. Main's pin `2fd255d` has all of them: `ContinuousRep.lean:82`, `SymplecticMultiplier.lean:71`, `HasseArf/Abelian.lean:50`, `ArtinConductor.lean:69, 182`.

**Repair:** rebase the branch on main, which pins Tau Ceti `2fd255d` with `v4.36.0-rc2`. Then rerun `lake build TauCetiRoadmap.ArithmeticGaloisRepresentations.Suggested` and the gate.

If the branch keeps `a91d3aa`, make these three changes instead:
- write `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` (`SymplecticMultiplier.lean:86` at `a91d3aa`) at `:381`, `:4091` and `:4541`;
- cite `ContinuousRep` only as EtaleCohomologyFoundations §F.4.0's carrier at `:366–368`, `:728–729`, `:738`, `:742` and `Suggested.lean:30`;
- drop the LocalFieldsRamification names at `:359–361` and `:2735–2737`.

## R02 (P3) — §3.6 attributes the global divisibility `N(ρ̄^ss) | N(ρ̄)` to a local inequality about a different representation

**Location:** `README.md:2972` and `:2976`: "the first inequality being §3.4's `a(W) ≥ a(W^ss)` for `W = ρ̄_Λ`, … and `N^{(ℓ)}(ρ̄_Λ^ss) | N^{(ℓ)}(ρ̄_Λ) | N^{(ℓ)}(ρ)` by the local chain at each `v ∤ ℓ`".

**Claim:** the local chain at `v` gives `a_v(ρ̄_Λ^ss) ≤ a_v(ρ̄_Λ)`, where `ρ̄_Λ^ss` is the `G_F`-semisimplification.

**Witness:** take `E = 11a1` and `ℓ = 3`. Here `3 ∤ v_11(Δ) = 5`, and `E[3]` is irreducible because the isogeny class has only 5-isogenies. So `ρ̄^ss = ρ̄` and `a_11 = 1`. The local chain bounds the `G_{ℚ_11}`-semisimplification `ω ⊕ 1`, which has `a_11 = 0`, not `ρ̄^ss`.

**Repair:** replace "by the local chain at each `v ∤ ℓ`" with this text:

> at each `v ∤ ℓ`, a `G_F`-composition series of `ρ̄_Λ` restricts to a `G_{F_v}`-stable filtration with graded pieces `ρ̄_Λ^ss|_{G_{F_v}}`. So §3.4's `a(V) ≥ a(V') + a(V'')` (`README.md:2856`) gives `a_v(ρ̄_Λ^ss) ≤ a_v(ρ̄_Λ)`, and the local formula above gives `a_v(ρ̄_Λ) ≤ a_v(ρ)`.

Test on `11a1` at `11`: `1 ≤ 1 ≤ 1`, with `a_11(V_3E) = 1` since the reduction is split multiplicative. The Swan terms are `0` and are additive because `11 ≠ 3`.

## Previous findings

- R01 — not repaired: `README.md:728–729` "at the pin they are Tau Ceti's `TauCeti.ContinuousRep`, … `TauCeti.ContinuousRep.baseChange`", with `lake-manifest.json` still pinning Tau Ceti `a91d3aa`, where none of these names exist. Written again as R01 above.
- R02 — repaired: `README.md:2844–2845` "`a_2 = codim ρ̄^{I_2} + Sw(ρ̄) = 1 + 1 = 2`, while a definition keeping only the tame term `codim ρ̄^{I_2}` gives `N(ρ̄) = 2`". The word "wild" is gone, and the wrong-definition value is now a conductor.
- R03 — repaired: `README.md:2964–2965` now reads "`Sw(ρ̄_Λ) = Sw(ρ)` (Darmon–Diamond–Taylor 2007, Lemma 2.7, pp. 54–55; Ulmer, §6, p. 5)". The chain now has its own route, through §3.4, saturation and §1.9. The new global clause of that route is R02 of this report.

## Verified sound

**Gate, dependency check and diff.**
- The gate as prescribed prints `gate ArithmeticGaloisRepresentations: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run on this head also has `build=0`.
- The dependency check prints `depcheck: 245 roadmaps, 2476 edges, 0 problem(s)` (exit 0), with no UPWARD, CYCLE or `moved:` line. The roadmap is on line 46 of the merge order.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The diff since a6dc48d touches only `README.md` (27 insertions, 16 deletions). `Suggested.lean` has 0 diff lines.
- `scratch/overlaps.md` lists no other open pull request changing this folder, and no dropped or revision-only id.
- The changed lines add no section id, no backticked name of this roadmap's own and no cross-roadmap citation.
- Consumers of the touched ids still resolve: ArtinRepresentations `README.md:131` (§3.1's `Conductor.breaks` and `Conductor.swanConductor`) and PadicDifferentialEquationsAndRigidCohomology `README.md:490, 492` (§3.1, and §3.4's Swan additivity). Both cite this roadmap as the single owner.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 in 26 s, with exactly 21 `declaration uses sorry` warnings and nothing else.
- The flagged `ContinuousRep.baire_descent` (line 67) carries every binder of its own signature (`[Group Γ]`, `[TopologicalSpace Γ]`, `[IsTopologicalGroup Γ]`, `[CompactSpace Γ]`, `[T2Space Γ]`, `[Fact ℓ.Prime]`, `[FiniteDimensional ℚ_[ℓ] K]`), so nothing is dropped.
- The other 35 `#check @` types are unchanged since the previous report's comparison with the README, because the file and both pins are unchanged.
- The padding probe and the headline list of the previous report still apply:
  - Frobenius-polynomial recognition and its inputs;
  - oddness, Dickson, adequacy and enormity;
  - `lowerConductors_integral` and `lowerSwanConductor_le`;
  - descent, projective lifting, Frattini detection and the multiplicative criterion.

  All are stated, and the docstring names the unstatable endpoints.

**Seeded sample where it meets the diff (3.2, 3.6).** Cached texts were opened at each locator:

| Target | Locator | Text at the locator |
| --- | --- | --- |
| 3.6 Swan equality | Darmon–Diamond–Taylor 2007, Lemma 2.7, pp. 54–55 | `darmon-diamond-taylor-2007` lines 2053–2063: equal Swan integrals for `p ≠ ℓ`; `N(ρ) = N(ρ̄)∏ p^{dim ρ̄^{I_p} − dim ρ^{I_p}}`. Lines 2030–2032: the reduction kernel is pro-`ℓ`, so `ρ(P_p) ≅ ρ̄(P_p)` |
| 3.6 Swan equality | Ulmer, §6, p. 5 | `ulmer-2016-conductors` lines 242–246 (p. 5): the reduction mod `𝔪_E` has the same wild conductor as `ρ_ℓ` |
| 3.6 lattice independence | §1.9 | `README.md:1253–1254`, *Independence of the lattice*: `(Λ/ϖΛ)^ss ≅ (Λ'/ϖΛ')^ss` |
| 3.2 (cited by the changed Check) | Serre 1987, §1.2, (1.2.1)–(1.2.2), pp. 180–181 | `serre-1987-modular-galois` lines 82–108: `n(l, ρ) = Σ dim V/V_i / (G_0 : G_i)`, computed on `ρ` itself, `= dim V/V_0 + b(V)` |
| 3.2 finite-level sums | Serre 1961, n° 3.7, (28)–(29), p. 137 | `serre-1961-corps-locaux` lines 1284–1291 (extraction page 34, printed 137): the Artin conductor as the weighted sum over `g_i` |
| 3.1 (changed) | Ulmer, §5, p. 4 | Lines 185–192: the reduction kernel of `GL_n(O_E)` is pro-`ℓ`, and `P_F` is pro-`p`, so `ρ_ℓ(P_F)` is finite. This supports the stated reason; injectivity follows from the trivial intersection |
| 3.1 (changed) | Ulmer, §4, (4.1), pp. 3–4 | Lines 114–141 and 158–168: `a = Σ codim V^{G_i}/[G_0:G_i] = ∫ codim V^{G^s} ds`, and `δ = ∫_0^∞ … = Σ_{i≥1} …`, which is the integral against the weighted lower sum |
| 3.3 (changed) | Ulmer, §§6–8, pp. 5–7 | Lines 286–288: the correspondence is independent of `t_ℓ` and `Φ` up to isomorphism. Line 303: `a_D(ρ_ℓ) = a(ρ_ℓ)` |

The README flags no locator as unverified. The other sample targets (1.10, 2.1, 2.1a, 2.6, 3.5, 4.1, 4.4, 4.6, 5.8, 5.10, 6.4a, 7.9, 7.11) lie outside the diff, and their text is unchanged since a6dc48d.

**Adversarial pass.** Matrices act on columns, and `Φ` is arithmetic Frobenius. New rows come first. Rows marked (r17) carry forward the previous report's values for statements the diff leaves untouched.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| §3.1 (c): `ρ(P_K) → GL(Λ/𝔪Λ)` injective (changed) | `ℓ = 2`, `p = 3`: an order-3 rotation in `GL_2(ℤ_2)` reduces to order 3 in `GL_2(F_2)`. The kernel `1 + 2M_2(ℤ_2)` is pro-2 and meets a pro-3 group trivially | Holds |
| §3.1 `ℓ = p` failure (changed) | `χ_p(I_{ℚ_p}) = ℤ_p^× = μ_{p−1} × (1+pℤ_p)`. Since `I/P` is pro-prime-to-`p`, `χ_p(P)` is the pro-`p` Sylow, `1+pℤ_p`. For `p = 3` this is `Gal(ℚ_3(ζ_{3^∞})/ℚ_3(ζ_3))`, infinite. Mod 3 it is `1`, so it is not injective | Holds |
| §3.1 integral = weighted lower sum (changed) | `χ_8` on `ℚ_2(ζ_8)`: `G_1` has order 4, `G_2 = G_3 = {1,5}`, `G_4 = 1`. The lower sum is `1 + ½ + ½ = 2`. With `φ(1) = 1` and `φ(3) = 2`, the integral is `∫_0^2 1 du = 2` | Holds |
| §3.1 `Sw ≤ highestBreak·dim V`, equality iff at most one break (changed) | `χ_8`: `2 = 2·1`, one break. `1 ⊕ χ_{−4}`: breaks `{0,1}`, `Sw = 1 < 1·2`. `V = 0`: `0 = 0`, no break. `1`: `0 = 0·1`, break `{0}` | Holds |
| §3.3 `a(Sp(n) ⊗ χ)` (changed) | `n = 3`, `χ` unramified: `0 + 3 − 1 = 2`. `n = 1`: `0`. `n = 2`, `χ = χ_{−4}` over `ℚ_2`: `V^{r(I)} = 0`, giving `2·2 = 4`. `n = 2`, `χ` tame: `2`, matching the Check at `:2819` | Holds |
| §3.3 `a(ρ) = a(WD ρ)` for every `Φ` and `t_ℓ` (changed locator) | The Tate-curve Kummer representation: `1` on both sides. `a(r,N)` depends only on `r|_{I_K}` and `N`, which a change of `Φ` or `t_ℓ` replaces by isomorphic data | Holds |
| §3.3 Check `χ̄_{−4} ⊕ 1` over `F_3` (changed) | `σ(1+i) − (1+i) = −2i` has `v_L = 2`, so `G_0 = G_1 = C₂` and `G_2 = 1` (§3.2 at `:2744`). `−1 ≠ 1` in `F_3`, so the tame term is `1`, the Swan term `(2/2)·1 = 1` and `N = 2^2 = 4`. Tame-only gives `2^1 = 2` | Holds |
| §3.6 `Sw(ρ̄_Λ) = Sw(ρ̄_Λ^ss)` via §3.4 (changed) | `k_E` has characteristic `ℓ ≠ p`, so `G_i` (`i ≥ 1`) invariants are exact. §3.4 at `:2854–2855` states `Sw(V) = Sw(V^ss)` for this setting (`:2484`: coefficients of characteristic `≠ p`) | Holds |
| §3.6 saturation argument (changed) | `Λ/Λ^I ↪ V/V^I` is torsion-free, so `Λ^I` is a direct summand of rank `dim V^I`. Unipotent `(1 t; 0 1)`: on `ℤ_ℓ²` the drop is `1 − 1 = 0`, `a(ρ̄) = 1`. On `ℤ_ℓe₁ ⊕ ℓℤ_ℓe₂` it is `2 − 1 = 1`, `a(ρ̄) = 0`. For `χ_{−3} ⊕ 1`, `ℓ = 2`: `a_3(ρ̄) = 1 − 1 = 0` | Holds |
| §3.6 local chain `a(ρ̄^ss) ≤ a(ρ̄) ≤ a(ρ)` (changed) | Unipotent: `0 ≤ 1 ≤ 1`. `χ_{−3} ⊕ 1` at `3`, `ℓ = 2`: `0 ≤ 0 ≤ 1`. Left exactness gives `dim W^I ≤ Σ dim(gr)^I` | Holds |
| §3.6 global `N(ρ̄^ss) \| N(ρ̄) \| N(ρ)` (changed) | `11a1`, `ℓ = 3`: `11 \| 11 \| 11`. The local `G_{ℚ_11}`-ss `ω ⊕ 1` has `a = 0`, which differs from `a_11(ρ̄^ss) = 1` | The statement holds; the route is R02 |
| §3.3 global conductor (r17) | Trivial: `(1)`. `ω_p`: `1`. `χ_{−4}`: `4`. `χ̄_{−3} ⊕ 1` over `F_5`: `3`; over `F_2`: `1`, against the lift's `3` | Holds |
| `lowerConductors_integral`, `lowerArtinConductor`, `lowerSwanConductor`, `lowerSwanConductor_le` (r17) | `ℚ_3(ζ_3,∛2)`: `3`, `1`, and `3/2` over `F_3` (excluded by `hC`). `χ_8`: `3`, `2`. `ℚ_2(√2)`: `2 ≤ 2`. `S₃`: `1 ≤ 3` | Holds |
| §§3.0–3.2, 3.3 `a(r,N)` Checks (r17) | `ℚ_2(ζ_8)`: `ψ = 4u − 5`. `ℚ_3(ζ_9)`: `ψ = 6u − 4`. `(5,2)_2 = −1`. `Sp(2) ⊗ χ` tame: `2`, and `1` with `ker N` | Holds |
| §§4.1, 4.4, 4.6, 4.7 (r17) | `ρ(c) = −1` for `χ_{−3} ⊕ χ_{−4}` over `F_5`. `Q₈ ⊂ GL₂(F_3)`. `ℚ(√2,√3)` at `3`: `e = f = 2`. `PGL₂(F_3)^ab = ℤ/2` | Holds |
| §§1.5–1.10, 2.1, 2.5a, 2.6 (r17) | `ℤ/3` over `F_4`: equal traces, different polynomials. `p = 5` in `ℚ(∛2,ζ₃)`: `\|D\| = 2`. `S₃`: `1 − T²`. `[H,N] = −2N` | Holds |
| §§5.3–5.11, 6.2–6.4a (r17) | `χ_ℓ` against `χ_ℓ⁻¹`. `n = 2`, `q = 2`: `3/8`. `(1 ℓa; 0 1)` against `1`. `(1+ℓ)^{ℤ_ℓ}` open, `∏ℤ/ℓ` not open | Holds |
| §§7.2–7.11 (r17) | `F_2` rank 2: kernel `F_2·1`. `dim gsp₄ = 11`. `(0 4; 1 4)` over `F_5` fails `h₂`. `SL₂(F_7)` enormous, `SL₂(F_5)` not. `ℚ(ζ_{p²})`: `δ = 2` | Holds |

**Library declarations opened.**
- Tau Ceti `a91d3aa`: `SymplecticMultiplier.lean:86` (`det_eq_of_transpose_mul_J_mul_eq_smul`). A grep for the four R01 names returned 0 files.
- Tau Ceti `2fd255d` (main's pin): `ContinuousRep.lean:82`, `SymplecticMultiplier.lean:71`, `HasseArf/Abelian.lean:50`, `ArtinConductor.lean:69, 182`.

## Not verifiable

- Brumer–Kramer 1994 (§3.4's `Sw(V) = Sw(V^ss)` and superadditivity, Lemma 2.4 and (2.1), p. 229): the text is not in the cache, and the locator is unchanged by the diff. The two facts were rechecked mathematically above.
- Serre, *Local Fields*, and Khare–Wintenberger (II): recorded as uncertified in the manifest.
- ACC+ journal numbering, BHKT, and the books cited by locator only: as in the previous report, outside the diff.

## Source issues

- **Misprint** in ulmer-2016-conductors at §5, p. 4: the source says the tame quotient `I_F/P_F` is the product of `ℤ_r` over primes `r` different from `q`, the residue-field cardinality. It should be over primes `r ≠ p`, the residue characteristic, as on p. 3 and p. 6. Affects nothing.
