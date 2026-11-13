# Review of ProetaleCohomologyOfPAdicCurvesAndTowers (pull request #2287 at 41dab20)

**Verdict:** needs changes

## R01 (P1) — §3.3 asserts an exact sequence that fails for proper curves

**Location:** `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` line 473: "Prove that the exact sequence `0 → O(Y_S)/O_C → Symb_p(Y) → (A_st ⊗̂ H¹_dR(Ỹ_S))^{N=0, φ=p} → 0` does not depend on `r ↦ p^r`".

**Claim:** For the quasi-compact curves of the section (affinoid or proper) the sequence is not exact on the right, and integrally it is only `p²`-exact; `A_st` is used here and defined nowhere in the README.

**Witness:** Good-reduction elliptic curve: `O(Y_S)/O_C = 0`, `Symb_p(Y) ≅ ℤ_p²`, while the target, rationally `X^1_st(H¹_HK)`, maps onto `H¹(Y, O) = C` by §4.7. CDN-CURVES lines 3673–3674 and 3686: `p²`-exact, continuing to `H¹(Y_S, O)`.

**Repair:** Replace the sentence by: "Let `A_st = A_cris[Log p̃]^PD`, with `φ(Log p̃) = p·Log p̃` and `N = d/dLog p̃`, and `ι_p̃(x) = 1 ⊗ x − Log p̃ ⊗ Nx` (CDN-CURVES §6.4.4, lines 3749–3761). Prove that the map `ι_p̃ ∘ α ∘ δ_p̃: Symb_p(Y) → (A_st ⊗̂ H¹_dR(Ỹ_S))^{N=0, φ=p}` and the sequence `0 → O(Y_S)/O_C → Symb_p(Y) → (A_st ⊗̂ H¹_dR(Ỹ_S))^{N=0, φ=p} → H¹(Y_S, O)`, which is `p²`-exact for `p > 2` and exact up to one further power of `2` for `p = 2`, do not depend on `r ↦ p^r` (CDN-CURVES Propositions 6.26 and 6.29); the last map is not zero for a proper curve of positive genus." Add the elliptic curve as a Check: the sequence reads `0 → 0 → ℤ_p² → (…)^{N=0, φ=p} → H¹(Y_S, O)`, in agreement with §4.7.

## R02 (P3) — undefined index set in §3.2(d)

**Location:** `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` line 460: "`(∏_{s∈Σ(Y) int} H¹_rig(Y_s^sp)) ⊕ (∏_{s∈∂Y} H¹_rig(Y_s^sp)^{[1]})`".

**Claim:** `Σ(Y) int` is not defined: §2.2 defines `S_int = S ∖ ∂Y` and `Σ(Y)` only.

**Witness:** README line 369 (the definitions of §2.2); CDN-CURVES line 3579 prints the same undefined symbol, while its line 382 has `S_int`.

**Repair:** Write `∏_{s∈Σ(Y)∖∂Y} H¹_rig(Y_s^sp)` (equivalently over `S_int`, the components `ℙ¹` contributing `0`). On the closed annulus with its two boundary Gauss points the index set is empty and the piece is `0`, as the second Check of §3.2 requires.

## R03 (P3) — the gluing isomorphism has two directions

**Location:** `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` line 369: "the gluing isomorphisms `ι_{a,s}: Y_{a,s} ≅ Y_{s,a}`".

**Claim:** §2.3 gives the same map the opposite source and target.

**Witness:** README line 388: "`ι_{a,s}: Y_{s,a} → Y_{a,s}` … has source the ghost circle of the short `Y_s` and target that of the leg `Y_a`" (CDN-CURVES lines 1673–1676).

**Repair:** In §2.2 write "the gluing isomorphisms `ι_{a,s}: Y_{s,a} ≅ Y_{a,s}`", from the ghost circle of the short to that of the leg.

## R04 (P3) — "recovered" Bruhat–Tits tree

