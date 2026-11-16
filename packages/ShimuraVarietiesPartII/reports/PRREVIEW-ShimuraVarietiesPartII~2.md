# Review of ShimuraVarietiesPartII (pull request #2463 at 7a2df81)

**Verdict:** needs changes

## R01 (P2) — gap:hodge-cover-refinement no longer supplies the reflex splitting that §2.2 imports from it

**Location:** `TauCetiRoadmap/ShimuraVarietiesPartII/README.md:69`: "and T a set of complex embeddings of K chosen as in the proof of KP Lemma 4.6.22, p.206. Prove that Deligne's construction on V=W⊗_F K … gives a Shimura datum (G,X) of Hodge type with G^der=Res_(F/Q)H^♯, …"

**Claim:** T appears in no conclusion, and no conclusion concerns E(G,X). §2.2 (README.md:553) cites only this gap and ReductiveGroupsPartII §RG2.1 for "every v_2|p of E_2 splits completely in E E_2/E_2". That property is therefore supplied by nobody, and §§2.3–2.5 inherit the gap through §2.2.

**Witness:** KPZ lines 3504–3505, proof of Proposition 7.2.10: the choice of T is what makes every v_2|p split in E·E_2. KP lines 3454–3459: h_T is defined from T, and E=E^ad·E(K^×,h_T).

**Repair:** Append to the gap paragraph: "For this choice of K and T, prove also that every prime of E(G_2,X_2) above p splits completely in E(G,X)·E(G_2,X_2) (KP Lemma 4.6.22(3) and its proof, pp.205–206; KPZ Proposition 7.2.10(2) and its proof, p.79)." Test case: for (PGL₂,ℋ^±) at p=5 with K=Q(i), F has no compact real place, so T=∅ and E(G,X)=Q=E_2.

## R02 (P3) — the Scope section still says that nothing of ReductiveGroupsPartIII Layer 5 is used

**Location:** `README.md:11`: "stated in ReductiveGroupsPartIII Layer 5 (§§5.4–5.9), takes the geometric theorem of Layer 7 as its input through the explicit hypothesis of its §5.5; nothing of that layer is used here."

**Claim:** After the Noot gap moved, §4.13 imports a new target of that same layer, so the sentence is false.

**Witness:** `README.md:1097`: "*Needs:* … ReductiveGroupsPartIII Layer 5 (gap:noot-coarse-comparison)". `README.md:125` places that target "beside §5.5".

**Repair:** Replace "; nothing of that layer is used here." with "; from that layer this roadmap uses only the Conj′ comparison of gap:noot-coarse-comparison, in §4.13, which does not depend on the hypothesis of §5.5."

## R03 (P3) — the description still has a second, unclosed summary marker (R05 partly repaired)

**Location:** Pull-request description: the line `<!-- roadmap-summary -->` that follows "this draft awaits human review." and comes just before the `tauceti-roadmap-pr` marker.

**Claim:** The duplicate paragraph was deleted, but its opening marker was left behind.

**Witness:** The description contains `<!-- roadmap-summary -->` twice and `<!-- /roadmap-summary -->` once.

**Repair:** Delete that second `<!-- roadmap-summary -->` line.

## Previous findings

- R01 — repaired: "N the normalization in Sh_K(G,X) of the principally polarized Siegel moduli scheme of PELModuli §M2.8 at level K′ … the natural maps π₀(Sh_K(G,X)⊗_E F) ← π₀(N⊗O_(F,w)) → π₀(N⊗k(w)) are bijections".
- R02 — repaired: "Prove that Deligne's construction on V=W⊗_F K … gives a Shimura datum (G,X) of Hodge type with G^der=Res_(F/Q)H^♯ … fundamental in the sense of KPZ Definition 7.2.7". The matched-multiplier clause and the §5.2 citation are gone. The restatement dropped the reflex splitting (R01 here).
- R03 — repaired: "the images of the γ_ℓ^m, ℓ≠p, and of γ_(p,m) in Conj′(G) (ReductiveGroupsPartIII §0.7) lie in Conj′(G)(Q) and coincide". The move to ReductiveGroupsPartIII Layer 5 makes `README.md:11` wrong (R02 here).
- R04 — repaired: "the group GU(1,1) of Q(i) … has every listed property" and "GL₂ … is not an output: … Z^c_G=Z_(SL₂)=μ₂, which is not a torus".
- R05 — partly repaired: "Its end theorems are those of Kisin–Pappas–Zhou and Kisin–Zhou with the published corrections". The second paragraph is deleted, but its opening marker remains, unclosed (R03 here).
- R06 — repaired: "The README consumes 28 roadmaps … On main (9) … Open, earlier in the merge order (19)"; "asks 10 of these roadmaps for 22 new statements"; "succeeds with no warnings, the file declaring nothing".

