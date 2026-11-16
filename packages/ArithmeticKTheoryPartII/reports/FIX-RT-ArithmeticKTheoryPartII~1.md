# FIX-RT-ArithmeticKTheoryPartII~1: repair of red-team round 1 (passes a and b)

Ten findings, settled in eight sections (two overlaps merged). All ten hold on the mathematics; none is disputed, none is outside this package.

## RT-ArithmeticKTheoryPartII~1a/F01 (P2) — applied

"No Bockstein on singular homology is supplied" → the homology Bockstein is Mathlib's `δ` applied to Tau Ceti's `map_simplicialChains`, natural by `δ_naturality`. `gap:pontryagin-bockstein-cap` (README and `plan.json`) now asks only for the Künneth Tor identification. §8.1 Needs drops the contract. The docstring bullet now names the H-space product and the Künneth identification as missing.

Evidence: `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean` line 36; Mathlib `HomologySequence.lean` (`δ`) and `HomologySequenceLemmas.lean` line 56.

## RT-ArithmeticKTheoryPartII~1a/F02, RT-ArithmeticKTheoryPartII~1b/F01 (P2) — applied

§8.5 route "prove the stable rational symplectic comparison" → apply ArithmeticKTheory §3.4's borelInvariantFormComparison at (Sp_(2g),U(g),Sp_(2g)(ℤ)) and compute the compact-dual invariant forms (borel1974 lines 1154, 1249). The Scope section, the ArithmeticKTheory contract, §8.5 Needs and Layer 8 Dependencies cite §3.4. New Check: in degree 2 the comparison holds only from g=9.

Evidence: ArithmeticKTheory §3.4, at its open head, is bijective for 4q<rk_ℚ and has a block-inclusion law; Sp_(2g) has ℚ-rank g.

## RT-ArithmeticKTheoryPartII~1a/F03, RT-ArithmeticKTheoryPartII~1b/F04 (P2) — applied

Four gap sentences that named this roadmap's objects are restated on the supplier's own carriers, identically in `plan.json`:
- `relative-homology-edges`: general relative chains, absolute Hochschild–Serre, and relative Hochschild–Serre when HN=G, with its H₁ edge isomorphism.
- `ppav-embedding-atlases`: per-g embedding atlases over 𝔄_g⊗ℚ.
- `graded-moore-realization`: Γ-coherent graded realization with the Moore variant.

Evidence: b's pair (G,G_𝔭) with N=ker(G→G_q) has HN≠G. FGV lines 2096–2105 use the cyclotomic kernel, for which HN=G.

## RT-ArithmeticKTheoryPartII~1a/F04 (P3) — applied

The Chebotarev-contract sentence on the auxiliary prime → a "From Mathlib" paragraph citing `Nat.infinite_setOfPred_prime_and_eq_mod` (`PrimesInAP.lean` line 431) and `ZMod.isCyclic_units_of_prime_pow` (`UnitsCyclic.lean` line 206). §7.6 Needs and Layer 7 Dependencies replace "Chebotarev Layer 10" by these declarations; Chebotarev now serves §2.3 only.

## RT-ArithmeticKTheoryPartII~1a/F05 (P3) — applied

"Qᶦⁿᵗ_i(BSp∞(ℤ))" → "Qᶦⁿᵗ_i(BSp∞(ℤ)⁺)", with three added facts: the plus map is a homology isomorphism, the product comes from block sum, and the space is a finite-type H-space. The Hodge pairing names the same space, StableHomotopyKTheory §4.18 joins Needs, and a new Check records [[2,1],[1,1]]≠[[1,1],[1,2]] in SL₂(ℤ). Suggested.lean names no such space.

## RT-ArithmeticKTheoryPartII~1b/F02 (P2) — applied differently

The finding holds. The suggested route left the connectivity unquantified and cited an unreadable Charney step. Instead, §8.4 now gives a route through the poset HU(ℤ^(2g)): ℤ has unitary stable rank 2, so HU is ⌊(g−6)/2⌋-connected. The stabilizers are Sp_(2(g−k))(ℤ) by §1.1. The route gives an isomorphism for g≥2i+6, which is the README's range. Two Checks were added.

Evidence: `mirzaiiVanDerKallen2002` (arXiv, fetched and read), Theorem 3.4 (line 254) and Theorem 4.1 (line 293). `charney1987` gains "§4".