**Location:** `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` line 172: "For the recovered Bruhat–Tits tree of `PGL₂(K)`, `H¹(Γ, L) = 0` and `H¹_c(Γ, L) ≅ LC(ℙ¹(K), L)/L`".

**Claim:** "recovered" is neither a standard term nor defined; nothing in §0.1 recovers the tree.

**Witness:** The word occurs once in the README (line 172); the `*Needs:*` line of §0.1 takes the tree from ReductiveGroupsPartII RG2.2.

**Repair:** "For the Bruhat–Tits tree of `PGL₂(K)` (ReductiveGroupsPartII RG2.2), a locally finite graph without legs, oriented arbitrarily, `H¹(Γ, L) = 0` and `H¹_c(Γ, L) ≅ LC(ℙ¹(K), L)/L`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `generalizedSteinberg_isIrreducible` (§0.4(a)) | `d = 0`; `d = 1`, `J = ∅`, `J` all; `ℓ ≠ p` | `Sp_∅ = A` (dim 1); `LC(ℙ¹)/A` and `A`; CDN-STEIN line 1922 excludes `ℓ ≠ p`; GK14 lines 1300, 1328–1332 | holds; four one-tactic probes fail | none |
| §0.1 exact sequence | one vertex, two legs; one leg | `0 → 0 → L → L² → L → 0 → 0`, alternating ranks `1 − 2 + 1 = 0`; `coker(L → L) = 0` | holds | none |
| Conventions, `WD_Y` law | `Φ = diag(1, q)`, `Ne₁ = e₀` | `NΦe₁ = qe₀ = qΦNe₁`; `ΦNΦ^{−1}e₁ = q^{−1}e₀`; CDN-CURVES line 4432 prints `+deg`, line 4437 needs `−deg` | README law right | none |
| §1.1 | `Spa(C)`; open disc; closed disc `ℓ ≠ p` | `H⁰ = ℚ_p(1)`; non-injective (CDN-STEIN lines 114–117); `0 = 0`; route = CDN-STEIN lines 1420–1433 | holds | none |
| §1.2 | `H = C̆`; `∏_ℕ C̆` | `B_st^+`; `∏ B_st^+`; equals CDN-CURVES lines 170–172 since `B_st^+` is free over `B_cris^+` | holds | none |
| §1.4 | `ι_ϖ(Ψ_ϖ(u))`; `ϖ → ϖw` | `e·log([ϖ^♭]/ϖ) − ℓ_a = ι_p(u) − log_K(a)`; `exp(e·log w·N_p)exp(−(log a + e·log w)N_p) = exp(−log a·N_p)` | holds | none |
| §2.2 | disc, annulus, Tate curve | `H¹_c^*` ranks `0`, `1`; triangle fine, two-point loop not | holds | R03 |
| §2.3 | `ω = Σ p^n T^{p^n−1}dT` on the annulus | primitive has coefficient `1` at `T^{p^n}`: `[ω] ≠ 0`, zero in `H^sep`; CDN-CURVES lines 1748, 1854, 1926 | holds | none |
| §3.2 | closed annulus, closed disc | `Γ_int = ∅`, pieces `0, 0, C̆(−1)`: dim `1`; disc `0`; CDN-CURVES lines 3577–3582 | holds | R02 |
| §3.3 complex and regulator | `f = 1 + pT`; shifted cone | `−(1 − φ/p)x − dy = 0`; with CDN-CURVES line 2093's sign `2(1 − φ/p)x ≠ 0`; `Cone[−1]^n = A^n ⊕ B^{n−1}` | holds | none |
| §3.3 last sentence | good-reduction elliptic curve | left `ℤ_p²`; right ⊗ℚ_p has Dimension `(1, 2)` and quotient `C` | fails | R01 |
| §4.5 | `N∘g` on `P(u)`; cocycle | `χ^{−1}P′(χ^{−1}(u + c)) = χ^{−1}g∘N`; needs `c(gh) = c(g) + χ(g)c(h)`; CDN-CURVES lines 4515–4536 | holds | none |
| §4.6 Check | `y² + y = x³` over `𝔽₂` | 3 points, `a = 0`, `X² + 2`, twisted `X² + 1/2` | holds | none |
| §4.8 | `μ_{p^∞}`; `y² = x³ − x`, `p = 5` | Dimension `(1, 1)`; `Δ = 64`, unit; CDN-CURVES lines 4017–4028, 4049–4056 | holds | none |
| §4.9 | `μ_{p^∞}` in three normalizations | `D_raw`: `(B_cris^+)^{φ=p}`; `D_contra` with `F = p`: `ℚ_p`; CDN-CURVES lines 4054, 4125–4129 | holds | none |
| §5.1 | chain model of `𝔸¹` | `X₁X₂ = ϖ^{m+1}T·ϖ^{−m}T^{−1} = ϖ`; `C_0 = ℙ¹`; CDN-STEIN lines 682–691 | holds | none |
| §5.3 | `p = 2`, `r = 2`; `r = 0` | `a = 2`, `p^a a! = 8`; CDN-STEIN lines 196–199, 1411–1433, 2193–2203 | holds | none |
| §5.4 | `Spf O_K`, `r = 1`; `u` | fibre of `θ: (B_cris^+)^{φ=p} → C`: `H⁰ = ℚ_p t`, `H¹ = 0`; `φ(u) = pu`, `θ(ι(u)) = 0`; CDN-STEIN lines 964, 1442, 1453, 1525 | holds | none |
| §6.3 | `N = 0`; `d = 1` | `q^s N = q^{s+1}N`, `q ≠ 1`; GK05 lines 1209 (`d ≥ 2`), 1254–1255; CDN-STEIN line 2157 | holds | none |
| §6.10 | `d = 1`; shifts | `H¹_c = St`, `H²_c = Λ(−1)`; `−(d+1) + 1 − i = −d − i`; DAT06 lines 1325–1327, 1997–2003, 2044–2049 | holds | none |
| §7.1 | `(3I₂, 3)`; `q = 2` | `9·9^{−1} = 1`; deck orders `12` and `3`; STR08 lines 372–390 | holds | none |
| §7.3 | `M_{0,C}^ϖ = Ω ⊔ Ω`, `f = (0, 1)` | `df = 0`, zero in `O/H⁰_dR`; CDN20 lines 914–927, 2123–2131 | holds | none |
| §7.6 | `A = B = 0`; `D = E = 0`; `{ℤ/p^n}` | kernels; cokernels; limit `ℤ_p`; CDN23 lines 1240–1294 | holds | none |
| §7.8 | `F = ℚ_p` in (c); `n = 1`, level `2` | dense-image map gives `Hom ≠ 0`; `Ǧ_1` trivial gives `Π_M(V) = 0`; CDN23 lines 955, 1458–1545 | holds | none |

