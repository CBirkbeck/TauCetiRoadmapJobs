# Review of PerfectoidQuotientsPartII (package, round 2)

**Verdict:** needs changes

Five findings: one P2 and four P3. The 15 headline signatures elaborate, but the package duplicates a predicate now present at the supplied pin and contains incorrect Checks and stale supplier references. The package is repairable without changing its scope. No package source file was edited; the sources service retained the existing Stacks manifest entry.

## Previous findings, checked first

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01: perfect-residue restriction and unowned gap | Repaired | README 1486: “whose residue field `k` is `F`-finite”; 1493: “rank `[k : k^p]^n pⁿᵈ`”. Suggested.lean 330 has the finite-module hypothesis over the Frobenius field range. For `k = 𝔽₃(t)`, the degree is 3, and the first stage for `W⟦x⟧` has rank 27. Q10.5 retains the cover hypothesis for other residue fields. |
| F02: continuity without cofinality | Repaired | README 1012: “for every `γ ∈ Γ_v` there is `n` with `v(a) < γ` for all `a ∈ Iⁿ`”. At the specified rank-two valuation, `v(T) = (−1,0) < (0,−n) = v(pⁿ)` for every n. The corrected criterion rejects it. |
| F03: transporting annihilation by roots of c | Partly repaired | README 1576: “The root `T^{1/pᵏ}` is nilpotent in `R'_∞/c`”; 1581: “acts on `R⁺/pⁿ` as `c_k`”. The enlargement and action comparison repair the proof route. The added Check at 1599 incorrectly puts actual roots of p in an arbitrary cover: R03 below. |
| F04: three nonexistent perfectoidization names | Repaired | README 272: “§2.30: the perfect-site description of perfectoidization”; 275: “§2.31: integral perfectoidization”. Both sections exist at the supplied PrismaticCohomology head and state the consumed results. The three old names are gone. The same phantom-name pattern remains elsewhere: R04 below. |
| F05: incorrect semiperfect tilt | Repaired | README 478: “identifies `lim_F B/(t)` with `lim_n B/(t^{pⁿ})`, a domain”. The element `(t^{1/p^{n+1}} mod t)_n` is nonzero, and Frobenius carries its n-th representative to `t^{1/p}` modulo `t^{pⁿ}`. The corrected completion is not `𝔽_p`. |
| F06: value-group universe | Repaired | Suggested.lean 43 declares “`universe u v`”; 203 and 216 quantify “`Γ₀ : Type v`”. The fresh elaborated signatures show an independent `u_2` for the value group in both theorems. |

The repair report has no finding marked not actionable. The findings below are not re-raisals of a settled exception. I checked the changed Q10.4–Q10.6 argument, Q8.1 criterion, Q5.4 example, changed supplier contracts and both universe signatures, and searched the rest of the package for the repaired patterns.

## R01 (P2) — Use the integral-perfectoid predicate already at the pin

**Location:** `packages/PerfectoidQuotientsPartII/Suggested.lean:56`; `packages/PerfectoidQuotientsPartII/README.md:109`: “It is restated verbatim in `Suggested.lean` so that the file elaborates without importing another roadmap.”

**Claim:** The acceptance test needs a locally declared integral-perfectoid class because its owner is only a roadmap.

**Witness:** `TauCeti/RingTheory/Perfectoid/Integral.lean:76` already declares `TauCeti.Perfectoid.IsIntegralPerfectoid`, with the same three fields, including the quantified Fontaine-kernel clause. It is present at Tau Ceti pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

**Exact repair:** Delete the local class, import `TauCeti.RingTheory.Perfectoid.Integral`, and use `TauCeti.Perfectoid.IsIntegralPerfectoid` in every headline. Move its contract to the Tau Ceti supplier subsection and update the scope, conventions and module docstring accordingly. Do not introduce another alias or conversion API in Suggested.lean. PerfectoidSpaces remains the supplier for the additional criteria not yet proved in the library.

**Repair test:** A scratch copy with exactly that class deletion, import and namespace opening elaborated with exit 0 and the same 15 sorry warnings. The native and local fields agree also on the zero ring and perfect characteristic-p rings: π = 0, surjective Frobenius, and principal Fontaine kernel when the latter is formed. This is an existing-object duplication, not a request to prove a headline in place.

## R02 (P3) — The infinite root-polynomial stages are not syntomic

**Location:** `packages/PerfectoidQuotientsPartII/README.md:1237`: “each stage `A_0[X_j]/(ϖ^{m/pʲ}X_j − T^{1/pʲ})` is syntomic over `A`.”

**Claim:** Holding j fixed makes this an algebra of finite presentation over A, despite `A_0 = A[T^{1/p^∞}]`.

**Witness:** Take `A = 𝒪_C`, `m = 1`, `j = 0`. Inverting ϖ gives `C[T^{1/p^∞}]`, which is not finitely generated: generators in `C[T^{1/p^N}]` cannot generate `T^{1/p^{N+1}}`. CS24 line 1151 says ind-syntomic.

**Exact repair:** Replace “syntomic over A” by “ind-syntomic over A”. Explain that for fixed j the finite-variable stages `A[T^{1/p^n}, X_j]/(ϖ^{m/p^j}X_j − T^{1/p^j})`, with `n ≥ j`, are syntomic, and their filtered colimit is the displayed algebra. Keep the existing Q9.2 theorem and proof route.

