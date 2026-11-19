# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at 77b0bf0)

**Verdict:** needs changes

**Summary.** Needs changes: this is an incremental re-review of the 9 lines changed since `24ecf8d`, which import the torsion trace formalism of 7.9b from VStackSheavesAndLisseCategoriesPartII. The six imported sections exist at that roadmap's head and say what the new contract bullet says of them, but the import stops short of what the cited proof of the elliptic trace identity uses: characteristic classes on inertia stacks, trace distributions on classifying stacks, the Künneth formula and universal local terms are owned by the same supplier and are neither cited nor built here (one P2 finding). There are two small corrections and no format note; nothing is left for a human to decide.

## R01 (P2) — The import in 7.9b omits the characteristic classes, trace distributions, Künneth formula and universal local terms that its cited route uses, so these inputs have no owner in this text

Before this change 7.9b constructed its own trace formalism; it now imports it, and names VS8.7, VS8.10, VS9.1 and VS9.4–VS9.6 only (line 2176, the *Needs* line 2180, the Layer 7 Dependencies at line 2295, the scope sentence at line 2303 and the contract bullet at line 2367). An implementer who takes that list as complete cannot reach the statement 7.9b is cited for: the identity of HKW Theorem 6.5.2 compares the trace on the local cohomology with a transfer of the trace distribution of `ρ`, and nothing in the six imported sections relates a trace class on a classifying stack to a character.

The route 7.9b cites (HKW, Theorem 6.5.2 and its proof) passes through Theorem 6.4.9 to Proposition 6.4.7, whose proof identifies both sides as characteristic classes on the inertia stacks of `Bun_G^1` and `Bun_G^b`, read as invariant distributions (hkw21 lines 2840–2846), computes the class on the Hecke stack by the Künneth theorem 4.5.3 (hkw21 lines 2897, 2940) and reaches the fixed points on the Schubert cell through Theorem 4.6.1 (hkw21 lines 2047–2049, 2251). 7.9b itself asks to "identify the inertia/fixed-locus components" and to use "the normalized Haar factors". At the supplier's head these are VS8.11 (inertia stacks and characteristic classes), VS11.2–VS11.4 (inertia of a classifying stack, trace distributions, the characteristic class of an admissible object is its trace distribution), VS11.9 (Künneth formula) and VS11.10–VS11.12 (inertia of a quotient stack, universal local terms); its scope section says of the trace distribution of VS11.3 that no other roadmap defines it, and its own consumers paragraph lists VS11.3, VS11.9 and VS11.12 for exactly this computation of Hansen–Kaletha–Weinstein §§5–6. No section of this README builds any of them: the words "characteristic class" and "trace distribution" do not occur in it.

The smallest change: add the sections the route uses, VS8.11, VS11.2–VS11.4, VS11.9 and VS11.10–VS11.12 (and VS10.6 if the decency of `[*/J_b(E)]` is taken from there), to the import sentence of 7.9b and to the four lists above, with one clause in the contract bullet saying what each supplies. If another route is intended that avoids them, say in 7.9b how the trace class is identified with the character of `ρ`.

## C01 — The sentence that now carries the whole passage to rational coefficients does not say how it is made

With the torsion formalism imported, "Carry this through rational coefficient descent from finite extensions of `ℚ_ℓ`; that passage is owned here" (line 2176) is all 7.9b says of the one part of the formalism it owns, and a reader cannot tell what is to be proved. In the cited proof the passage has two steps: for `ρ` with an integral lattice, the torsion identity at each `ℤ/ℓⁿ` and the inverse limit (HKW, Theorem 6.4.9, p. 68; hkw21 lines 2967–2982); for every finite-length `ρ`, the fact that both sides are trace forms and that the representations with a lattice are dense for trace forms (HKW, Theorem 6.5.3 and Lemma 6.5.5, pp. 69–71; hkw21 lines 3080, 3106–3118).

A clause naming the two steps, with these locators, would do; the descent to a finite extension of `ℚ_ℓ` is then where the lattice comes from.

## C02 — The description's prose does not say that the trace formalism is now a supplier's