## Verified sound

| Statement | Instances tried | Roadmap side | Source / computed side | Result |
|---|---|---|---|---|
| gap:hodge-cover-refinement | (PGL₂,ℋ^±), F=Q, p=5, K=Q(i), one vertex, T=∅ | G^der=SL₂; fundamental embedding; G=(G′∩GSp(V))° | G′=⟨SL₂,Q^×,U(1)⟩=GU(1,1), dim 3+2=5; KPZ lines 3404–3423, 3462–3465 | conclusions agree |
| §2.2 through that gap | same; KP's choice of T | every v₂\|p splits completely in EE₂ | needs E(G,X)=E^ad·E(K^×,h_T) (KP lines 3454–3459); the gap gives no reflex conclusion | finding R01 |
| gap:component-specialization | GL₂ at full level 5, p=3; Γ₀(p) model | π₀ bijections; irreducible special fibre when locally integral | Y(5): 4 components over Q(ζ₅) and F₈₁. Γ₀(p): connected, two components, uv=0 not a domain, so "hence" does not apply | agrees (MP19 lines 2118–2121, 3497–3527) |
| gap:noot-coarse-comparison | E: y²=x³+x, G=Res_(Q(i)/Q)G_m, p=5 | images of γ_ℓ^m and γ_(p,m) rational and equal | π=1+2i; γ=(1−2i)/5 for every ℓ; frame over Q₅ because T is split; eigenvalue group ≅Z², so neat at m=1 | agrees (HT lines 1093–1103) |
| §2.3 Checks | GU(1,1) of Q(i) versus GL₂, p=5 | the first is an output, the second is not | Z^c=U(1), G_m over Q₅, coinvariants Z; versus μ₂, finite. Good plus smooth gives very good (KPZ line 2632) | agrees |
| §4.7 sketch, chain case | GL₂ Iwahori chain Z_p²⊃Z_p⊕pZ_p | the direct sum has the chain's stabilizer | both are {[[a,b],[c,d]]∈GL₂(Z_p): c∈pZ_p}; HT lines 711–715 | agrees |
| §4.13 sketch | x∈S(F₅) for y²=x³+x, lifted with residue field F₂₅ | the gap's γ is a positive power of γ_x | γ_w=γ_x²: trace (2/5)²−2/5=−6/25, determinant 1/25 | agrees |
| Scope, README.md:11 | §4.13 *Needs:* | "nothing of that layer is used here" | README.md:1097 cites ReductiveGroupsPartIII Layer 5 | finding R02 |

The rows for statements this change does not touch stand as in the previous review, of 53e61e3.

