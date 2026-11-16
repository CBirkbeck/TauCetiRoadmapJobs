# Review of ShimuraVarietiesPartII (pull request #2463 at 9962e5f)

**Verdict:** needs changes

## R01 (P2) — the §2.2 splitting step holds only at the prime of the fixed embedding

**Location:** `TauCetiRoadmap/ShimuraVarietiesPartII/README.md:551`: "by the choice of T it preserves T and therefore fixes E(K^×,h_T). Hence every prime of E^ad above p splits completely in E, and every v_2|p of E_2 in E E_2"

**Claim:** The gap's condition on T involves only the decomposition group of the one fixed embedding Q̄→Q̄_p, so it controls only the prime of E^ad which that embedding induces. For some T the gap allows, other primes of E^ad above p do not split, and §§2.3–2.6 inherit the claim through §2.2. This is the previous R01, partly repaired.

**Witness:** F=Q(α), α³−4α+1=0 (group S₃), p=7=𝔭₁𝔭₂ of degrees 1,2, H compact exactly at v₁,v₂, K=F(√−3), D₀=⟨(23)⟩. T={(v₁,ε),(v₂,ε̄)} meets the condition vacuously, Stab(T)={1,((12),c)}, and the degree-1 prime of E^ad=v₃(F) is inert in E.

**Repair:** Replace the sketch's first two sentences with: "For G_2^ad Q-simple, take the cover of gap:hodge-cover-refinement with K=F·k, where k is an imaginary quadratic field in which p splits and k⊄K_S, and T is the set of embeddings over I_c that restrict to one fixed embedding of k. This T meets the gap's condition, and E=E^ad·E(K^×,h_T) with E^ad=E(G_2^ad,X_2^ad)⊂E_2. Every decomposition group D⊂Gal(Q̄/Q) at a prime above p fixes k. An element of D fixing E^ad fixes the conjugacy class of μ_h in G_2^ad, whose component is trivial exactly at the places of I_c. It therefore preserves I_c, hence T, and fixes E(K^×,h_T)." Keep the rest of the sketch and its citations. On the witness, T={(v₁,ε),(v₂,ε)} has stabilizer {1,((12),1)}, which contains the decomposition group ⟨(12)⟩, so the degree-1 prime splits.

## Previous findings

- R01 — partly repaired: "take the cover of gap:hodge-cover-refinement, whose reflex field is E=E^ad·E(K^×,h_T)". The gap now supplies the reflex field and §2.2 owns the splitting, but its splitting step holds only at one prime (R01 here).
- R02 — repaired: "From that layer this roadmap uses only the extension of §5.3a asked for in gap:rg3-stabilizer-closed-immersion (in §§2.4–2.5) and the Conj′ comparison of gap:noot-coarse-comparison (in §4.13), and neither assumes that hypothesis."
- R03 — not repaired: deferred (D01)

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Roadmap side | Source / computed side | Result |
|---|---|---|---|---|
| gap:hodge-cover-refinement, reflex field | (PGL₂,ℋ^±), F=Q, K=Q(i), p=5, I_c=∅ | T=∅; E(G,X)=E^ad·E(K^×,h_∅) | h_∅ has type (0,0) everywhere, so E(K^×,h_∅)=Q; E(GU(1,1))=Q=E^ad (KP lines 3454–3459) | agrees |
| same gap, nonempty T | F=Q(√5), B ramified at v₂ and one finite place, p=29, K=F(i) | T={σ} over v₂ satisfies the condition | E_T=σ(K), E^ad=F, E≅K; (5/29)=(−1/29)=1, so the primes of F above 29 split in K | agrees |
| §2.2 sketch, T as the gap allows | F: α³−4α+1 (disc 229, S₃), p=7, B ramified at v₁,v₂, K=F(√−3) | every prime of E^ad above 7 splits completely in E | T={(v₁,ε),(v₂,ε̄)}: at D=⟨(12)⟩, E^ad has local degree 1 and E local degree 2 | finding R01 |
| §2.2 sketch, repaired T | same; T={(v₁,ε),(v₂,ε)} | same | Stab(T)={1,((12),1)}; D∩Gal(Q̄/E^ad) is ⟨(12)⟩, 1, 1 for the three decomposition groups, each inside Stab(T) | holds with the repair |
| gap's existence of T | any F, K with every 𝔭\|p split | "such a T exists" | pick one 𝔓\|𝔭 for each 𝔭; the lift through 𝔓 of each v∈I_c is unique, and D₀ preserves induced primes | agrees |
| Scope, README.md:11 | ReductiveGroupsPartIII at its head | uses only the §5.3a gap (§§2.4–2.5) and the Noot gap (§4.13), neither assuming the §5.5 hypothesis | §5.3a is in Layer 5 (its line 1500) and its *Needs:* has no §5.5; this README cites them at lines 589, 613, 647 and 1097 only | agrees |
| §2.5 (sample) | KPZ Proposition 7.2.19, p.83 | 2-group π₁, (D), splitting, R-smooth centre, quasi-tame Z^c, self-dual very-good; torsion-free X_*(G_ab)_I conditionally | KPZ lines 3669–3683, before the page-84 marker | agrees; the splitting inherits R01 |
| §2.5 Check | E₂=Q, cover reflex field Q(i), p=5 and 3, then Q(√−2) | 5 splits, 3 is inert, 3 splits in Q(√−2) | −1≡2² mod 5; −1 is a non-square mod 3; −2≡1 mod 3 | agrees |

