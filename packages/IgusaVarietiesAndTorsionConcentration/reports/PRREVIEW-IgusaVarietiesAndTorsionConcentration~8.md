# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at d2bd36d)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 10 lines changed since `77b0bf0`, which complete the import of the torsion trace formalism in 7.9b and spell out the passage to `ℚ̄_ℓ`-coefficients. The finding of the previous review is repaired: every section now imported exists at the head of VStackSheavesAndLisseCategoriesPartII and says what the contract bullet says of it, and the eight new locators into Hansen–Kaletha–Weinstein are right. No finding and no small correction remain; there is one format note, not blocking, and nothing is left for a human to decide.

## N01 — The base of the Künneth step in 7.9b could be named

The Künneth formula of VS11.9 is applied in the cited route over the classifying stack of a truncated positive loop group, not over `[*/J_b(E)]`; that this base has cohomologically smooth structure map and diagonal is the example given in VStackSheavesAndLisseCategoriesPartII VS11.6. A clause in 7.9b (line 2176) naming the base, with VS11.6 added to the list, would save an implementer the search; the statement imported is correct as it stands.

## Deferred findings

- D01 — resolved: IgusaVarietiesAndTorsionConcentrationPartII §11.9 states and owns the criterion (its Scope and ownership names it); SelmerIwasawaCohomologyPartII cites that section.
- D02 — resolved: the Scope and ownership sentence of IgusaVarietiesAndTorsionConcentrationPartII now reads "The parent's §§0.4, 5.1 and 5.2"; the three phrases are gone.

## Previous findings

- R01 — repaired: "the trace formalism is imported from VStackSheavesAndLisseCategoriesPartII: … (VS8.7) … (VS8.9) … (VS8.10) … (VS8.11–VS8.12) … (VS9.1–VS9.2) … (VS10.6) … (VS11.1–VS11.4) … (VS11.9) … (VS11.10–VS11.13)" (line 2176), and the same list in the four other places.
- C01 (small correction) — repaired: "apply the torsion identity to `ρ°/ℓ^n` for every `n ≥ 1` and pass to the inverse limit … a trace form that vanishes on every irreducible representation admitting a `ℤ̄_ℓ`-lattice is zero" (line 2176).
- C02 (small correction) — repaired: the description now reads "for torsion coefficients, the Lefschetz–Verdier trace formalism with characteristic classes and trace distributions come from suppliers".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 7.9b, the imported sections | each of the 19 sections at the supplier's head `dbe4e49` | VS8.9 l.943, VS8.11–8.12 l.998, 1032, VS9.2 l.1096, VS10.6 l.1462, VS11.1–11.4 l.1588–1669, VS11.9 l.1800, VS11.10–11.13 l.1821–1896; hypotheses as in the bullet at line 2367 | agrees |
| 7.9b, coefficient hypothesis of the import | `Λ = ℤ̄_ℓ/ℓ^n`, `ℓ ≠ p` | supplier convention: `nΛ = 0`, `n` prime to `p` (its line 24); `ℓ^n` kills `Λ` and is prime to `p` | within the import |
| 7.9b, torsion elliptic identity | HKW Proposition 6.4.7; `GL₁`; `GL₂`, `μ = (1, 0)` | equality in `Dist(G(F)_ell, Λ)^{G(F)}` (hkw21 2833–2836), `G(F)_ell` strongly regular elliptic (532); `GL₁`: one weight, sign `+1`, value `χ(g)`; `GL₂`: two weights of rank 1, signs `(−1)^{±1}` equal, total 2 | agrees with the Checks |
| 7.9b, reading the trace class as a character | HKW proof of 6.4.7, 6.4.8, 5.1.4 against VS11.2–11.4, VS11.9, VS11.13 | inertia of `[*/G]` gives invariant distributions (hkw21 2842; VS11.2); Künneth (2897, 2940; VS11.9); weights with sign `(−1)^{⟨2ρ, λ⟩}` on the strongly regular locus (2045, 2951; VS11.13) | agrees |
| 7.9b, lattice step | `ρ` with lattice `ρ°`; separatedness of `ℤ̄_ℓ` | HKW 6.4.9: identity at `ℤ_ℓ/ℓ^n` for all `n`, then limit (hkw21 2975–2982); `∩ ℓ^n ℤ̄_ℓ = 0`, so equality mod every `ℓ^n` is equality | agrees |
| 7.9b, density step | difference of the two sides as a form on the Grothendieck group | first side a trace form (6.5.3, hkw21 3019); second the trace of the transferred function on `J_b(E)` (3115–3116); zero on lattices, so zero (6.5.5, 3080; 3117) | agrees |
| 7.9b Check, proper-space formula on noncompact spaces | hypothesis of VS9.1–VS9.2 | pushforward only along cohomologically proper maps (supplier l.1073, 1098); README keeps "proper over the base" | agrees |