## RT-ArithmeticKTheoryPartII~1b/F03 (P2) — applied

The docstring's Vandiver "not statable" bullet is deleted. Added under Layer 7: `pHilbertClassField`, a fixed-field definition, and `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber`. σ-stability is written `P.map (RingOfIntegers.mapRingEquiv σ) = P`, replacing the review's unelaborated ∀∃ form. README §7.7 states both, with laws and six Checks, and the Conventions identify H_q with the new field.

Evidence (proof): the primes above p form a torsor under A; |A| is odd; the fixed primes form a torsor under A⁺; and A⁺≅Cl(K⁺)_p.

## RT-ArithmeticKTheoryPartII~1b/F05 (P3) — applied

"Layer 13 supplies `hilbertClassField`, …" → these are pinned Tau Ceti declarations (listed under From Tau Ceti); Layers 11 and 13 supply their Frobenius normalization and the splitting criteria. `gap:cyclotomic-p-class-fields` drops the construction clause and states the tower embedding and the split-at-S fixed field. The same pattern is fixed in Scope line 15, in §2.3 Needs and in the Layer 2 Dependencies.

Evidence: `RayClassField.lean` lines 241, 246, 262, 293, 306.

## Checks run

- **Elaboration.** `lake env lean packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, ended with exactly three warnings, all "declaration uses `sorry`", for the three theorems (lines 57, 100, 131). No errors. The import `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` was already built.
- **Elaborated signatures.** I put `#check @name` for all six declarations in one scratch file and elaborated it once. The four existing types are unchanged. `pHilbertClassField : ℕ → (K : Type) → [Field K] → [NumberField K] → IntermediateField K ↥(hilbertClassField K)`. The new theorem keeps `hp`, `hodd`, `hn`, the cyclotomic and CM instances, σ, `hσ` and `hK`, as in the README. No binder was lost.
- **Library names.** `#check` confirmed every new Mathlib and Tau Ceti name cited in the README except `map_simplicialChains`. That one I read in source: its module is not built at the pin and is not imported by Suggested.lean.
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2247 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Citation resolver.** Cross-roadmap citations found nowhere: none. Lean names found nowhere: none. (The resolver did not check library names on this host; I checked them as above.)
- **Gap parity.** All 14 gap slugs have identical README and `plan.json` sentences (checked by script). Five sentences changed. The rest of `plan.json` is unchanged (JSON-compared).
- **Gate failures.** None were listed for this round.