- Source locators checked against the text: 96, in CDN-CURVES, CDN-STEIN, CDN20, CDN23, CDN-DUKE, GK05, GK14, STR08, DAT06, THO24; all sampled targets and the three flagged source corrections (README lines 57, 204, 483) confirmed.
- Library declarations opened at the pins: 21 (for example `Mathlib/RepresentationTheory/Irreducible.lean` line 29, `Mathlib/RepresentationTheory/Basic.lean` line 329, `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean` line 195, `TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean` lines 48, 80, 190, 196); all exist as cited.
- Cross-roadmap citations resolved at main or at the open heads: 31 roadmaps, every cited section heading or named target found, including `Semistable.aOmega` (AInfCohomology §AI.6.2) and *segment-representations* (SmoothRepresentationsOfLocalGroups SR.5.2).
- Gate: every check passed. Dependency check: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: `sorry` at line 121 the only warning; `#check` types compared with README §§0.3–0.4, no binder lost; probes `infer_instance`, `simp`, `rfl`, `exact` on the headline all fail: no padding.
- Gaps: `formal-syntomic-period-comparison`, `period-rings-general-C` and `endomorphism-characteristic-polynomials` are precise and minimal (PadicPeriodRings §4.1 builds the rings on `C_K` only). README line 139 states a fourth, `completed-semistable-ring-general-K` (PadicHodgeTheory §0.6), which the declared list lacks.
- Pull-request text read against the head: no sentence contradicted; the description says it adds the roadmap and names every supplier in an open pull request.
- Overlap check: read CstConjectureForDaggerVarieties, CohomologyComparisons, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeTheory, CohomologyComparisonsPartII, FlagVarieties, AdicSpacesPartIV; nothing shared (Scholze §0.2 imports §§7.1, 7.2, 7.6–7.7 from here; CstConjecture §1.5 keeps the model-free diagram).

