# Review of SchemeAndStackFoundations (pull request #1656 at 73bec93)

**Verdict:** accepted

This is an incremental re-review of the 139 lines changed since `cc2d7b9` (all in `README.md`; `Suggested.lean` and every file outside the folder are unchanged). All six findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: "(it is perfect, Stacks, Lemma 36.11.8 (0FDC), so it is a bounded complex of finite locally free sheaves, Lemma 36.37.2 (0F8F)), and `K_0(X) → G_0(X)` is an isomorphism (Lemmas 36.38.4 (0FDI), 36.38.5 (0FDJ))" (`README.md:7887–7889`).
- R02 — repaired: "*StackInGroupoids.ofSheaf* (the stack in setoids of an fppf sheaf; Lemma 8.6.3 (0432)), *yonedaEquiv* (`Hom(h_T, X) ≃ X(T)`; Stacks, Categories, Lemma 4.41.2 (004B))" (`README.md:3385–3386`).
- R03 — repaired: "Stacks, Lemma 21.11.1 (0CK0)" (`README.md:4065`) and "Stacks, Definition 83.8.1 (04AA), Definition 83.10.1 (04AE)" (`README.md:3285`).
- R04 — repaired: "(Poonen 2017, §5.12.5.3, over a field, where the inverse map is subtraction of the class of `E`; over a general base it is the fppf-local form of that statement …)" (`README.md:3230–3232`); the closing locator reads "§§5.12.5.1 and 5.12.5.3" (`:3239`).
- R05 — repaired: "a domain that is a finite extension of a Japanese domain, the structure map injective by `[FaithfulSMul R S]`, is Japanese; Lemma 10.161.5 (032I), finite case" (`README.md:1925–1927`).
- R06 — repaired: *yonedaEquiv*, *isFiberedInGroupoids*, *limit*, *mk_eq_zero_iff*, *mk_tensor*, *pullback*, *brauer_affine_iff*, *functoriality* and *gysin_self_intersection* are italic (`README.md:3386–3388`, `:5282–5284`, `:7697–7698`, `:7721`, `:7738`), and so are about fifty further README-only suffix names across §§0.26–5.9.

## Verified sound

**Scope of the change.** `git diff --stat cc2d7b9 HEAD` shows `README.md` only, 72 insertions and 67 deletions. `git diff --stat origin/main...HEAD` outside the folder is empty. The diff has 46 hunks: five locator or wording repairs (R01–R05) and 41 hunks that only replace backticks by italics.

**Gate, dependency check and elaboration.**
- The worker's gate at 73bec93: every check `=0`, `build=0`, "OK". I re-ran the gate on this head: every text check `=0`, "OK".
- Dependency check (`gate --depcheck … --movable --pr 1656`) output: `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0 with 54 `declaration uses sorry` warnings and no other diagnostic, the same as at `cc2d7b9` (the file is byte-identical).
- The one-tactic probe and the `#check` signature comparison are carried from the previous report: no declaration changed. The settled disposition of `universalHomeomorphismEtaleEquivalence_functor` is unchanged.

**The repaired locators, read in the Stacks book text (cache `5b3a46c2`).**
- Lemma 36.11.8 (0FDC), line 147032: on a regular scheme every object of `D^b_Coh` is perfect. This is the step R01 asked for.
- Lemma 36.37.2 (0F8F), line 150188: on a quasi-compact quasi-separated scheme with the resolution property, a perfect object is a bounded complex of finite locally free modules. A Noetherian scheme is quasi-compact and quasi-separated, so the README's hypotheses cover it.
- Lemma 36.38.4 (0FDI), line 150302: `K_0(X) → K'_0(X)` is an isomorphism for `X` Noetherian regular. Lemma 36.38.5 (0FDJ), line 150329: `K_0(Vect(X)) → K_0(X)` is an isomorphism under the resolution property.
- Categories, Lemma 4.41.2 (004B), line 5611: the 2-Yoneda lemma for a category fibred in groupoids, `G ↦ G(id_U)` an equivalence.
- Lemma 8.6.3 (0432), line 17597: now attached to *StackInGroupoids.ofSheaf*, which it supports.
- Lemma 21.11.1 (0CK0), line 92799; Definition 83.8.1 (04AA), line 297329; Definition 83.10.1 (04AE), line 297370.

**The italics repair (41 hunks).**
- I extracted the 56 names that lost their backticks and matched each against the 107 declarations of `Suggested.lean`. None is declared there. The only name-level coincidence is *pullbackSnd* in §4.2, which is the Artinian fibre product's projection and not `AlgSpace.pullbackSnd` (`Suggested.lean:311`).
- The names left in backticks in the changed passages are declared: `artinBootstrap` (`Suggested.lean:400`), `torsorRepresentability` (`:388`), `levelMap` (`:871`), `AdicRing` (`:861`), `AdicThickeningSystem` (`:877`); `intersectionNumber` in §5.9 is Tau Ceti's (`TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean`).
- The gate's `readme-ids-missing=0` agrees.

