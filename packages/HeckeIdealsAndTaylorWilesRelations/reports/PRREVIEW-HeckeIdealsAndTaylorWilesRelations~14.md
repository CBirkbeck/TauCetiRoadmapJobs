# Review of HeckeIdealsAndTaylorWilesRelations (pull request #3027 at e47c8ec)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 90 changed lines since `b8f3652`. The folder's text is the one the previous review read; I checked again the origin and method labels of 3.13a, 4.2a, 9.9 and 10.1 against Thorne (2022), Wake–Wang-Erickson (2017) and the cached sources, 10.1's Corollary-of line and the new contract against ArithmeticGaloisDuality §D7.6a at this head, the §16.1 contract, the dependency direction and the elaboration. There is no finding and no stated result is affected. Accepted with four small corrections and one format note, none blocking; the weightiest is that 4.2a's origin label calls "particular to this proof" a construction that Thorne (2022) §§3 and 5 publishes. For the human reviewers: the formal proof, the README's main source, was not compared with the method labels.

## C01 — The origin label of 4.2a calls "particular to this proof" a construction that Thorne (2022) publishes

A reader who takes the label (line 321) at its word credits the formal proof with ideas that are in a paper the README cites in 9.9. Thorne (2022) has all three features the label lists. A Taylor–Wiles datum there is a factorisation of the characteristic polynomial of Frobenius into two coprime factors, with no condition on the residual eigenvalues (§5, p. 19; Tho22 lines 920–927). The two maps between parahoric invariants and spherical invariants extended over the ring of the factorisation, one the inclusion and one built from a pair of dual bases followed by the trace, have both composites equal to multiplication by the resultant (Lemma 3.7 and Proposition 3.8, pp. 12–13; lines 586–634). The relations are multiplied by a power of the resultant with exponent `n!`, independent of the level (relation (5.1); line 945).

What 4.2a adds: the full flag at Iwahori level, the norm `Nw` kept in the factors (Proposition 3.8 assumes `(q_v − 1)π = 0`), the product `f` over all ordered pairs, and a reducible residual determinant. The label would read: "*Origin:* adapted from Thorne (2022), §3 (Lemma 3.7, Proposition 3.8) and §5 (its Taylor–Wiles data and relation (5.1)), where the characteristic polynomial of Frobenius is split into two coprime factors at parahoric level: here the full flag at Iwahori level, at a reducible residual determinant, with `f` the product over all ordered pairs."

## C02 — Wake and Wang-Erickson prove the equality that 3.13a's origin label attributes to them only when a class group vanishes

The label (line 63) and the [WWE17] entry (line 978) say the paper has a ring of ordinary pseudorepresentations equal to the Eisenstein component of a Hida Hecke algebra, which reads as unconditional. Theorem 4.2.8 (arXiv v4, line 509) assumes `X_θ = 0`, under the standing hypotheses of §2.1: `p ≥ 5`, `p ∤ Nφ(N)` and conditions (a)–(c) on `θ` (lines 86–98). In both places: "… equal, when the Iwasawa class group `X_θ` vanishes, to the Eisenstein component of a Hida Hecke algebra in rank two (Theorem 4.2.8)".

## C03 — The description's list of exceptions to its rule on general theorems omits 10.1

The description says such a section "now states the proof's form and the general roadmap the general theorem, except where …", and names sections of three other roadmaps. 10.1 is such a section and does not follow the rule: it keeps its statement for every lattice and every `Σ ⊂ S`, records the proof's one instance in a paragraph (lines 773–780) and names ArithmeticGaloisDuality §D7.6a on a Corollary-of line. The list would gain: "and in HeckeIdealsAndTaylorWilesRelations 10.1, which keeps its statement for every lattice, records the proof's instance in a paragraph, and is a corollary of ArithmeticGaloisDuality §D7.6a for `Σ = S`".

## C04 — Untouched text: README 9.9 (a) is narrower than the theorem the change now cites for it

9.9 (a) (lines 523–528) asks for `n ∈ {2, 3}` and irreducibility on every open subgroup of `G_F`. Thorne's Theorem 6.1 (Tho22 lines 1169–1172) gives `H¹_f(F⁺, ad r) = 0` for every `n ≥ 2` and every `p` when the restriction to `G_{F(ζ_{p^∞})}` is irreducible, which the hypothesis of (a) implies. The sentence added at line 538 says so, but no roadmap on `main` or at an open head states the general theorem. A separate pull request would state it, as a clause of 9.9 or beside Newton–Thorne in ModularityAndLanglandsExtensions §4.1, and read (a)–(c) off it.