The rows for statements this change does not touch stand as in the previous review, of 7a2df81.

- Source locators checked against the text: 9. These are KP Lemma 4.6.22 and its proof (pp.205–206, lines 3422–3464) with the three p.206 citations the diff adds, KPZ §§7.2.1–7.2.3 (pp.76–78), §7.2.6 with Definition 7.2.7 (pp.78–79), Proposition 7.2.10 and its proof (p.79, lines 3489–3508), and Proposition 7.2.19 (p.83).
- Seeded sample: §2.5 is the only sampled target that depends on the changed lines. The other 14 stand as verified at 53e61e3.
- Cross-roadmap citations resolved: ReductiveGroupsPartIII Layer 5 preamble, §5.3a and §5.5 at its head, and ShimuraData §§4.6–4.7 at its head. ShimuraData has no Deligne Hodge lifting and no reflex-field formula for one, so the restated gap asks for nothing already provided.
- Library declarations opened: none. `Suggested.lean` is unchanged since 7a2df81 and declares nothing, so there is nothing to `#check`.
- Gate at 9962e5f: every check is 0 (OK). Depcheck output: `depcheck: 260 roadmaps, 2594 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with no output. No file outside the folder changes.
- Description re-read against this head. The change adds or drops no supplier, gap or headline, and the 22 gaps over 10 suppliers (ReductiveGroupsPartIII 7, ShimuraData 4) still match the README.
- Overlap check: for the changed passages, read ReductiveGroupsPartIII (Layer 5), ShimuraData (Layer 4) and the roadmaps that cite Deligne 2.3.10; the closest lists are unchanged since the previous round (FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII, AbelianSchemesAndArithmeticModuli). Nothing is shared. ShimuraData owns the reflex formula of the lifting through the gap, and §2.2 here owns the splitting.

Source independence: changed passages only. 3 passages were compared with 2 sources (KP and KPZ). Shared wording is limited to what the mathematics forces: the Hodge-type definition of h_T (KP line 3454, about 10 words) and "the primes of F above p split" (KP line 3452, 7 words). Largest share: KZ, 69 of 215 locators; the diff adds three KP locators and one KPZ locator. No layer is added, removed or reordered, so the comparison of contents with KZ stands: independent.

Research link: §7.6 is Kisin–Zhou's ℓ-independence of Frobenius classes on Shimura varieties (KZ Theorem 5.1.4, Annals 2025), the input to their abelian-variety theorem (KZ §6). §3.8 is Kisin–Pappas–Zhou's abelian-type integral models (KPZ Theorem 7.2.21, 2026), and §1.7 is the canonical-model theory of Pappas–Rapoport and DvHKZ. This rests on the README Summary and on KZ and KPZ.

## Not verifiable

- Deligne 1979, 2.3.10 and Corollaire 2.3.3, the construction behind gap:hodge-cover-refinement and its reflex field E^ad·E(K^×,h_T): not in the sources cache. Checked against KP lines 3439–3459 and KPZ lines 3394–3423.
- Noot 2009, Theorems 1.8 and 4.2, the content of gap:noot-coarse-comparison: not in the sources cache. This text is untouched and was checked against HT lines 1099–1103 in the previous round.

## Source issues

- **Gap** in KP at the proof of Lemma 4.6.22, p.206: the source says that T, chosen stable under the elements of one decomposition group at p that preserve I_c, makes every prime of E^ad above p split completely in E; it should choose T stable under every decomposition group at p, e.g. K=F·k with p split in k and T restricting to one embedding of k; affects the proof.
- **Gap** in KPZ at the proof of Proposition 7.2.10, p.79: the source says that the choice of T taken from KP Lemma 4.6.22 makes every prime v_2|p of E_2 split in E·E_2; it should use a T that is stable under every decomposition group at p, as above; affects the proof.
- **Error** in KPZ at §7.2.3, p.77: the source says that in type A_n the field K_S is a CM extension of F; it should exclude n=1, where the two end vertices coincide and K_S=F is totally real; affects nothing.

## For the human reviewers

- Two contracts ask ShimuraCompactifications Layer 7 for lattice-chain or bad-prime moduli: gap:siegel-chain-moduli here (`README.md:203`) and gap:bad-prime-projectivity in the PELModuliPartII README (line 367). ShimuraCompactifications' scope says it does not construct parahoric-level moduli interpretations.
- gap:component-specialization (`README.md:205`) also asks ShimuraCompactifications Layer 7, which covers PEL models at good primes; its §7.18 Check asserts nothing for general Hodge-type data. The route the gap cites is MP19 Theorem 1, the Hodge-type compactification.
- The design plan records gap:noot-coarse-comparison with supplier ArithmeticGaloisRepresentations Layer 6 and its earlier needs text, while `README.md:125` names ReductiveGroupsPartIII Layer 5. The plan also keeps the earlier needs texts of gap:hodge-cover-refinement (without the reflex-field conclusion) and gap:component-specialization.
- "Good integral Hodge embedding" (KPZ Definition 3.4.4) is stated both in FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1 and in GeometricSatakeAndFusionPartII §0.6. This README (`README.md:21` and `:99`) treats the two as one notion.
- KPZ was read from the open-access Cambridge publisher PDF, K17 from the author's page and MP19 from arXiv v6. KZ is cited in arXiv v2 pagination, not collated with Annals 202 (2025).