**Seeded sample, where it falls in the changed passages.** The sampled sections touched by the diff are 1.17, 4.7, 5.3 and 5.4 (the other sampled sections have no changed line and their locators stand as the earlier reviews read them). I matched each Stacks locator of the touched paragraphs against the book text.

| Target | Locators checked (book line) | Outcome |
|---|---|---|
| 1.17 | Definition 83.8.1 (04AA) 297329; Definition 83.10.1 (04AE) 297370; Theorem 80.10.1 (04S6) 291655 | As cited |
| 4.7 | Definition 15.37.1 (07E8) 61480; Definition 87.9.9 (0AIF) 304390 | As cited |
| 5.3 | Section 42.25 (02SN) 177719; Section 42.28 (02TG) 178036 | As cited; Fulton under Not verifiable |
| 5.4 | Section 42.36 (02TV) 179009; Section 42.37 (02TZ) 179129; Section 42.43 (02UK) 179787 | As cited; Fulton under Not verifiable |

In the other touched paragraphs I also matched 03BU 253455, 03BY 253574, 03BZ 253579 (§1.7); 0A7B 193020, 0A87 194506, 0A86 194481, 0A7M 193163, 0AX1 193170, 0A7L 193157 (§2.21); 06GC 311808, 06G9 311788, 06GD 311826, 06GH 311909, 06GW 312066 (§4.2). All agree.

**Cross-roadmap citations and overlaps.** The diff adds or changes no cross-roadmap citation and no `*Needs:*` line. The overlap list is the same as last round: no id cited here is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id that others cite. The four pull requests that change this folder are ordered in the description's merge-order block ("#1276 → **this pull request** → #1807 → #1808 → #1854"). No declared gaps (no readable `design/plan.json`, no `What <Supplier> must provide` contract).