## N01 — The new origin lines cite by author and year where the README has reference keys

"Geraghty (2019)", "Chenevier (2014)", "Wake and Wang-Erickson (2017)", "Thorne (2022)" and "Milne, *Arithmetic duality theorems*" (lines 62–63, 511, 717) would be [Ger19], [Che14], [WWE17], [Tho22], [Mil]; the Geraghty attribution has no locator and the [WWE17] entry no given names.

## Questions for the author

- Is the journal reference of [Tho22] (Pure and Applied Mathematics Quarterly 18 (2022), 2159–2202) right, and does its numbering agree with arXiv v1? I read arXiv v1 only, which carries no journal reference.
- Which statement of Geraghty (2019) is 3.13a adapted from? The paper is paywalled and the label gives no locator.

## Previous findings

- none: the previous review of this folder had no finding. Its four small corrections and its format note concern text that this head leaves as it was, and are C01–C04 and N01 above.

## Verified sound

| Statement | Instances tried | This roadmap's side | Other side (source, supplier, library) | Result | Change |
|---|---|---|---|---|---|
| Headline 10.1 (b), line 8 | `T = ℤ_p(1)`, `F = ℚ`, `S = {p, ∞}`; `p = 2`, `e` even | `Ш²_S ≅ Ш¹_S(F, T^D)^∨`; `H¹(ℝ, ℚ₂/ℤ₂(−e)) = M[2] = ℤ/2` for even `e`, `M/2M = 0` for odd `e` | §D7.6a (b): the same pairing, real places in both kernels | agree | none |
| 10.1 Corollary-of line and §D7.6a contract | clause by clause; `O`-lattice | (a) at `Σ = S`, (b), (c); `O`-length/`e_O` = `ℤ_p`-length/`[E:ℚ_p]` | §D7.6a (a)–(c) for `ℤ_p`-lattices; (d) there is another statement; no `Σ ≠ S`, no length | covers what the line says | none |
| 10.1 method label | rank `a`, torsion `F` against corank `b`, finite part `G` | `p^{ra}·|F| = p^{rb}·|G|` for large `r` gives `a = b`, `|F| = |G|`; lengths equal, both infinite if `a > 0` | README lines 773–780 (the instance) | consistent | none |
| 10.1 Check, cubic character of conductor 61 | `3⁵ = 243 ≡ −1`, `3¹⁰ ≡ 1 mod 61` | `3²⁰ ≡ 1`, so 3 is a cube; class lies in `Ш¹_{S;S_3}`, ramified at 61 | `Ш¹_S(ℚ, ℚ₃/ℤ₃) = 0` (class number 1) | true | none |
| 9.9 origin; lines 537–539 | (a) irreducible on open subgroups; (d) | closure of `ρ(G_{F(ζ_{p^∞})})` contains the derived group of the connected closure, which acts irreducibly; (d) (ii) is the tower hypothesis | Tho22 Thm 6.1: `n ≥ 2`, any `p`, polarized `(π, χ)`, irreducible on the tower; Thm 6.2 totally real | (a)–(c) follow, (d) a case | C04 |
| 3.13a origin (WWE17) | `X_θ ≠ 0` | equality stated with no hypothesis | Thm 4.2.8 assumes `X_θ = 0`; §2.1: `p ≥ 5`, `p ∤ Nφ(N)` | hypothesis dropped | C02 |
| 4.2a origin | `n = 2`, blocks `1 + 1` | composite `U₂ − Nw·U₁`, one of the four factors of `f` | Tho22 Prop 3.8: `fg = gf = Res` when `(q_v − 1)π = 0`; exponent `n!` in (5.1) | adapted, not particular | C01 |
| 4.2a method: the composite divides `f` | `n = 3` | 3 factors `U_{i′} − Nw·U_i`, `i < i′`, among the 6 factors `U_a − Nw·U_b`, `a ≠ b` | `f` over all ordered pairs | divides | none |
| 4.2a method: `d`-th power zero | `d = 1`, `d = 2` nilpotent block | vanishing at all joint eigencharacters makes the operator nilpotent on a `d`-dimensional space | Cayley–Hamilton: `N^d = 0` | true | none |
| §16.1 contract: `[L⁺:ℚ] ≥ 2` in 3.13a | `L⁺ = ℚ` | an imaginary quadratic field ramifies at a finite prime, so excluded; product formula at `−1` gives `[L⁺:ℚ]` even | §16.1 at the head, line 1259: `[E⁺:ℚ] ≥ 2`, standard form, unramified at finite places | agree | none |
| Labels paragraph | the four sections | both labels in 3.13a, 4.2a, 9.9, 10.1; third line only in 10.1 | body of the README | agree | none |
| Headlines in `Suggested.lean` | file unchanged | no declaration; docstring names 3.13a, 4.2a, 9.9, 10.1 (b) as not statable, with the missing carriers | elaboration: no output | consistent | none |