**Repair test:** After inverting ϖ the finite stage is `C[T^{1/p^n}]`, finitely presented of relative dimension 1; its infinite union still lacks a finite generating set. This discriminates syntomic from ind-syntomic exactly as Q7.2 requires.

## R03 (P3) — The root-membership Checks need their unit and base hypotheses

**Location:** `packages/PerfectoidQuotientsPartII/README.md:1304`: “Over `ℤ_p^{cycl}` (completed), `p^{1/p^∞}` already exist”; also 1595–1599, especially “`p^{1/pᵏ}` already lies in `√(pR_∞)`”.

**Claim:** The completed cyclotomic ring and an arbitrary perfectoid cover contain actual roots of p; conversely `R[√p]` never contains `p^{1/p}` for odd p.

**Witness:** For p = 3, `ℚ₃(3^{1/3})/ℚ₃` has degree 3 and is not Galois; Krasner excludes it from the completed cyclotomic tower. Conversely `R = ℤ₃[3^{1/3}]` already contains the asserted missing root.

**Exact repair:** In Q9.4 say that compatible roots of a **unit multiple** of p are available, and that adjoining roots of p itself can be nontrivial. In Q10.5 use `b_k ∈ R_∞` with `b_k^{p^k} = v p`, for a fixed unit v and compatible b_k, supplied by the conventions. For `c = pu`, `(c_k/b_k)^{p^k} = u/v`, so the ratio is a unit of `(R⁺)^∧`; this gives the intended annihilation without asserting that `p^{1/p^k}` belongs to the original cover. Restrict the separate `S = R[√p]` negative control to `R = ℤ_p`, p odd.

**Repair test:** `X³ − 3` is Eisenstein, and a degree-3 normal extension containing a root would contain ζ₃, whose degree over ℚ₃ is 2, impossible. A root in the completion would, by approximation and Krasner, belong to a finite cyclotomic extension, all of whose subextensions are Galois. Thus `R_∞ = ℤ₃^{cycl}` is a counterexample even with `R = ℤ₃` and the canonical map to `𝒪_{ℂ₃}`. BMS1 line 1040 supplies unit multiples, precisely the corrected statement. For the restricted quadratic example, `v_p(S\{0}) = (1/2)ℕ` excludes valuation `1/p` for odd p. These are Check repairs; the enlarged-cover proof itself uses the correct unit-multiple normalization.

## R04 (P3) — Three more supplier names do not resolve where cited

**Location:** `packages/PerfectoidQuotientsPartII/README.md:265` cites “`Prismatic.IsDistinguished.map`”; line 284 cites “`henselization_flat` and `henselization_quotient_pow`”.

**Claim:** These are the named declarations supplied by PrismaticCohomology §0.61 and SchemeAndStackFoundations §0.13.

**Witness:** PrismaticCohomology's supplied head, README 1169 and Suggested.lean, gives δ-functoriality without that name. SchemeAndStackFoundations on main, README 1197–1217, imports native henselization APIs; neither cited `henselization_*` declaration occurs there or in its Lean file.

**Exact repair:** Cite PrismaticCohomology §0.61's δ-functoriality in prose, as was done for §§2.30–2.31. For the henselization facts cite the native `TauCeti.Henselization.indEtale`, `TauCeti.Algebra.IndEtale.flat`, `TauCeti.Henselization.quotientPowEquiv` and, directly, `TauCeti.Henselization.faithfullyFlat_of_le_jacobson`. Put those contracts under Tau Ceti; retain SchemeAndStackFoundations for its additional targets. This needs no supplier gap: the mathematics is supplied at the pin.

**Repair test:** `TauCeti/RingTheory/Henselization/IndEtale.lean:47` supplies ind-étaleness; line 57 checks flatness by instance inference; line 60 supplies faithful flatness with exactly the Jacobson hypothesis. `TauCeti/RingTheory/Henselization/Quotient.lean:81` supplies `quotientPowEquiv` for every n, including n = 0, when both quotients are zero. For `(R,I) = (ℤ₃,(3))`, n = 1 gives the identity on `𝔽₃`. The prismatic functoriality is explicitly the first API bullet of the cited §0.61. The obsolete henselization names do occur in the open revisions #1807, #1808 and #1854, at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1116`, 1230 and 1041 respectively. Those revisions cannot replace the required main-branch supplier contract. This is the remaining instance of F04's pattern, not failure of its three particular replacements.

## R05 (P3) — The stated library pins are obsolete

**Location:** `packages/PerfectoidQuotientsPartII/README.md:151` and 186: “Pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`” and “Pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`”.

**Claim:** Those commits identify the libraries against which the acceptance test and supplier contracts are stated.

**Witness:** The supplied content repository's `lake-manifest.json` records Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the libraries used by this review's successful elaborations.

**Exact repair:** Update the two hashes to the manifest values, or remove the redundant hashes and refer to the repository's lake manifest. Do not change the manifest or toolchain.

**Repair test:** Comparing the corrected values with the manifest gives equality for both dependencies. R01 demonstrates a substantive API difference between the old baseline and this one.

## Verified sound

### Principles, scope, shape and ownership

