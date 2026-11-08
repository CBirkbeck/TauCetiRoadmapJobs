# Review of BordismFormalGroups (pull request #1807 at b0ef636)

**Verdict:** accepted

Incremental re-review of the 23 README lines changed since 0f7ed58 (16 insertions, 7 deletions, `README.md` only; `Suggested.lean` is byte-identical to the head the previous review elaborated). The three P3 findings of the previous review are repaired and the repairs introduce no new problem: every pinned declaration the new text cites exists at Tau Ceti 2fd255d9 in the module the README names, and is cited for the statement it makes. The worker's gate passes every rule, the dependency check prints no UPWARD or CYCLE line, nothing changed outside the fourteen folders the pull request declares, and `Suggested.lean` elaborates at the pin with only its `sorry` warning. No finding remains.

## Previous findings

- R01 — repaired: README line 144–145 now reads "the universal strict coordinate `TauCeti.FormalCoordinate.universalStrictCoordinate` (module `TauCeti.RingTheory.PowerSeries.Coordinate.Universal`) and the bijection `TauCeti.LazardRing.coordinateChangeLift` (module `CoordinateChange.Lazard`)". At the pin the declaration is `TauCeti/RingTheory/PowerSeries/Coordinate/Universal.lean` line 58 inside `namespace TauCeti.FormalCoordinate` (line 50), of type `FormalCoordinate (MvPolynomial ℕ+ A)`, with coefficient `bᵢ` in degree i + 1 (`coeff_succ_universalStrictCoordinate`, line 64); the module claim for `coordinateChangeLift` is unchanged and correct.
- R02 — repaired: lines 291–299 now say the degree-p^k obstruction, k ≥ 1, "is the coefficient of X^(p^k) in [p]_G(f(X))−f([p]_F(X)) times C_(p^k)" (`homogeneousComponent_homDefect_eq_smul_lazardCocycle`), "vanishes automatically when k is below both heights, since each composite then has order at least p^h>p^k (`PowerSeries.order_subst` … with `height_eq_natCast_iff`), and for f the identity series, whose defect is F−G, this is `succ_le_order_sub_of_lt_height`". Each clause matches its pinned declaration (see Verified sound); the identity-series restriction of `succ_le_order_sub_of_lt_height` is now stated.
- R03 — repaired: lines 82–87 now say "f=g∘Frob^h for some h with ord f=p^h and an isomorphism g from the h-fold Frobenius twist of F to G, and g is unique once h is fixed by the order (`existsUnique_iso_comp_iterateFrobeniusHom_of_order`, same module)". `Frobenius/Factorization.lean` line 139 gives the existence with `f.toPowerSeries.order = (p ^ h : ℕ)` and `g : FormalGroupIso (F.map (iterateFrobenius K p h)) G`; line 125 gives `∃! g` for a given h with that order; both under `[Field K] [Fact p.Prime] [CharP K p]` (line 52), the README's "field of characteristic p".

## Verified sound

**Change outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen declared folders prints nothing. The diff of this folder since 0f7ed58 is the one `changes.md` quotes: 23 lines of `README.md`, nothing in `Suggested.lean`.

**Gate and dependency check.** The worker's gate at b0ef636 (`gate.md`): every counter 0, build 0, `OK`. The dependency check, re-run by me:

```
depcheck: 241 roadmaps, 2368 edges, 0 problem(s)
```

