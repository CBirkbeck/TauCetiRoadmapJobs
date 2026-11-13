# FIX-PKG-LogicAndDefinabilityInNumberTheory~6

## F01 (P2) — applied

The finding is correct. `cluckers_loeser_2008` Theorem 3.2.1 (line 558, p.14) is stated in Def_k, so it covers regime (ii) only. Its proof (lines 678–701, p.17) reduces to Denef–van den Dries. `integrability_of_oscillatory_functions_on_local_fields_transfer_p` Proposition 3.3.5 (line 707) is a one-variable 1-Jacobian statement and says nothing about analyticity (grep: the word appears only in the discussion of the subanalytic language, lines 478–490). In regime (iii) the route transfers first-order sentences, and analyticity is not one of them.

Changes in README §2.5(b):

- **Statement.** Old: "…strictly differentiable with invertible derivative, analytic on each piece of a finite definable partition." New: "…strictly differentiable at every point with invertible derivative. In regime (ii) Z can moreover be chosen so that f|Z is K((t))-analytic with K((t))-analytic inverse; no analyticity is asserted in regimes (i) and (iii)."
- **Proof, by regime.**
  - Regime (ii): CL 3.2.1(i),(iii) is applied to f and f⁻¹. The locus is Z=Z_f∩f⁻¹(Z_(f⁻¹)). f is bianalytic there, so Df is invertible by the chain rule, and the complement stays lower-dimensional because definable bijections preserve dimension.
  - Regime (i): the proof scheme of CL 3.2.1 (p.17) is run with the fixed-F cell decomposition and dimension theory of §2.2 (CGH Theorem 3.3.2), and Proposition 3.3.5 is applied on each cell. The steps are: piecewise continuity, graph submanifolds, constant rank (injective, hence rank n), local diffeomorphism. The text states explicitly that Proposition 3.3.5 is one-variable and gives no analyticity.
  - Regime (iii): openness was added to the list of transferred sentences, plus the sentence "Analyticity is not a first-order property and is not transferred."
- **Smaller edits.** The citation now reads "Theorem 3.2.1, p.14, and its proof, p.17". The phrase "higher-dimensional analytic theorem" became "higher-dimensional statement".

**Pattern search.** I grepped README and Lean for "analytic on each", "piecewise analytic" and "generic analytic" and found no other hits. The other consumers of §2.5(b) are fine as they are:

- §2.4 (line 413) uses only the change of variables in regimes (i)/(iii).
- §3.7 (729) and §3.8 (741) use regime (ii), where analyticity is kept.
- §3.9 (751) uses the regime-(iii) Jacobian data, which is first-order.
- Conventions (line 33) already limits definable-map statements to the characteristic-zero regimes.
- Suggested.lean says nothing about §2.5.

**Adversarial pass on the changed text.**

| Statement | Instances | Values | Result |
|---|---|---|---|
| (b) regime (ii), Z=Z_f∩f⁻¹(Z_(f⁻¹)) | f=id on K((t)); f(x)=x⁻¹ on X=K((t))× | id: Z=X, Df=1. Inversion: analytic on X, Df=−x⁻², invertible for x≠0, X∖Z=∅ | Holds. Z is open as the preimage of an open set under f continuous on Z_f. |
| (b) regime (i), rank argument | f(x)=x³ from X=ℚ_3 onto Y=f(ℚ_3). It is injective because ζ_3∉ℚ_3, and Y has dimension 1 because it contains 1+9ℤ_3 by Hensel | Df=3x², vanishes only at 0. Z=X∖{0}, dim{0}=0<1. On Z the derivative is invertible. f⁻¹ is not differentiable at 0, which matches the discarded point | Holds. 0 is correctly discarded. |
| (b) degenerate n=0 | X=Y=F⁰ (one point) | Z=X, complements empty, of dimension −∞<0. The derivative is the empty matrix, det=1 | Holds. |
| Negative control s on 𝔽₂((t)) | s(a²+tb²)=b²+ta² | difference quotients t and t⁻¹, not differentiable. char 2 is outside (i) and (ii), and s is not fixed data of residue characteristic >N | Still excluded. The Check is unchanged. |
| Change-of-variables Checks | x=πu at q=3; diag(π,π²) at q=3; x↦tx at q=2 | 1/3, 1/27, 1/2 | Unchanged. They depend only on (a). |

## F02 (P3) — applied

In sources.toml, `integrability_of_oscillatory_functions_on_local_fields_transfer_p`, `cited_for` changed from `["2.2; 2.4"]` to `["2.2; 2.4–2.5"]`. CGH Theorem 3.3.2 and Proposition 3.3.5 are still cited in §2.5. I also added "proof p.17" to the `cluckers_loeser_2008` locator (Theorem 3.2.1), because §2.5 now cites the proof.

## Checks

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout finished with no errors and exactly twelve `declaration uses sorry` warnings (lines 36, 48, 64, 71, 87, 93, 99, 107, 125, 133, 167, 183).
- **Signatures.** Suggested.lean was not edited, so the 18 elaborated signatures in the job's signatures.md are still current: no binder was lost and none changed. I did not rerun `#check @name`.
- **Dependency check output:** `depcheck: 56 roadmaps, 643 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation leads.** The single lead, `Diophantine.mrdp`, is this package's own nested-namespace declaration (Suggested.lean line 64).
- **Ownership.** No new object was introduced, so no new ownership question arises.

## Notes for the maintainer

- No Lean names changed, and no cross-roadmap citation changed.
- Generic analyticity of definable maps over a fixed finite extension of ℚ_p (Denef–van den Dries 1988) is not claimed. If a later consumer needs it, the primary source has to be added.
- No sources were requested, and needs-references.toml was not written.