- Source items read against the changed locators: 14. These are KPZ §§7.2.1–7.2.3, §7.2.6, Definition 7.2.7, Propositions 7.2.10 and 7.2.19, and Corollary 5.3.16; KP Lemma 4.6.22; MP19 Theorem 1, its §§2.1 and 4.1.1 setup, and Corollary 4.1.11 with its proof; HT §1.3.2, §2.1.8 and Corollary 2.1.9. Every theorem number, page and hypothesis matches.
- Seeded sample: none of the 15 targets lies in the changed lines. §2.4 cites the restated gap and is affected only through §2.2 (R01). The others stand as verified at 53e61e3.
- Cross-roadmap citations resolved at the current heads: ReductiveGroupsPartIII Layer 5, §5.5 and §0.7; ShimuraData Layer 4 (§§4.1–4.9, with no Deligne Hodge-type lifting, so the gap asks for nothing already provided); ShimuraCompactifications Layer 7 and §7.18; PELModuli §M2.8; ShimuraVarieties §§7.0i and 8.1.
- Gate at 7a2df81: every check is 0 (OK). Depcheck output: `depcheck: 260 roadmaps, 2594 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with no output. The file is unchanged since 53e61e3 and declares nothing, so there is nothing to `#check`.
- Description: the 9 suppliers on main and the 19 open suppliers are confirmed. The 22 gap paragraphs split by supplier as 7, 4, 2, 2, 2 and five single gaps, as the description states. No file outside the folder changes.
- Overlap check: read ReductiveGroupsPartIII, ShimuraData, ShimuraCompactifications and PELModuli, and from the closest lists FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli. Nothing is shared. No roadmap on main or at an open head states Noot's Conj′ comparison, so the gap's only owner is ReductiveGroupsPartIII.

Source independence: changed passages only. 7 passages were compared with 4 sources (KPZ, KP, MP19, HT). Nothing is shared beyond forced statements: the π₀ statement of MP19 Corollary 4.1.11 and the list of generators of G′. Largest share: KZ, 69 of 211 locators by this count; the diff adds no KZ locator. No layer is added, removed or reordered, so the previous comparison of contents with KZ stands: independent.

Research link: §7.6 is Kisin–Zhou's ℓ-independence of Frobenius classes on Shimura varieties (KZ Theorem 5.1.4, Annals 2025), the input to their abelian-variety theorem (KZ §6). §3.8 is Kisin–Pappas–Zhou's abelian-type integral models (KPZ Theorem 7.2.21, 2026), and §1.7 is the canonical-model theory of Pappas–Rapoport and DvHKZ. This rests on the README Summary and on KZ and KPZ.

## Not verifiable

- Noot 2009, Theorems 1.8 and 4.2, which are the content of gap:noot-coarse-comparison: not in the sources cache. The statement was checked against HT lines 1099–1103 only.
- Deligne 1979, 2.3.10 and Corollaire 2.3.3, which are "Deligne's construction" in gap:hodge-cover-refinement: not in the sources cache. Checked against KPZ lines 3356–3423 and KP lines 3439–3459.

## Source issues

- **Misprint** in KPZ at §7.2.2, p.77: the source says W(s) has the highest weight corresponding to the vertex set S; it should be the fundamental weight of the single vertex s; affects nothing.

## For the human reviewers

- Two contracts ask ShimuraCompactifications Layer 7 for lattice-chain or bad-prime moduli: gap:siegel-chain-moduli here (`README.md:203`) and gap:bad-prime-projectivity in the PELModuliPartII README (line 367). ShimuraCompactifications' scope says it does not construct parahoric-level moduli interpretations.
- gap:component-specialization (`README.md:205`) also asks ShimuraCompactifications Layer 7, which covers PEL models at good primes; its §7.18 Check asserts nothing for general Hodge-type data. The route the gap cites is MP19 Theorem 1, the Hodge-type compactification.
- The design plan records gap:noot-coarse-comparison with supplier ArithmeticGaloisRepresentations Layer 6 and its earlier needs text, while `README.md:125` names ReductiveGroupsPartIII Layer 5. The plan also keeps the earlier needs text of gap:hodge-cover-refinement and gap:component-specialization.
- "Good integral Hodge embedding" (KPZ Definition 3.4.4) is stated both in FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1 and in GeometricSatakeAndFusionPartII §0.6. This README (`README.md:21` and `:99`) treats the two as one notion.
- KPZ was read from the open-access Cambridge publisher PDF, K17 from the author's page and MP19 from arXiv v6. KZ is cited in arXiv v2 pagination, not collated with Annals 202 (2025).