## Adversarial pass

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Homology β_r = δ of `map_simplicialChains` | lens space L(p), r=1; RP², p=2 | H₂(L;ℤ/p)=ℤ/p→H₁=ℤ/p onto, the kernel of ×p; δ lowers degree (m+1=n) | holds | a/F01 |
| Bockstein–Künneth gap | K(ℤ/p²,1)×K(ℤ/p,1); r=s=1 | d=1, β₁(x)=pu exists since pu has order p; Tor₁=ℤ/p; r=s=1 gives Tor₁=ℤ/p in degree 3 | holds | x,y quantified |
| Relative HS edge, HN=G | (G_q,D_q,N=Gal(H_q/K_q)); (G,G_𝔭,G⁰); (C₂,1,N=C₂), sign ℤ/5; H=G | N∩H=1, HN=G; G_𝔭→(ℤ/q)× onto; H₁(C₂,1;ℤ/5)=ℤ/5=M by the LES; H(G,G)=0 | holds; HN=G is needed (a ⟨c⟩-pair with q=5 has HN≠G) | gap restated |
| ppav atlas gap | g=0; g=1 | P⁰ with the trivial bundle; Δ*(1×λ)*𝒫 has degree 2 on E, cube degree 6, very ample | holds | restated |
| Moore realization gap | ∐_ℕ Spec ℚ graded by ℕ | Et^gr is discrete ℕ (EtaleHomotopyTypes §6.6 Check) | consistent | restated |
| Split-at-S gap | F=K_q, S={(1−ζ_q)}; F=ℚ(√−5), S={(2,1+√−5)} | trivial Artin image gives all of H; nontrivial image gives F (the prime is inert in F(i)) | holds | restated |
| Auxiliary prime | p=3, ℓ=2, 11, 19; p=5, ℓ=2 | ord₉2=6 and 11≡2; 19≡1 mod 9, not a generator; ord₂₅2=20 | holds; matches the §7.6 Checks | a/F04 |
| Borel at Sp_(2g) | q=0,1,2 | g≥1: ℝ=ℝ; g≥5: H¹=0 on both sides (compact dual simply connected); g≥9: ℝ·x₂; g=8 is excluded since 8≮8 | holds | a/F02 |
| Compact-dual series | degrees ≤ 2g+1 | ∏(1+t^{2i}) = ∏ 1/(1−t^{4k−2}) (Euler), generators in degrees 2, 6, 10 | consistent with borel1974 line 1249 | none |
| Stability route | g=6,10; k=1 with g=1,2; usr≤3 | ⌊0/2⌋=0, ⌊4/2⌋=2; stabilizers Sp₀ (trivial) and Sp₂; bijective from g=2i+6 (i=0: 6; i=2: 10), versus 2i+7 if usr=3; (2e₁,f₁) has Gram determinant 4 | matches g>2i+5 and the §8.4 Checks | b/F02 |
| ESp transitivity on ℤ^(2n) | v=(2,3,0,0) | SL₂ moves in plane 1 give (1,0,0,0) | holds; T_n for all n | none |
| BSp∞(ℤ)⁺ as H-space | SL₂(ℤ) witness | [[2,1],[1,1]] ≠ [[1,1],[1,2]] | without plus, false | a/F05 |
| `pHilbertClassField` | ℚ(ζ₃),p=3; ℚ(√−26),p=2,3; ℚ(ζ₂₃),p=3,23; p=0,1 | degrees 1; 2 and 3 (the p-power model gives 3 and 2); 3 and 1; H and K | determines its object | new Checks |
| Its law "contains p-power subextensions" | abelian G, U of p-power index | prime-to-p elements die in G/U, so lie in U | holds | none |
| Vandiver headline | q=3; q=37; plus torsor ℤ/3 with a non-involutive lift; p=2 | 1 prime, 3∤1; 37 primes, 1 fixed, 37∤h⁺=1; x↦x+1 fixes 0 points; p=2 breaks the parity step | true; hσ and hodd are needed | b/F03 |
| A⁺≅Cl(K⁺)_p | odd p | N∘i=2 on Cl(K⁺), i∘N=1+c=2 on A⁺, both invertible | holds | none |
| Vacuity / context | new theorem | σ, P and p are tied to K by hK and P∋p; every binder is in the signature | non-vacuous | none |

## Ownership and sources

- **Ownership.** By object (p-Hilbert class field, symplectic homological stability, the Borel comparison), I searched main, the open roadmap heads (`roadmaps grep`, 447 heads) and the board packages. The Borel comparison is owned by ArithmeticKTheory §3.4 and is now consumed. No roadmap declares a p-Hilbert class field carrier: CyclotomicClassGroupsAndStickelberger §7.2 and IntegralIwasawaTheory §2.3 use H_n in prose only, so this roadmap owns the one-line specialization needed for its headline. No roadmap owns symplectic stability over ℤ; HomologicalStabilityOfGeneralLinearGroups covers GL only.
- **Sources.** New key `mirzaiiVanDerKallen2002`, fetched by the sources service from arXiv (open-repository, certified); `sources.toml` records authors, title, year, locators and a version note for v1. `charney1987` stays uncertified; its locator gained "Section 4". Nothing is missing, so no `needs-references.toml` was written.

## For the maintainer

- **New Lean names** in this package: `TauCetiRoadmap.ArithmeticKTheoryPartII.pHilbertClassField` and `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber`. Suggested.lean now also imports `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField`. No name was renamed or removed.
- **Changed supplier contracts.** The five gap sentences now ask suppliers for precisely stated, general objects:
  - AlgebraicTopology Stage 6: the Bockstein–Künneth identification only.
  - ArithmeticGaloisDuality R02.2: relative and absolute homological Hochschild–Serre.
  - PELModuli §§M2.4, M6.3: embedding atlases.
  - EtaleHomotopyTypes Layers 5–6: Γ-coherent graded realization.
  - ClassFieldTheory Layers 11–13: tower embeddings and the split-at-S fixed field.
- **No supplier was added.** ArithmeticKTheory was already one (§3.4 is now cited explicitly).