The diff adds no roadmap name, no `*Needs:*` edge and no supplier-table row; the three touched passages cite Tau Ceti modules only. My policy scan of the README for process words, pull-request numbers and round labels: no hit.

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at the pin (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): exit 0, the single warning `56:8 declaration uses 'sorry'`. The elaborated signature (worker's `signatures.md`, same as the previous round) is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`, matching README lines 269–274 hypothesis for hypothesis; all binders are the declaration's own. The worker's extraction again lists two spurious entries (`,` and `and`) parsed from the docstring; the file declares one theorem. Headline list, docstring of the non-statable headlines, and the one-tactic padding probe (`simp` fails with "no progress") are unchanged from the previous report and carry forward.

**The pinned declarations the diff cites**, opened at Tau Ceti 2fd255d9:

- `TauCeti.FormalCoordinate.universalStrictCoordinate`: `PowerSeries/Coordinate/Universal.lean` line 58, as in R01 above.
- `TauCeti.FormalGroupHom.existsUnique_iso_comp_iterateFrobeniusHom_of_order` (`Frobenius/Factorization.lean` 125): for `f : FormalGroupHom F G`, `h : ℕ`, `f.toPowerSeries.order = (p ^ h : ℕ)`, `∃! g : FormalGroupIso (F.map (iterateFrobenius K p h)) G, g.toHom.comp (F.iterateFrobeniusHom p h) = f`.
- `exists_iso_comp_iterateFrobeniusHom` (line 139): for `f.toPowerSeries ≠ 0`, `∃ h g, f.toPowerSeries.order = (p ^ h : ℕ) ∧ g.toHom.comp (F.iterateFrobeniusHom p h) = f`; its proof (146) is the uniqueness lemma applied to the h of `exists_order_eq_pow_of_natCast_eq_zero`.
- `FormalGroup.homogeneousComponent_homDefect_eq_smul_lazardCocycle` (`Obstruction.lean` 400): under `constantCoeff f = 0`, `p.Prime`, `(p : R) = 0`, `k ≠ 0` and `p ^ k ≤ (F.homDefect G f).order`, `homogeneousComponent (p ^ k) (F.homDefect G f) = ↑(coeff (p ^ k) (subst f (G.nsmulSeries p) − subst (F.nsmulSeries p) f) • lazardCocycle (p ^ k) R)`. `subst f (G.nsmulSeries p)` is [p]_G(f(X)) and `subst (F.nsmulSeries p) f` is f([p]_F(X)); `homDefect` (`Hom.lean` 57) is f(F(X,Y)) − G(f(X), f(Y)), so for f = X it is F − G as the README says. The README's "k≥1" is the lemma's `k ≠ 0`.
- `PowerSeries.order_subst` (`PowerSeries/Substitution.lean` 194, inside `namespace PowerSeries` opened at 108): for `constantCoeff φ = 0`, `order (f.subst φ) = φ.order * f.order`.
- `FormalGroup.height_eq_natCast_iff` (`Height/Basic.lean` 211): under `[Fact p.Prime] [CharP K p] [F.IsComm]`, `F.height p = h ↔ (F.nsmulSeries p).order = (p ^ h : ℕ)`. For the infinite-height case the README's "order at least p^h" is the zero p-series (`height_eq_top_iff`, line 205: `F.height p = ⊤ ↔ F.nsmulSeries p = 0`), whose every composite is 0 of order ⊤; the sentence remains true there and no change is needed.
- `FormalGroup.succ_le_order_sub_of_lt_height` (`LeadingDifference.lean` 112): `k < F.height p`, `k < G.height p`, `p ^ k ≤ (F.toPowerSeries − G.toPowerSeries).order` ⇒ `p ^ k + 1 ≤ …`, the identity-series case.

**The route the repaired sentence claims.** With ord f ≥ 1 (constant coefficient 0, f ≠ 0) and k below both heights h_F, h_G (finite), `order_subst` gives ord([p]_G(f(X))) = ord f · p^(h_G) ≥ p^(h_G) ≥ p^(k+1) > p^k and ord(f([p]_F(X))) = p^(h_F) · ord f ≥ p^(k+1) > p^k, so the coefficient of X^(p^k) in the difference is 0 and the degree-p^k obstruction vanishes; for f = 0 both composites are 0. This is the inference the README states.

**Adversarial table.** Rows for passages the diff leaves untouched carry forward the values of the previous (r14) report and of r9/r11 behind it; the three touched statements are recomputed on this head.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Lemma A2.2.7 general form: existence and uniqueness (README 80–87) | f = [p]_𝔾ₘ = X^p over 𝔽_p; f = [p]_𝔾ₘ ∘ [p]_𝔾ₘ = X^(p²) | order p = p^1, h = 1, twist of 𝔾ₘ is 𝔾ₘ (coefficients in 𝔽_p are Frobenius-fixed), g = id, unique by line 125; order p², h = 2, g = id; with h = 1 for X^(p²) the hypothesis of line 125 fails, so uniqueness is only "once h is fixed by the order", as the README says | true as stated | none (R03 repaired) |
| Universal strict coordinate and `coordinateChangeLift` (139–146) | coefficient of X², X³ of the universal coordinate; φ = X | b₁, b₂ (`coeff_succ_universalStrictCoordinate`, line 64–65); linear coefficient 1 so strict; (F, X) ↦ the ring map killing every b_i, matching `tensorLift_counit_id_comp_coproduct` | true; name now exists at the pin | none (R01 repaired) |
| Obstruction in degree p^k and its automatic vanishing below both heights (288–299) | F = G of height 2 over 𝔽₂, f = X + X², k = 1; negative control F = 𝔾ₐ, G = 𝔾ₘ over 𝔽₂, f = X, k = 1 | first: ord([2]_G(f)) = 1·4 = 4 > 2, ord(f([2]_F)) = 4·1 = 4 > 2, coefficient of X² is 0, degree-2 part of f(F(X,Y)) − F(f(X), f(Y)) is 2XY = 0; control: heights ⊤ and 1, k = 1 not below h_𝔾ₘ, defect X+Y − (X+Y+XY) = XY, coefficient of X² in [2]_𝔾ₘ(X) − [2]_𝔾ₐ(X) = X² − 0 is 1, and 1·C_2 = XY, so the obstruction is nonzero exactly as the lemma computes and the "below both heights" hypothesis is needed | true as stated; hypothesis present | none (R02 repaired) |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 269–274) | r14 instances (𝔾ₐ, 𝔾ₘ over 𝔽̄_p; F = G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p) | r14 values (heights ⊤ and 1, no iso; X; twist shows `IsSepClosed` is needed and present) | true as stated | none |
| Height definition, `heightIdeal_eq_bot_iff_le_height`, exponent-two statements, mod-2 cocycle diagonal, additive series, universal exponent-two generators, Lazard grading, `lazardGcd` values, invariant differential, log, exp Checks, `log_smul`, Frobenius-twist Checks, n-series laws, prime-series form (README 64–79, 122–132, 150–245, 251–269, r14 numbering before the diff’s net nine-line shift) | r14 instances | r14 values | all true (r14) | none |
| Kudo–Borel instance, nilpotent completion, Steenrod Checks, Milnor primitives, MU/MO Hurewicz Checks, π₀MO, Toda brackets, James construction, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (README 335–512, 634–660, 985–1012, 1945–2000, 2109–2111 in r14 numbering) | r9 instances | as in r9 | all correct (r9) | none |