- Source locators checked against the text: 9 (Tho22 Theorem A, Theorem 6.1, Theorem 6.2, Lemma 3.7, Proposition 3.8, relation (5.1) and the Taylor–Wiles datum of §5; WWE17 Theorem 4.2.8 and §2.1); present at their numbers in the cached texts: NT23 Theorem A and Theorem 5.2, Che14 Proposition 3.7, BZ77 2.12.
- Cross-roadmap citations of the changed passages resolved at the head or on `main`: ArithmeticGaloisDuality §§D7.6, D7.6a, R02.4.2–R02.4.4; BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; ModularityAndLanglandsExtensions §4.1; PotentialAutomorphyInfrastructurePartII §§3.1, 3.13, 4.2, 9.3. All present. §D7.6a and the statement of §16.1 are as the previous review read them.
- Record kept: no layer, item or heading removed or renumbered; four lines rewritten, each kept and extended.
- Dependency check: `depcheck: 130 roadmaps, 1463 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. No file changed outside the folders the pull request declares.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. The file declares nothing, so there was no `#check` comparison and no one-tactic probe to run.

Overlap check: read UniformWildKernelBounds, PotentialAutomorphyInfrastructurePartII, BaseChangeAndGaloisRepresentationsForUnitaryGroups and ArithmeticGaloisDuality; for ModularityAndLanglandsExtensionsPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, AutomorphyLiftingBeyondTaylorWiles and GlobalGaloisDeformationsPartII the change adds no object, and the scope paragraph is as before. Shared objects and owners: `Ш` kernels of a lattice at `Σ = S`, ArithmeticGaloisDuality §D7.6a (10.1 cites it and owns `Σ ≠ S`, lengths, (d)–(f)); Galois representations of definite unitary groups, BaseChange §16.1; enormous-image vanishing, ModularityAndLanglandsExtensions §4.1; big ordinary Hecke algebras and Taylor–Wiles data, PotentialAutomorphyInfrastructurePartII Layers 3–4, the reducible-determinant variants here.

Source independence: 7 passages compared with 2 sources (Tho22 and WWE17) and with ArithmeticGaloisDuality §D7.6a, changed passages only; Geraghty (2019) and Milne were not read; longest shared run 6 words, a standard name from the WWE17 abstract (WW15 lines 10–11); largest share [FormalProof], about 67 of 77 locators, a Lean repository not compared; contents not compared, since no layer is added, removed or reordered.

Research link: 9.9 is a case of Thorne (2022), Theorem 6.1, and uses Newton–Thorne (2023); Layers 3–4 adapt Geraghty (2019), Wake–Wang-Erickson (2017) and Thorne (2022) §§3, 5 to a reducible residual determinant; 10.1 extends Poitou–Tate duality (Milne, I §4). Rests on the README's sources and on Tho22 and WWE17 as read.

## Not verifiable

- Geraghty (2019), Mathematische Annalen: paywalled, no open copy; 3.13a's label gives no locator.
- The journal details of [Tho22]: arXiv v1 carries none.
- The method labels of 3.13a, 4.2a, 9.9 and 10.1 against [FormalProof]: the repository was not read in this round.
- Milne, *Arithmetic duality theorems*, I §4: not opened in this round; the locator is the one ArithmeticGaloisDuality §D7.6a gives (Theorem 4.10 (a), p. 56).
- The middle of the pull request's description was not available in full; C03 rests on the paragraph quoted.

## Source issues

- none

## For the human reviewers

- Decisions: neither concerns this folder; nothing leaves it. 10.1 stays and cites ArithmeticGaloisDuality §D7.6a, which states 10.1 (a)–(c) for `Σ = S` (checked at this head).
- Not tested: [FormalProof], a Lean repository, carries about 67 of the README's 77 locators; the four method labels were not compared with it.
- Labels: 4.2a's origin label says "particular to this proof" of constructions in Thorne (2022) §§3 and 5 (C01); the other origin labels of the family were not sampled here.
- 10.1 keeps, beside its Corollary-of line, a route for (a)–(c) close to the proof sketch of ArithmeticGaloisDuality §D7.6a; the family's convention on second routes allows it.
