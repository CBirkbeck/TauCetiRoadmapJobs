# FIX-PKG-LogicAndDefinabilityInNumberTheory~5

Review resolved: REV-PKG-LogicAndDefinabilityInNumberTheory~4 (two findings).

## F01 (P1) — applied

Old: §2.5 asserted that any definable isomorphism between equal-dimensional local-field definable sets has full-dimensional analytic loci with invertible derivative. That claim was unrestricted, including positive characteristic. New: §2.5 splits into two parts. (a) Analytic substitution over every nonarchimedean local field. (b) Definable regularity in three characteristic-zero regimes: fixed F/ℚ_p (every p and e), K((t)) with char K=0, and fixed data above a residue bound N. The involution is added as a negative-control Check.

Verification of the witness. In F=𝔽₂((t)), squaring is a bijection onto 𝔽₂((t²)), so x=a²+tb² is unique (even and odd coefficients). Put s(x)=b²+ta². Then s is additive and s∘s=id. Also x∈O_F ⇔ a,b∈O_F, so s(O_F)=O_F. Since s(t^(2n))=t^(2n+1) and s(t^(2n+1))=t^(2n), the difference quotients s(h)/h are t and t⁻¹, and s is differentiable nowhere. The graph is a ring formula with parameter t. The sources agree: CL 2008 Lemma 7.5.2 (`cluckers_loeser_2008` line 1766) and Theorem 3.2.1 (line 558, p.14) are in Def_k with char k=0. CGH Proposition 3.3.5 (`integrability_of_oscillatory_functions_on_local_fields_transfer_p` lines 707–715, p.16) fixes a finite extension of ℚ_p (line 472).

Further details of the repair:
- In (b), X,Y⊆Fⁿ is now explicit. The Haar identity is asserted only in regimes (i) and (iii). In regime (ii) the residue field is infinite, so there is no Haar normalisation, and the regularity feeds §3.8.
- Regime (iii) works as follows. Its conclusion for fixed data is a finite set of Denef–Pas sentences. These hold in every K((t)) with char K=0, so the ultraproduct argument of §1.5 gives the bound N.
- The *Needs:* line of §2.5 is split by part. Part (b) additionally needs §2.2 and §1.5. The internal graph stays acyclic: §1.5 and §2.2 do not depend on §2.5.

Same pattern repaired elsewhere:
- Conventions: added one sentence. Analytic statements hold over every local field. Statements about definable maps, cells and dimension are made only in characteristic-zero regimes.
- §2.4: local diffeomorphisms use §2.5(a). Definable maps use §2.5(b) in regime (iii) for the uniform family and regime (i) for fixed F.
- §3.7: the Jacobian preparation is §2.5(b) in regime (ii).
- §3.8: the definable regularity used is §2.5(b) in regime (ii).
- §3.9: the excluded residue characteristics include the regime-(iii) bound.
- §§2.7, 2.8 and 2.12 are already analytic (smooth loci, analytic manifolds, submersions), so they hold in any characteristic and are unchanged.
- §2.6 already separated the fixed-prime case from the large-residue-characteristic case.
- Two locators were added to `sources.toml`: CL Theorem 3.2.1 p.14 and Lemma 7.5.2, and CGH Proposition 3.3.5 p.16. CGH's `cited_for` field now includes 2.5.

## F02 (P2) — applied

Old: §4.33's explicit two-universal, seven-existential formula was not in `Suggested.lean`. New: Layer 4 adds the definition `twoUniversalIntegerPolynomial` (real body on ℚ, zero-based indices) and the theorem `two_universal_integer_formula`. The theorem says t∈`rationalIntegers` ⇔ ∀a b ∃u∈ℚ⁴ v∈ℚ³, polynomial =0. §4.33 names both and gives the index translation. The module docstring lists the headline. The theorem reuses the existing `rationalIntegers`, not a new ∃z form.

I checked the formula against `koenigsmann_defining_z` lines 268–272 (p.79). There, x₁²−ax₂²−bx₃²+abx₄²−1 equals u₀²−B−1, and the second square matches (t−2u₀)²−4C−4.

## Adversarial pass

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §2.5(b) in char 2 | s(a²+tb²)=b²+ta² over 𝔽₂((t)) | s(t^(2n))/t^(2n)=t, s(t^(2n+1))/t^(2n+1)=t⁻¹; μ(O)=1 on both sides | false unrestricted; restricted to regimes (i)–(iii); Check added |
| §2.5(a) in char 2 | x↦tx, q=2 | μ(tO)=1/2=\|t\|·1 | holds; Check added |
| §2.5(a) Frobenius | x↦x² over 𝔽₂((t)) | derivative 2x=0; image 𝔽₂((t²)) is not open | excluded by "bijection of open sets, invertible derivative" |
| §2.5(a) sign | x=πu, q=3; diag(π,π²) | 1/3 and 1/27; inverse factor would give 3 and 27 | unchanged |
| §2.5(b) regime (ii) | K((t)), K infinite | O has no finite Haar normalisation | integral clause limited to (i),(iii) |
| §2.5(b) ambient | X a curve in F² | not open in F², so det Df is undefined | added X,Y⊆Fⁿ |
| §2.5(b) regime (iii) | the char-p analogue of s needs p digit variables | the formula depends on p, so it is not fixed data | consistent with a bound N |
| nullity in §2.5 | point in F; graph F×{0}; F⁰ | 0, 0, intrinsic 1 | limited to (i),(iii); unchanged otherwise |
| `two_universal_integer_formula`, a=b=1, t=0 | u=(0,0,0,1), v=(0,0,1) | A=1, B=C=−1; both squares 0 | witness exists, consistent with 0∈ℤ |
| same, a=0 | u=0 | a+A=0 | trivially true for every t |
| same, a=−1 | u=(0,1,0,0) | a+A=0 | trivially true for every t (Lagrange for −a≥0) |
| same, t=1/2, a=b=3 | Δ(3,3)={2,3} | trace sum lies in ℤ_(2)∩ℤ_(3), but v₂(1/2)=−1 | no witness, consistent with 1/2∉ℤ |
| same, degree | monomial a²b²u₃⁸ | coefficient 1; total degree 12, existential degree 8 | matches §4.33 |

## Checks

- `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout: exit 0. There are 12 warnings, all `declaration uses sorry`, and no errors. The Tau Ceti import was already built.
- Signature check: I elaborated a scratch copy with `#check @name` for all 18 declarations (exit 0) and compared each type with the README. The only changes are the two new declarations. Their types are `ℚ → ℚ → ℚ → (Fin 4 → ℚ) → (Fin 3 → ℚ) → ℚ` and `∀ t, t ∈ rationalIntegers ↔ ∀ a b, ∃ u v, … = 0`. No section binder was lost.
- Depcheck output:

```text
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Notes for the maintainer

- No gate failures were listed for this round.
- No names that other roadmaps cite were renamed or deleted. The new Lean names are `twoUniversalIntegerPolynomial` and `two_universal_integer_formula`.
- No new supplier, gap or source key was needed, and `design/plan.json` is unchanged.
- §2.5(a) cites Schneider (settled as uncertified) for the inverse-function argument. The README gives the strict-differentiability ball argument in full and needs only completeness and the ultrametric inequality. So the claim for every characteristic does not depend on the generality of Schneider's unread text.
- Ownership against open pull requests: the change adds no new construction that another roadmap could own. The regime split refines an existing target, and the new Lean declaration is §4.33's own formula.
- No suspicious instructions were found in the review text.