**Seeded sample.** The targets "Lazard ring, cocycle lemma and Hopf algebroid", "Invariant differential, logarithm and exponential", "Exponent two", "Height and Lazard's classification", "Steenrod algebras and mod-p Adams towers", "Unoriented coefficients" and "The smoothing-and-triangulation comparison" were verified at their locators in the previous report (ravenel-green lines 19937–20817, quillen-fgl-bulletin 72 and 110, hatcher-at 21563–22197, guillou-weibel 748–788, miller-cobordism 1023–1373, GeometricTopology README on main lines 930–943); the diff touches only the Lazard-ring and height passages, where it changes citations of pinned Lean declarations and no source locator, so those verifications stand. The README flags no locator as unverified.

**Cross-roadmap citations and ownership.** The diff adds none; the resolutions of the previous report (AlgebraicTopology, GeneralizedCohomology and CharacteristicClasses at this head; CompactGroups, SchurWeyl, ConvexityToric, DGAInfinity, ProfiniteCohomology, TopologicalKTheory, ModularCurves, EllipticCurves on main) and its ownership search over main and the open heads (no other roadmap declares `nonempty_formalGroupIso_iff_height_eq` or states Lazard's classification) carry forward; the worker's `citations.md` for this head lists nothing unresolved.

## Not verifiable

- Bousfield (1979) §6 Theorem 6.6, Thom (1954) Chapitre IV, James (1955), Toda (1962), Whitehead (1940), Munkres (1966), Lubin–Tate, Wilson, Johnson–Wilson, Hovey–Strickland, Symonds: uncertified or no open copy in the cache; cited by locator, untouched by the diff.
- Whether TangentialBordism (#942 head) and HomotopySpheres (#1287 head) have repointed to F2, F4 and F6.2: untouched by this diff and their reviews' business, as in the previous report.

## Source issues

- none