**Adversarial table.** The first six rows are the statements whose text the diff changes, with values computed this round. The remaining rows are carried from the previous report (review of `cc2d7b9`, same table), since their statements are untouched.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.20 `TauCeti.Ring.IsJapanese.of_finite` as now described | `ℤ → ℤ[i]`; `ℤ → 𝔽_p` | injective, finite, `ℤ` Japanese, so `ℤ[i]` Japanese; `p · 1 = 0 = 0 · 1` so `FaithfulSMul` fails and the case is excluded | Pass; R05 repaired |
| §1.16 *twistingBijection* with its new locator | `G = C₂` over `ℝ`, `E = Spec ℂ` | `G` commutative, so `innerForm G E = G`; `H¹ = {0, [ℂ]}`; `P ↦ P + [E]` sends `0 ↦ [ℂ]` and `[ℂ] ↦ 2[ℂ] = 0`; the inverse subtracts `[E]` | Pass; base point goes to the class of `E`, as Poonen §5.12.5.3 |
| §1.18 *yonedaEquiv* (004B) | `X = h_Y`; `X = BG` | `Hom(h_T, h_Y) = Y(T)`, a set on both sides; `Hom(h_T, BG)` is the groupoid of `G`-torsors on `T`, the fibre `BG(T)` | Pass; R02 repaired |
| §1.18 *StackInGroupoids.ofSheaf* (0432) | a presheaf that is not a sheaf | its category fibred in setoids is not a stack, by the iff of Lemma 8.6.3 | Pass |
| §5.7 *K0.toG0_bijective* | `Spec k`; `Spec k[ε]/(ε²)` (not regular) | `K_0 = G_0 = ℤ`, the map is the identity; `K_0 = ℤ·[A]`, `G_0 = ℤ·[k]`, `[A] = 2[k]`, so the map is multiplication by 2 and not surjective | Pass; regularity is needed and stated |
| §2.4 scope sentence (0CK0) and §1.17 invariant sheaf (04AA) | locators only | 0CK0 is Lemma 21.11.1 (line 92799); 04AA is Definition 83.8.1 (line 297329) | Pass; R03 repaired |
| `exists_linear_normalization` and its finite-field control | `𝔽₂[X,Y]/(XY(X+Y))`, `z = x²+xy+y²` | `x³ − zx = −xy(x+y) = 0`; `x`, `y`, `x+y` each vanish on a component | Pass (carried) |
| §0.2 pinned criteria | `A = O_S`; `A = O_S/I` | bijective on sections; surjective on sections | Pass (carried) |
| §0.12 `Scheme.strictLocalRing` and its two theorems | `Spec 𝔽_p`; Zariski stalk of `ℤ_(5)` | fibre `𝔽̄_p`; `x²+1` has roots `2, 3` mod 5 and none in `ℚ` | Pass (carried) |
| §0.12 *isHenselization_strictLocalRing* | `S = Spec k`, `k` separably closed | `strictLocalRing s = k`, `ψ = 𝟙` | Pass (carried) |
| §0.14 *henselian_pair_characterisations* and permanence | `I = R`; `(ℤ_p, (p))`, `S = ℤ_p × ℤ_p` | `R = 0`; idempotents `{0, 1, (1,0), (0,1)}` on both sides | Pass (carried) |
| §0.20 `isNagata_iff_isJapanese`, *test_not_japanese_dvr* | a field; a non-Japanese DVR | both sides true; N-1 and not N-2 | Pass (carried) |
| §0.23a `Scheme.Hom.etaleSite`, `isEquivalence_etaleSite` | `Spec 𝔽_{p²} → Spec 𝔽_p` | 2 endomorphisms against 4 after base change | Pass (carried) |
| §1.6 *etaleQuotientTheorem* | `U ⊔ U` with the fold kernel pair | quotient `h_U` | Pass (carried) |
| §1.14 groupoid laws, *stabilizer* | `r = (1,0)`; monoid `{1, z}`; `μ_p` in characteristic `p` | `c(r, i r) = (1,1)`; `z∘i(z) ≠ 1`; `k[λ]/(λ−1)^p` | Pass (carried) |
| §1.16 *contractedProduct* | `P = X = Spec L`, `L/K` quadratic | quotient `Spec K ⊔ Spec K`; the presheaf quotient has no `K`-point | Pass (carried) |
| §1.18 *Stack.stackification* Checks | circle with `B(C₂)` | 2 classes against 1 | Pass (carried) |
| §1.19 *IsDeligneMumford* | `Bμ_p` over `𝔽_p`; `B𝔾_m` | ramified diagonal; fibre `𝔾_m` | Pass (carried) |
| `isAffine_of_H1_vanishing`; §2.6 twisting-sheaf vanishing | `ℙ¹`, `d = −1`, `d = −2` | `H¹(O(−1)) = 0`, `H¹(O(−2)) = k` | Pass (carried) |
| `noetherianSpace_vanishing` | point; spectrum of a DVR | `H^p = 0` for `p > 0`; `p > 1` | Pass (carried) |
| Nisnevich carriers | `Spec ℂ → Spec ℝ`; `ℤ[1/2][x]/(x²+1)` at `(5)` | degree 2, rejected; `(x−2)(x−3)` mod 5 | Pass (carried) |
| `nonempty_CH_coprod`; §5.1 *ratEquiv_mem_iff* | `∐_ℕ Spec κ`; `∐_ℕ 𝔸¹` with `Σ[0_n]` | `∏_ℕ ℤ` on both sides; class 0 | Pass (carried) |
| §3.5 *lineBundleNorm* | `z ↦ z²` on `ℙ¹` | `Norm O(1) = O(1)`, `Norm O(2) = O(1)^{⊗2}` | Pass (carried) |
| §3.6 *picardComponent* | pointless real conic | cokernel `ℤ/2 = Br(ℝ)` | Pass (carried) |
| §4.5 *ObstructionTheory* | `Λ[[t]]/(t²)`, `t ↦ ε` | lift needs `ε² = 0` in `k[ε]/(ε³)`, false | Pass (carried) |
| §4.16 `IsAlteration` | Frobenius of `𝔸¹_{𝔽_p}`; `Spec ℤ[i] → Spec ℤ`; `Spec k → Spec k ⊔ Spec k` | degree `p`; degree 2; not dominant | Pass (carried) |
| §5.7 *K0.toG0* on the nodal cubic, *chow_blowup_formula* | `L_λ`; point in `ℙ³` | equal in `G_0`, `det ≠ O` in `K_0`; degrees sum to `k` | Pass (carried) |
| `weil_bound` | `y² + y = x³` over `𝔽₂` | `|3 − 3| = 0 ≤ 2√2` | Pass (carried) |
| Curve headlines | étale double cover of genus 2 | `g' = 3` | Pass (carried) |
| Brauer headlines | `ℍ/ℝ`, `B = ℂ` | `ℂ ⊗ ℍ ≅ M₂(ℂ)`, rank `4 = d²` | Pass (carried) |

## Not verifiable

- Fulton 1998 (§§5.1, 5.3–5.7): no legal copy in the sources cache; the diff changes no Fulton locator.
- SGA 6, Exposé 0, Appendice, and the other non-Stacks references of §5.7: not fetched; unchanged by the diff.
- Hartshorne 1977 and de Jong 1996: settled as uncertified; the diff changes no locator into them.
- Poonen 2017 §5.12.5.3 was read at the previous head (lines 6517–6530 of the author's copy); this round I checked only that the README now cites it and describes it in the same direction.

## Source issues

- none