Source independence: 30 passages compared with 9 sources, none shared; largest share CDN-CURVES, 118 of 302 locators; contents compared with CDN-CURVES: independent (Layer 2 draws on its chapters 3, 4.1, 5.1 and 6.2, Layer 3 on 4.2, 5.2–5.4 and 6.3–6.4, Layer 4 on 6.4.6, 7 and 8, the order being forced by the `*Needs:*` lines of §§3.5, 4.1 and 4.2).

## Not verifiable

- SS91, IS01, DS01, NAK84, KM74 and BW00: cited by locator only (settled as uncertified, or no text held); their statements were read through CDN-STEIN, GK05, GK14 and CDN23.
- CN-I line 448 and CGN23: not opened; they support a comparison Check and the scope of Part II, not a sampled target.

## Source issues

- **Error** in CDN-CURVES at Proposition 6.29, lines 3766–3769: the source says the symbol sequence is exact and ends in zero; it should be `p²`-exact and continue to `H¹(Y_S, O)`, as in Proposition 6.26; affects a stated result.
- **Misprint** in CDN-CURVES at §8.2.5, line 4432: the source says the semidirect product law has the factor `p` to the power `deg g₁`; it should be the power `−deg g₁`, to agree with `Ng = p^{deg g}gN` at line 4437; affects nothing.
- **Misprint** in CDN-CURVES at §4.2, lines 2104–2106 (also lines 532 and 3616): the source says the second regulator component is `(1/p)·log(φ(ũ)/ũ^p)`; with the differential of line 2093 it should be `(1/p)·log(ũ^p/φ(ũ))`, as at line 2109; affects nothing.
- **Error** in CDN-CURVES at §4.2, line 2096 (also line 3676): the source says `H⁰_syn` is `ℤ_p t` in all cases; for `p = 2` it should be the larger lattice containing `t/2`; affects nothing.
- **Misprint** in CDN-CURVES at §0.2.1, lines 293–294: the source says `ι_{a,s}` goes from `Y_{a,s}` to `Y_{s,a}`; it should go from `Y_{s,a}` to `Y_{a,s}`, as in §3.5.1, lines 1673–1676; affects nothing.
- **Misprint** in CDN-CURVES at Remarque 6.22(ii), line 3579: the source says the product runs over an index set written as `Σ(Y)` with a subscript `int`, never defined; it should be `Σ(Y) ∖ ∂Y`; affects nothing.
- **Misprint** in CDN-STEIN at §5.2.2, line 1936: the source says the dual of `Sp_J(Λ)` is the limit of the duals of the `LC(X_{n,J}, Λ)`; it should be the annihilator of the relation submodule in that limit; affects nothing.
- **Gap** in CDN20 at Théorème 0.4, line 202: the source says the Hyodo–Kato multiplicity isomorphism holds for every supercuspidal `M`; it should assume slope `1/2`, as at lines 644 and 654; affects a stated result.

## For the human reviewers

- **Scope.** Layers 2–4 rest on CDN-CURVES (118 of 302 locators), which the README's References list only as arXiv:2101.06647v2, with no journal reference; the other principal sources are listed with journals.