The rows for the untouched statements stand as in the previous review, of `77b0bf0`.

- Source locators checked against the text: 8, all in hkw21 at its printed pages (Proposition 6.4.7, pp. 66–67; Proposition 6.4.8, p. 68; Theorem 5.1.4, p. 47; Definition C.2.1, p. 81; Theorem 6.4.9, p. 68; Theorem 6.5.3, p. 69; proof of Theorem 6.5.2, p. 72; Lemma 6.5.5, p. 71); all correct.
- Library declarations opened at the pins: none; the change names no library declaration and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: 19 sections of VStackSheavesAndLisseCategoriesPartII at its open head (a pull request that adds the roadmap; line 139 of the merge order, this roadmap at line 197); the five lists of the README (7.9b, its *Needs* line, the Layer 7 Dependencies, Scope and ownership, the contract bullet) agree with one another.
- Dependency check: `depcheck: 200 roadmaps, 2220 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks at this head: all passed when run again. `lake env lean` on `Suggested.lean`: no output, exit 0. The file declares nothing, so there is no signature to compare and no one-tactic probe to run. No file is changed outside the folder.
- The seeded sample: none of its targets lies in the changed passages.
- The pull request's text: read against this head; the summary and the generated dependency and merge-order lists name the new supplier; nothing to correct.

Overlap check: read IgusaVarietiesAndTorsionConcentrationPartII, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII and GeometricSatakeAndFusion for the objects of the change (characteristic classes, trace distributions, Künneth formula, universal local terms, the passage to rational coefficients); none owns them; owner of the torsion formalism VStackSheavesAndLisseCategoriesPartII Layers VS8–VS11, cited, with the elliptic application and the rational passage left to 7.9b; the remaining shared objects as in the previous review. HeckeStacksAndLocalShtukas and BunGAndNewtonStrata were not among the heads available and were not read.

Source independence: changed passages only; 5 passages (the import sentence, the reading of the trace class as a character, the torsion identity, the two steps of the rational passage, the contract bullet) compared with 1 source (hkw21, §§5.1, 6.4, 6.5, C.2) and with the supplier's sections, none shared beyond the standard terms "trace form" and "admits a lattice" and the forced notation; largest share csnc, as in the previous review (81 of about 204 locators); the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: Layer 7 states Koshikawa's local and global generic vanishing (2021), which removes the hypotheses of Caraiani–Scholze (2017, 2019) and is the input to Caraiani–Newton (2023) for modularity over imaginary quadratic fields and to potential automorphy over CM fields (Allen et al., 2023); rests on kos21, cn23 and the README.

## Not verifiable

- The journal pagination of HKW: only the author version of 7 May 2021 was read, which is the version the README's references name.
- The supplier's own locators into its sources (a later version of HKW, Lu–Zheng) were not checked; they belong to its review.
- The description's generated `depends-on` and `merge-order` blocks are outside the check of the text.

Automatic checks set aside as false positives: the lead that the citation "IntegralHeckeAndGaloisDeterminants Layer 3" in the *Needs* line of 5.1 resolves nowhere; the line reads "Layer 3a", a layer that exists on main.

## Source issues

- none

## For the human reviewers

- none