Read all 37 numbered subsections Q5.1–Q10.6, their API bullets, proof routes, Checks, layer dependencies, conventions, summary, references and downstream contracts. Compared shape with PerfectoidSpaces, SchemeAndStackFoundations and EnhancedDerivedSheaves on main. Six layers each end with Examples and Dependencies. The definition sections Q7.1, Q7.2, Q8.2, Q9.1 and Q9.5 have API lists and respectively 5, 5, 3, 4 and 4 Checks. The incorrect Checks are separated above. All 19 locally declared Lean names occur in the README; no additional undeclared name is presented as a local Lean declaration.

This is a genuine Part II extension. PerfectoidQuotients owns the Fontaine-generator, root-closure, torsion-removal and completed-operation inputs; this package owns the additional fibre products, arbitrary-rank valuation-ring tilting, ordinary ind-syntomic André theorem and semiperfectoid covers. The F-finite extension of Q10.4 matches the scope of HM17, rather than restricting primes or ramification. Q10.5 covers arbitrary residue fields conditional on explicitly supplied cover data. There is no undeclared supplier gap in that conditional theorem.

No copied source passage, executable algorithm, route-specific prime exclusion, sorry'd data, `set_option`, `lemma` declaration, forbidden diagnostic command, external roadmap import, local machine path, HTML anchor or review/PR narrative was found in the four package files. Mathematical recursive constructions remain mathematical proof routes. The obsolete pin assertions are R05. No edits to a supplier, merge order, content checkout or package source were made.

Object searches used the prescribed `roadmaps grep` and `roadmaps show`, the board-package index, and both pinned libraries. The principal library duplication is R01. Native standard syntomic algebras have fixed relative dimension; the local Zariski-cover predicate and ind-syntomic factorization predicate add different content. Neither a general ind-syntomic ring-map predicate nor a p-Zariski predicate was found at the pins. The native affinoid nilpotence criterion has additional affinoid/norm hypotheses and does not duplicate Q8.4 for arbitrary Tate rings.