The Approach paragraph reads "The curve, Bun_G, geometric Satake and the Hecke and spectral actions come from their suppliers", written when 7.9b built its own trace formalism. The roadmap now has one more supplier, VStackSheavesAndLisseCategoriesPartII, which only the generated dependency lists name. Text that would be right: "The curve, Bun_G, geometric Satake, the Hecke and spectral actions and, for torsion coefficients, the Lefschetz–Verdier trace formalism come from their suppliers."

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: "`(3) x ↦ b(x)` is upper semicontinuous on `|Fℓ_{G,μ}|` for the order of 0.2" (line 1466), untouched by this change.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 7.9b, the six imported sections | each section at the supplier's head `dbe4e49`; coefficient convention | VS8.7 line 883 (`u : c₁^*A → c₂^!A′`), VS8.10 line 965 (`tr_c(u, A) ∈ H^0(Fix(c), K)`), VS9.1 line 1073, VS9.4–VS9.6 lines 1138, 1175, 1208; `nΛ = 0`, `n` prime to `p` (line 24) | agrees with the bullet at line 2367 |
| 7.9b, inputs of the cited route | HKW 6.5.2 → 6.4.9 → 6.4.7 → 4.5.3, 4.6.1 | characteristic classes on inertia as distributions (hkw21 2840–2846), Künneth (2940), universal local term (2047); supplier VS8.11, VS11.2–VS11.4, VS11.9, VS11.12; cited here: none | R01 |
| 7.9b, passage to rational coefficients | HKW 6.4.9, 6.5.3, 6.5.5 | lattice, `ℤ/ℓⁿ`, inverse limit (hkw21 2975–2982); trace forms and density (3080, 3106–3118); README names neither step | C01 |
| 7.9b Check, `GL₁` | identity correspondence on a point, `A` of rank one with character `χ` | VS8.10 API: `S = X = C`, `tr_c(u, A) = tr(u | A)`; value `χ(g)`; fibre of dimension 0 | agrees |
| 7.9b Check, `GL₂`, `μ = (1, 0)` | regular element on `ℙ¹`; weights `(1,0)`, `(0,1)` | two fixed points, each weight of rank 1, total `2 = dim r_μ`; `⟨2ρ, μ⟩ = 1`; signs `(−1)^{±1}` equal at both (hkw21 2951) | agrees |
| HKW Theorem 4.3.7 as the relative Lefschetz–Verdier formula | author version of 7 May 2021 | hkw21 line 1369: dualizable `(X, A)`, `p`, `q` proper, `(X′, q_∗A)` dualizable, unique pushed endomorphism; supplier cites the same theorem as 4.3.8 of a later version | agrees |

The rows for the untouched statements stand as in the previous review, of `24ecf8d`.

- Source locators checked against the text: 7, all in hkw21 (Theorems 4.3.7, 4.5.3, 4.6.1, 6.4.9, 6.5.2 with its proof, Proposition 6.4.7, Lemma 6.5.5), in the author version the README's references name.
- Library declarations opened at the pins: none; the change names no library declaration and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: VStackSheavesAndLisseCategoriesPartII VS8.7, VS8.10, VS9.1, VS9.4, VS9.5, VS9.6 at its open head (a pull request that adds the roadmap; line 139 of the merge order, this roadmap at line 197); its Downstream consumers and Scope sections name 7.9b as a consumer in the same terms.
- Dependency check: `depcheck: 200 roadmaps, 2218 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks at this head: all passed when run again. `lake env lean` on `Suggested.lean`: no output. The file declares nothing, so there is no signature to compare and no one-tactic probe to run. No file is changed outside the folder.
- The seeded sample: none of its targets lies in the changed passages.
- The pull request's text: read against this head; C02 is the one point. The generated dependency and merge-order lists name VStackSheavesAndLisseCategoriesPartII.

Overlap check: read IgusaVarietiesAndTorsionConcentrationPartII, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII and GeometricSatakeAndFusion for the objects of the change (cohomological correspondences of v-stacks, trace classes, Lefschetz–Verdier, local terms); none owns them; owner VStackSheavesAndLisseCategoriesPartII Layers VS8–VS11, now cited, with the elliptic application and the rational passage left to 7.9b by its scope section; the remaining shared objects as in the previous review. HeckeStacksAndLocalShtukas and BunGAndNewtonStrata were not among the heads available and were not read.

Source independence: changed passages only; 3 passages (the import sentence, the scope sentence, the contract bullet) compared with 1 source (hkw21, §4.3 and §5.3) and with the supplier's sections, none shared beyond the notation `u : c₁^*A → c₂^!A′` and `tr_c(u, A)`; largest share csnc, as in the previous review (81 of about 204 locators); the diff adds, removes and reorders no layer, so the contents were not compared again.

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
