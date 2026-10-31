# GATE-PeriodsAndSpecialValues~3: answers to human review

Two points, both from one comment. Commit `58a34e85` on top of `a651410`; README only, `Suggested.lean` unchanged.

## H01 (mycaule) — applied

PS.7.4 now cites the primary source before HMS: "(Kontsevich–Zagier (KZ), §1.2, Conjecture 1, and §4.1, where it is stated for the effective algebra, whose injectivity passes to the localization since every element of P is x/Lⁿ with x ∈ P_eff and evaluates to per(x)/(2πi)ⁿ; HMS, Theorem 0.2, p. 2; …)". A **KZ** entry is added to References: Mathematics Unlimited 2001, 771–808, DOI 10.1007/978-3-642-56478-9_39, with locators to the IHÉS preprint IHES/M/01/22 (author copy). Checked in that preprint: §1.2 Conjecture 1 is the three-rules statement, and §4.1 restates it as "evaluation on effective periods is an isomorphism" and adjoins the inverse of the element that evaluates to 2πi. The added clause is needed because KZ state the conjecture for the *effective* algebra, while PS.7.4's `PeriodConjecture` is injectivity on the localized P. The step from KZ's version to ours is one line: if per(x)/(2πi)ⁿ = 0 then per(x) = 0, so x = 0 and x/Lⁿ = 0.

## H02 (mycaule) — applied

PS.9.22 gets a third interface bullet: "U′ = U_MT: the quotient map U_MT → U′ of PS.9.12 is an isomorphism, hence so is G_MT → G_MT′ … (B, Conjecture 1, p. 1; end of §7.2, p. 19)". Its route: π : H → A is surjective, and H = H_MT^+ makes H/ζ^m(2)H ≅ O(U_MT), so A = O(U′) ⊆ O(U_MT) is an equality. There is a new weight-3 Check: A₃ = ℚf₃ ∋ ζ^a(3) ≠ 0, and the trivial quotient U′ = 1 contradicts PS.9.12's Check Δζ^m(3) = 1⊗ζ^m(3) + ζ^a(3)⊗1. `*Needs:*` now also lists PS.9.12 and PS.9.14.

The citations are checked in B: line 17 states Conjecture 1, lines 140–143 define G′_MT and A = O(G′_U), and line 941 (§7.2, p. 19) has "The equality H = H_MT^+ implies conjecture 1". The ℓ-adic Deligne–Ihara consequence is not added, as the comment advises: B (lines 18–20) only points to André for it.

## Build and gate

- `lake build TauCetiRoadmap.PeriodsAndSpecialValues.Suggested`: Build completed successfully (8976 jobs); only `declaration uses sorry` warnings.
- Gate after commit: `gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Injectivity on P_eff gives injectivity on P = P_eff[L⁻¹] | x/Lⁿ with per(x/Lⁿ) = 0 | per(x)(2πi)⁻ⁿ = 0 ⇒ per(x) = 0 ⇒ x = 0 | true. The converse would need P_eff → P to be injective and is not claimed | none |
| Effective vs localized (does not confuse L with a non-unit) | L·L⁻¹ | per = 2πi·(2πi)⁻¹ = 1; L is invertible only in P | consistent with PS.7.4's first Check | none |
| U′ = U_MT, weight 3 | H₃, A₃, O(U_MT)₃ | d₃ = 1, H₃ = ℚζ^m(3), ζ^m(3) ↦ c·f₃ with c ≠ 0 because ζ(3) ≈ 1.202 ≠ 0; A₃ = ℚf₃ | agrees | Check added |
| U′ = U_MT, wrong model U′ = 1 | A = ℚ | Δζ^m(3) would be 1⊗ζ^m(3), but PS.9.12 has the term ζ^a(3)⊗1 ≠ 0 | excluded | covered by the Check |
| U′ = U_MT, weight 2 (even part) | ζ^m(2) | π(ζ^m(2)) = 0 and O(U_MT)₂ = 0 (no even odd-letter word of weight 2) | agrees: f₂ is not in O(U_MT) | none |
| G_MT → G_MT′ iso from U-part | 𝔾_m factor | O(₀Π₁) has a weight-1 piece (letters e₀, e₁), so 𝔾_m acts faithfully | agrees with B line 17 | none |

Signatures: `Suggested.lean` is unchanged (its docstring already says PS.9's motivic Hoffman basis and mixed Tate spanning are not statable: no mixed Tate category or motivic path torsor at the pins), so the 38 elaborated signatures in `signatures.md` still hold. I did not re-run `#check`.

## Sources

KZ was fetched through the sources service from the author copy (`--licence-class author-page`; the text layer was recognised by OCR); the DOI alone resolves only to a paywalled page. This job may not edit the manifest, so `sources.toml` has no **KZ** entry yet. The worker should add `id = "KZ"`, `locator_scheme = "section"`, `locator = "§1.2 Conjecture 1; §4.1"`, `cited_for = "PS.7.4"`, with url `https://www.ihes.fr/~maxim/TEXTS/Periods.pdf`. No text is missing; `needs-references.toml` was not written.

## Note outside the comments

The References list ends with duplicate **Burgos**, **Z** and **Stacks** entries (README lines 2573–2580). They were already there and no comment raised them, so they are left as they are.

Ownership against open pull requests: no new construction is added (both edits are a citation and an interface fact about objects PS.9.12/PS.9.22 already own), so no ownership question arises.