The closest heads were read: PerfectoidQuotients (#1042), PrismaticCohomology (#1057), DirectSummandsAndBigCohenMacaulay (#1735), PurityForFlatCohomology (#1840), and PrismaticCohomologyPartIII (#1070). PerfectoidQuotients README 54, 1103 and 1111 explicitly leaves ordinary ind-syntomicity to this Part II. DirectSummandsAndBigCohenMacaulay README 581–611 constructs a fixed-perfectoid-field algebra and almost flatness; the general integral-perfectoid prismatic cover and the HM17 extended-plus-closure Tor statement here differ. PurityForFlatCohomology README 184–186 imports this package's valuation results and residue towers. PrismaticCohomologyPartIII README 69 and 226 imports the underlying perfectoid inputs, rather than owning these end results. No second owner or mutual hand-off was found in these heads. Open work outside the supplied/searchable index was not independently discovered or checked.

The supplied overlap report has no shared-head conflict, dropped cited id, open-revision-only id or dropped local id. The closest-vocabulary checks above confirm its ownership leads. No overlap finding results.

### Source sample

All fifteen bold **Theorem** targets were checked, not just their theorem labels. No author-flagged unverified locator was present. Nine cited works have nine existing manifest keys. The cached versions match the README's stated arXiv versions. Stacks 0BIQ was fetched through the sources service with add-only; it retained the existing key and author entry. No text was unavailable.

| Target | Locator actually read | Hypotheses and support |
|---|---|---|
| Q5.6 | CS24 Proposition 2.1.4, pp.12–13, lines 468–486 | Surjection on the A leg, arbitrary perfectoid B leg; fibre product and tilt conclusion both present. |
| Q6.2 | CS24 Proposition 2.1.9, pp.14–15, lines 544–565 | Divisor of ξ₀, classical completeness in both directions; no torsion-free assumption. |
| Q6.4 valuation property | CS24 lines 545–546, 568–576 | Both directions, including the characteristic-p case. |
| Q6.4 value groups | CS24 lines 547, 572–576 | Sharp induces the comparison; every element is a unit times a sharp. |
| Q6.7 | CS24 lines 576–585; Sch12 Theorem 3.7(ii), Proposition 3.8, p.17, lines 751–761 | Rank-one field equivalence, then height-one localization for arbitrary rank. |
| Q6.8 torsion-free presentation | CS24 Proposition 2.1.12, pp.17–18, lines 682–700 | Lift of the specified ϖ, its divisibility and completeness retained. |
| Q6.8 specified roots | CS24 lines 687–699; Theorem 2.3.4 proof, p.25, lines 1015–1018 | Setting the unit u to 1 using the specified root system gives the strengthened lift. |
| Q6.8 p-torsion-free presentation | CS24 lines 684, 700–702 | Separate choice of ξ̃₀ gives p-torsion-freeness. |
| Q8.3 | CS24 Lemma 2.3.1, pp.22–23, lines 895–901, 907–950 | Same uniform quantifier order and factor `v(p)·max(...)`; Sch12 Corollary 6.7, pp.34–35, lines 1675–1683 is only the cited analogue. |
| Q8.4 | CS24 Lemma 2.3.2, p.24, lines 959–978; Wedhorn Proposition 7.18, pp.60–61, lines 2494–2503 | Element-adic localization statement; Tate generalization uses the native integrality criterion and a pair of definition. |
| Q9.3 | CS24 Theorem 2.3.4, p.25, lines 1004–1018 | Both alternative hypotheses, ideal divisibility, both faithful-flatness conclusions; degree-positive correction is necessary. |
| Q9.6 | CS24 Corollary 2.3.7, pp.28–29, lines 1157–1174 | Root-bearing source need not be an A-algebra; reduced-quotient completion is the perfectoid object. |
| Q10.2 | BS22 Remark 3.11, pp.32–33, lines 1299–1327; Bha18 Proposition 5.2, p.8, lines 469–479 | Faithfully flat generalized integral-perfectoid cover; Bha18's modification (a), not its merely almost-flat fixed-field form. |
| Q10.5 | BS22 Remark 10.13, pp.83–84, lines 3208–3226 | Supplied cover, finite subextension and finite étaleness off c; package makes the root-transport step explicit. |
| Q10.6 | HM17 Theorem 1.3, p.2, lines 65–70; BS22 lines 3210–3226 | F-finite residue field is the HM17 hypothesis. The exact mod-pⁿ Tor formulation is BS22's sufficient stronger statement, not a verbatim formulation of HM17. |

Additional repaired/source-critical passages read: BMS1 Definition 3.5 and Lemmas 3.2, 3.9, 3.10 (lines 863–870, 1008–1041, 1062–1067); Wedhorn Lemma 7.4 and Theorem 7.10 (lines 2325–2337, 2429–2440); CS24 §2.3.6 (lines 1030–1075, 1150–1155); BS22 reducedness in the proof of Theorem 7.4 (line 2436); Ces19 Lemmas 4.7, 5.1, 5.2 (lines 303–310, 419–430, 447–462); Bha18 ordinary flatness (lines 451–467); Stacks, More on Algebra, Lemma 32.2/tag 0BIQ (lines 3872–3875). In particular CS24 itself distinguishes the finite-variable syntomic stages from their ind-syntomic union, unlike R02's Check.

### Computed adversarial table

Values below are mathematical computations, not claims that a sorry build proves the statements. The cases cover the sampled targets, every headline, all repaired passages, the new findings, and sections lacking computed coverage in the previous review. Earlier computed zero-ring, flatness and Tor controls were recomputed where used. No group/coset, sign of a duality, or cardinal-indexed numerical formula occurs in this package; the relevant convention tests are sharp, Frobenius, root exponents, map directions and adic topology.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Integral perfectoid predicate; adic conventions | 0, `𝔽₂`, `ℤ₂` | For 0 and `𝔽₂`, π = 0 works; in `𝔽₂`, `ker θ = (2)`. In `ℤ₂`, `2v₂(π) ≤ 1` forces a unit, whose completion is 0 rather than `ℤ₂`. | Correct object, duplicated native class: R01. |
| Q5.1 tilt and θ | `ℤ₂`; perfect `𝔽₃`-algebra; `ℤ₃/9` | Compatible sequences in `ℤ₂` are 0 and 1, giving `𝔽₂`. In characteristic p, sharp is identity. Modulo 9, `(1+1)³ = 8 ≠ 2`, so ϖ = 9 fails the divisor condition. | No change. |
| Q5.2 products and pullbacks | Empty product; `B=A'`; `A=B=ℤ_p→ℤ/p²` | Empty product and its tilt are 0; identity pullback is A on both sides. For the last example `(p²,0) ∈ p²(A×B)∩C` but `(p,0)∉C`, disproving the bound-one inclusion without the torsion hypothesis. | Correct hypothesis retained. |
| Q5.3 reduction and ideals | Completed `ℤ_p[p^{1/p^∞}]`, ϖ = `p^{1/p}` | Both quotients are `𝔽_p[t^{1/p^∞}]/(t)`; `(ϖ♭)^p=t=p♭`. Multiplication of p♭ by a unit preserves `(t)`. | No change. |
| Q5.4 torsion and corrected Check | `𝒪_C×𝔽̄_p`; `B/(t)` | For ϖ = `(p^{1/p},0)`, both torsion modules equal `0×𝔽̄_p`. For `B/(t)`, tilt is `B̂_(t)`, and the compatible sequence with first term `t^{1/p}` is nonzero. In the target `t^{1/p}` has p-th power 0. Multiplication by t is nonzero on the tilt but zero on `B/(t)`, excluding the proposed module identification too. | F05 repaired; non-perfectoid negative control retained. |
| Q5.5 A_inf surjection | Identity; `𝒪_C→k̄`; target 0 | Identity has kernel 0; `W(𝒪_C♭)→W(k̄)` has coordinatewise kernel `W(𝔪_C♭)` and sends the Fontaine ideal onto `(p)`; target 0 gives `ker/ξ = A`. | No change. |
| Q5.6 fibre products | `A'=0`; two perfect polynomial-root rings over `𝔽₂` | First pullback is `A×B`; second is pairs with equal constants, closed under coordinatewise square roots, so Frobenius is bijective. Its tilt is itself on both sides. | Headline passes controls. |
| Q5.7 glueing direction | `B=k̄`; `B=𝔽_p→k̄` | First pullback is A; second is precisely elements of `𝒪_C` with residue in `𝔽_p`. Reversing the arrow supplies no map from B to the pullback base. | No change. |
| Q6.1 relative equivalence | Perfect characteristic-p base; `B=C♭` over `𝒪_C♭` | ξ = p gives `W(B)/(p)=B`. In the second case ξ₀ is a unit, its completion is 0 and `W(C♭)/(ξ)=0`, not a ring with tilt C♭. | Completeness excludes the wrong object; correctly docstring-only. |
| Q6.2 completeness transfer | ϖ♭ = 0 in characteristic p; `∏𝒪_C` | For 0 the limit is the original ring on both sides. For a constant root of p in the product, coordinatewise limits give the complete product and its complete tilt. | Both directions consistent. |
| Q6.3 valuation rings without perfectoidness | `ℤ_p`; `𝔽_p⟦t⟧` | Each tilt is `𝔽_p`, with value group 0; each original value group is ℤ. The induced group map is injective, not surjective. | Generality correctly distinguished from Q6.4. |
| Q6.4 valuation property | `𝒪_C`; `𝒪_C×𝒪_C` | First ring and tilt are valuation domains; the second pair both have `(1,0)(0,1)=0` with nonzero factors, so both fail. | Both directions tested. |
| Q6.4 value groups | Completed p-root tower; x=`t^{1/p}`, y=t; a=`1+p` | Both additive value groups are `ℤ[1/p]`; `1/p ≤ 1` gives divisibility on both sides. `a=(1+p)·1♯`, with unit factor. | Map direction and normalization agree. |
| Q6.5 localization completeness | `𝒪_C`, q=𝔪 or 0; a=0 | At 𝔪 the localization is V. At 0 with a≠0, all a-adic quotients of Frac(V) are 0, so it is not separated. With a=0 every inverse limit is the ring. | Required prime containment is retained. |
| Q6.6 perfectoid localizations | Rank-one mixed characteristic; perfect characteristic p | Allowed mixed-characteristic localization is V; Frac(V) has p invertible and completion 0. In characteristic p the fraction field is perfect and π=0 works. | Excluded mixed-characteristic zero prime is necessary. |
| Q6.7 algebraic closedness | `𝒪_{ℂ_p}`; completed 3-root tower | First fraction fields are algebraically closed. In the second pair residue field is `𝔽₃`, where squares are 0,1; `X²−2` has no root on either side. | True/true and false/false controls. |
| Q6.8 torsion-free presentation | `A=𝔽₂`, ϖ=0 | Completed `ℤ₂[2^{1/2^∞}]` surjects to `𝔽₂`; ϖ̃=`2^{1/2}` is regular, its square is 2, and all its roots reduce to 0. | Required lift, regularity and completion all hold. |
| Q6.8 specified roots | Same example; root index n | `r'_n=2^{1/2^{n+1}}`; `(r'_(n+1))²=r'_n`; all images are the prescribed zero roots. | No unit twist is lost. |
| Q6.8 p-torsion-free presentation | Same example; zero target | Multiplication by 2 is injective in the source and the residue map is surjective. The unique zero ring as source also works for target 0. | No change. |
| Q7.1 ind-fppf | Identity; `ℤ→ℚ`; empty product | Identity has fibres κ(𝔭); `ℚ⊗𝔽_p=0`; empty product is 0 and also has zero fibres. | Nonempty product restriction is necessary. |
| Q7.2 syntomic/ind-syntomic | Root-polynomial tower; `k[x,y]/(x²,xy,y²)` | Each finite root stage is a polynomial ring of dimension 1. The second algebra has embedding dimension 2, dimension 0, and three independent minimal relations, exceeding codimension 2. | Syntomic versus flat distinction is real. |
| Q7.3 permanence | Polynomial extensions; base change to `𝔽₂`; empty product | Successive polynomial maps give a two-variable ring; `𝔽₂⊗ℤ ℤ[X]=𝔽₂[X]`; zero algebra is syntomic by empty cover but not faithfully flat over ℤ. | No change. |
| Q7.4 flatness glueing | `M=ℤ_p`; `M=ℤ/p`; dual numbers | First localizations/reductions are `ℚ_p`, `𝔽_p` and M is flat. Second has flat pieces 0 and `𝔽_p` but nonzero p-torsion. Dual numbers give `ε·1=0` in the residue module, violating regularity. | No counterexample with all hypotheses. |
| Q7.5 blowup | `(p,T)` in `ℤ_p[T]`; `(2,2)` in ℤ | First presentation is `ℤ_p[X]` by T=pX. Second blowup is ℤ but proposed unrestricted presentation has nonzero X−1 killed by 2. | Regular-pair hypothesis distinguishes the cases. |
| Q7.6 hypersurfaces | g=`1+px`; g=`pX`; n=0 | First quotient is `ℚ_p`; second has p-torsion X; at n=0, fibrewise nonzero g is a unit and quotient is 0, with no nontrivial fibres. | Natural subtraction boundary is harmless here. |
| Q8.1 continuity | Gauss and composed T-adic/p-adic valuations | Gauss gives `v(pⁿ)=p^(−n)→0`. Composed valuation gives `(0,−n)>(−1,0)=v(T)` for every n. The trivial valuation gives `v(pⁿ)=1`. | F02 repaired; cofinality distinguishes all three. |
| Q8.2 tilted valuation | `p♭`; lifts of coordinate zero | `v♭(p♭)=v(p)>0`; lifts 0 and p of the same mod-p coordinate have values 0 and v(p). Thus valuing a representative of coordinate zero gives the wrong object. | Sharp-based definition is determined. |
| Q8.3 approximation | a=b♯; a=`1+p`, a'=1; m=0 | First error is 0. Second error is v(p), equal to `v(p)·max(1,v(ϖ)^(pm))`; at m=0 any mod-p sharp lift has error at most v(p). | Uniform inequality and boundary consistent. |
| Q8.4 nilpotence | p,1 in `ℚ_p`; T in Tate algebra; zero ring | `pⁿ→0`, v(p)<1; `1ⁿ=1`, v(1)=1; Gauss v(T)=1; zero ring has no valuations and its only power sequence is constantly 0. | Both implications and empty valuation family checked. |
| Q9.1 root extension | Empty polynomial set; P=T; P=1 | Empty set gives I'=0. For P=T, α₀=0 but α₁≠0 and α₁^p=0; it becomes infinitely ϖ-divisible. For P=1 the quotient is 0. | Positive degree is essential; nilpotents allowed before completion. |
| Q9.2 one-polynomial stages | P=T, m=1, j=0 | `B[1/ϖ]=C[T^{1/p^∞}]`; for every N the exponent `1/p^{N+1}` is absent from the subalgebra generated at level N. Finite-variable replacements have dimension 1. | R02. |
| Q9.3 André theorem | `𝒪_C`; completed 3-root tower; zero ring | For `𝒪_C`, A'=A and I'=0; over the root tower `X²−2` has residue values 1 or 2, never 0, so extension is nontrivial. Zero ring gives only zero objects. | Headline is not a tautology. |
| Q9.4 consequences/root Check | Completed cyclotomic 3-tower | Unit multiples have compatible roots; `X³−3` gives degree 3 without normality, while a cyclotomic finite subextension must be normal. | Actual 3-roots are absent: R03. |
| Q9.5 p-Zariski/Zariskization | `ℤ/pⁿ`, ℤ, ℚ; p=2 | Nilpotent p gives unit `1+pa`; in ℤ, `1+p` is nonunit; in ℚ, a=−1/p gives 0. At p=2 all odd integers lie in `1+2ℤ`, giving `ℤ_(2)`. | Positive and negative models distinguish the definition. |
| Q9.6 semiperfectoid cover | `A=ℤ_(p)`, `A=𝔽_p`, A=0 | `ℤ̄_p` has completion `𝒪_{ℂ_p}`; its quotient modulo p has reduced quotient `𝔽̄_p`, whose p-completion is itself. Zero case gives zero. | Correct order of reduction and completion. |
| Q10.1 residue towers | `ℤ_p`; `ℤ_p[√p]` | Unramified Witt stages have ramification index 1; adjoining √p gives index 2, and p lies in the square of the maximal ideal. | Unramified clause correctly scoped. |
| Q10.2 covers | `ℤ₂`; `𝔽₃⟦t⟧`; crystalline wrong model | f=2−x gives δ(f) a unit and completed 2-root tower. Equal characteristic gives the faithfully flat perfection. Crystalline quotient `ℤ₂→𝔽₂` has `Tor₁(𝔽₂,𝔽₂)=𝔽₂`, so cannot be the cover. | Correct prism presentation matters. |
| Q10.3 absolute integral closure | `ℤ_p`; `𝔽_p⟦t⟧`; ℚ | Completions are `𝒪_{ℂ_p}`, `R⁺`, and 0 respectively. In characteristic p, multiplication by p=0 is not injective on nonzero R⁺. | Characteristic-zero hypothesis needed for torsion-freeness. |
| Q10.4 finite stages and normality | p=2,3; perfect k; `k=𝔽₃(t)` | For `R=ℤ_p`, first-stage rank is p. For `R=W⟦x⟧`, k=`𝔽₃(t)`, it is `3·3²=27`. At n≥1, `φ^n(x₁−p)≡−p mod 𝔪²`, so the quotient is regular; n=0 is the original regular R. For the ramified equation `f=p−x²`, `φ^n(f)=p−x^{2p^n}≡p mod 𝔪²` for n≥1, including p=2. | F01 construction passes these controls. |
| Q10.4 completion/intersection | `p^{1/p}`, `p^{1+1/p}`; infinitely generated p-basis | Values 1/p and 1+1/p respectively exclude/include pR⁺; the included element equals p times a member of R∞. Infinite p-basis gives `[k:k^p]=∞`, so stages are not finite. | Intersection proof uses normal finite stages; no claim of a finite stage outside F-finite scope. |
| Q10.5 enlarged cover/action | c=0; `c=p(x+p)`; index k | c=0 forces c_k=0. In the enlarged ring, `(T^{1/p^k})^{p^k}=c`; its image in the reduced perfectoidization modulo c is 0 and its image in `(R⁺)^∧` is exactly c_k. | Root-transport step repaired; the separate unit-root Check is R03. |
| Q10.5 finite-subextension Check | `R=ℤ₃`; `R=ℤ₃[3^{1/3}]` | First `R[√3]` has value group `(1/2)ℤ`, excluding 1/3. Second already contains an element with cube 3 before adjoining √3. | Restrict the negative control as in R03. |
| Q10.6 Tor and F-finite signature | k perfect; `𝔽₃(t)`; infinite p-basis; S=R | Frobenius field-range module ranks are 1,3,∞. For S=R, positive Tor is 0 and multiplication by every c_k remains 0. Finite normal S in dimension 2 is free, again giving 0. | Exact F-finite binder retained; no boundary theorem added as padding. |

### Elaboration, signatures, headline coverage and padding

Ran `lake env lean` on the original Suggested.lean from the supplied content checkout: exit 0, exactly 15 warnings, all `declaration uses 'sorry'`. All imported Tau Ceti object files existed; no build was necessary. There is one `import Mathlib`, followed by three individual used Tau Ceti imports. No forbidden option or sorry'd data occurs. The file has 351 lines.

A fresh scratch copy appended `#check @name` for every one of the 19 declarations and elaborated successfully. Compared every type with the corresponding README statement: regular-local, characteristic-zero, completeness, finite-module, étale, valuation continuity and compatible-root hypotheses are retained. In particular the field range in Q10.6 is `𝔽₃(t³)` for `k=𝔽₃(t)`, not k, and the two valuation targets quantify an independent value-group universe. `IsPZariski` intentionally does not need a prime binder to define its condition. No lost section hypothesis was found.

The summary's headline list is Q5.6, Q6.4 (two signatures), Q6.7, Q6.8 (three signatures), Q9.3, Q9.6, Q10.2 and Q10.5–Q10.6; all appear. The additional deep transfer and approximation signatures are Q6.2, Q8.3 and Q8.4. This totals 15. Q6.1 is explicitly named in the module docstring as not statable without the category-level tilt functor/equivalence. `PreTilt` and its multiplicative sharp do not alone supply that functor. No statable headline was found omitted or replaced by a free-predicate stand-in. R01 concerns an unnecessary replacement of an existing predicate, not a missing headline.

For **every** sorry theorem, a scratch copy tried `first | rfl | infer_instance | simp`. There were 15 failures: five “simp made no progress” and ten unsolved goals. None closed. I also compared the supplied Loogle/LeanSearch leads at the pin: product-ring and perfect-ring instances do not prove perfectoid fibre products; `IsAdicComplete.bot` handles only the zero ideal; projective Tor vanishing needs a projectivity hypothesis absent here; the sharp lemmas do not supply uniform approximation. No one-library-lemma proof, definitional restatement, README-Check duplicate, small-value or boundary-case theorem was found among the 15. No padding deletion is requested.

### Pinned library evidence

Paths below are relative to the appropriate pinned library repository. The pins used are the manifest values in R05. Opening the declarations, rather than relying on the prior round's inventory, found R01 and R04.

| Opened declaration(s) | File and line at the pin | Scope checked |
|---|---|---|
| `TauCeti.Perfectoid.IsIntegralPerfectoid` | `TauCeti/RingTheory/Perfectoid/Integral.lean:76` | Exact same three fields; completeness instance 95, nonunit theorem 102, perfect-ring instance 131, zero-ring theorem 144. |
| `PreTilt`, `PreTilt.isDomain` | `Mathlib/RingTheory/Perfection.lean:623`, 801 | Tilt carrier; domain theorem is a valued-field result, not Q6.3 in full generality. |
| `PreTilt.untilt`, coordinate and root lemmas | `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`, 57, 72 | Nonunit p and p-adic completeness explicitly required. |
| `Perfection.quotientMulEquiv`, zeroth coordinate | `Mathlib/RingTheory/Teichmuller.lean:195`, 206 | Quotient characteristic p and adic completeness; monoid equivalence, not an unexplained ring structure on arbitrary compatible sequences. |
| `WittVector.fontaineTheta`, reduction, Teichmüller value, surjectivity | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`, 173, 183, 196 | Surjectivity needs surjective Frobenius. |
| `WittVector.eq_of_apply_teichmuller_eq` | `Mathlib/RingTheory/WittVector/TeichmullerSeries.lean:117` | Target has nilpotent p; Q5.1 applies it to A/pⁿ before taking the limit. |
| Witt map, Teichmüller, Verschiebung | `Mathlib/RingTheory/WittVector/Basic.lean:253`; `Teichmuller.lean:93`; `Verschiebung.lean:109` | Ring/additive/multiplicative map distinctions retained. |
| `IsAdicComplete`, Jacobson inclusion | `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`, 915 | Includes separatedness; supports the p-Zariski implication. |
| `ValuationRing`, value group | `Mathlib/RingTheory/Valuation/ValuationRing.lean:64`, 77 | Domain instance required; value group is formed from unit orbits. |
| `Valuation.IsContinuous` and consequences | `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`; `TopologicallyNilpotent.lean:123`, 140 | Attained-value continuity; arbitrary-ratio comparison uses continuous multiplication, available for the adic/Tate topologies here. |
| `PairOfDefinition`, `IsTateRing` | `TauCeti/RingTheory/Huber/Basic.lean:163`, 213 | Open ring of definition, finitely generated defining ideal; Tate includes Huber-ring structure. |
| Continuous spectrum and integrality criteria | `TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.lean:155`; `TauCeti/RingTheory/Huber/Continuous/ValuativeCriterion.lean:429` | Cofinality conjunct retained; integrality requires an open subring. |
| Standard syntomic and presentation criterion | `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`, 105 | Flatness, finite presentation, and dimension of nontrivial fibres; the empty algebra has no nontrivial fibres. |
| Affine blowup and lift | `TauCeti/RingTheory/Ideal/AffineBlowup.lean:64`, 138, 161, 226 | Subalgebra in localization, fraction criterion, regularity, and universal map; no unrestricted polynomial presentation. |
| `CategoryTheory.Tor`, projective vanishing | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, 55 | Derivation in the second argument, natural map in the first; Q10.5–Q10.6 use the correct argument. |
| Native henselization | `TauCeti/RingTheory/Henselization/Algebra.lean:43`; `IndEtale.lean:47`, 60; `Quotient.lean:37`, 81 | Replacements in R04; no missing mathematical prerequisite. |

The remaining basic names in the supplier list resolve at the pin: `Algebra.FinitePresentation` (`Mathlib/RingTheory/FinitePresentation.lean:44`), `Algebra.Etale` (`RingTheory/Etale/Basic.lean:205`), `Module.Flat` (`RingTheory/Flat/Basic.lean:114`), `Module.FaithfullyFlat` (`RingTheory/Flat/FaithfullyFlat/Basic.lean:64`), `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`), `HenselianRing` (`RingTheory/Henselian.lean:81`), `IsSMulRegular` (`Algebra/Regular/SMul.lean:47`), `RingTheory.Sequence.IsRegular` (`RingTheory/Regular/RegularSequence.lean:147`), the quotient/equalizer/localization/integral-closure carriers, `PerfectClosure`, `PerfectRing`, polynomial carriers and `frobenius`. Their actual uses are also type-checked in the acceptance test. No same-name hit from an unrelated namespace was treated as evidence of ownership.

### Supplier resolution and direction

| Supplier | Resolution and ownership evidence |
|---|---|
| PerfectoidQuotients, supplied open head | README §§0.2–0.6 at lines 617, 712, 783, 832, 921; naturality at 628, generator criteria 688–694, torsion bound 747, annihilators 792–799, iterated Frobenius 821, closure criteria 888–907, completed operations 928–985. §§1.2 and 1.4 at 1089 and 1194 supply the weaker covers used for comparison. All cited mathematical contracts resolve. |
| PerfectoidSpaces, main | README P0.1/P0.2/P0.11 at 879/965/1714; P1.24/P1.25 at 5049/5101; P3.7 at 8424; P4.15.2/P4.15.4 at 11053/11144; P7.16a/P7.17 at 17397/17487. Cohen presentations and `RegularTower.exists_perfectoidTower` resolve at 17425–17443 and 17507. R01 updates the predicate to the library while retaining unsupplied criteria here. |
| PrismaticCohomology, supplied open head | README §§0.61–0.63 at 1169–1215, §0.79 at 1454; §§2.30–2.31 at 2789 and 2801. Perfect prisms are explicitly redirected to PerfectoidSpaces; perfect-site universality, integral discreteness and arbitrary-ideal almost purity remain here. Only the phantom δ-map name needs R04. |
| SchemeAndStackFoundations, main | README §§0.12–0.14 at 1160, 1197, 1240; native redirects at 185–197. Henselian quotient and integral-extension permanence exist, but the old flatness/quotient names need R04. |
| EnhancedDerivedSheaves, main | README E1.6 at 689; `frobenius_flat_of_isRegular` at 706 explicitly includes regularity and characteristic p. |
| DerivedDeRhamCohomology, supplied open head | README §1.10 at 537–550; Suggested.lean 86 and 97 contain both ordinary-flatness criteria. The worker's two unresolved-name leads are genuine supplier declarations, not missing library lemmas. |
| StableReduction, main | Layer 1 includes syntomic morphisms; Q7.2 adds the affine cover/factorization forms using Tau Ceti standard syntomic algebras. |

Read every `*Needs:*` line and supplier paragraph. No upward edge, circular owner hand-off, forbidden supplier, or unowned prerequisite was found. Prismatic perfectoidization is consumed after its earlier owner, not rebuilt here. The changed Q10.5 route records Q9.1, Q9.2 and Q7.4, and Layer Q10's Dependencies include Q7 and Q9. The declared-gap list is empty.

Dependency-check output from the required command:

```text
depcheck: 234 roadmaps, 2113 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred.

## Not verifiable

- None of the required source sample, package elaboration or named supplier contracts was inaccessible. No missing-reference request is needed.
- Ownership was checked against main, the board-package index and the available open-head index, including all five closest heads. No claim is made about unindexed or unspecified open work.

## Source issues

- **Misprint** in CS24 at Corollary 2.3.7, proof, printed page 29 (line 1174): the source says the product clause 2.1.11(d) proves perfectoidness after a root-stable quotient; it should be the root-stable quotient clause 2.1.11(c); affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, printed page 25 (lines 1009–1010), and Corollary 2.3.7, printed page 28 (lines 1159–1160): the source says every monic polynomial has a root in the indicated nonzero extension; it should be every monic polynomial of positive degree, excluding the constant polynomial 1; affects nothing.
- **Gap** in BS22 at Remark 10.13, printed page 83 (lines 3214–3216): the source says Remark 3.11 supplies a faithfully flat perfectoid cover inside the completed absolute integral closure; it should be supplemented by a construction of that compatible map, beyond the abstract cover of Remark 3.11; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (lines 3217–3226): the source says middle-term almost annihilation gives annihilation by the specified roots in the absolute integral closure; it should be supplemented by compatible root transport, for example by enlarging the cover to carry those roots; affects the proof.
