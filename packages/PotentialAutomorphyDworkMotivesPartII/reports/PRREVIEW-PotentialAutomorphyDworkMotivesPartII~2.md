# Review of PotentialAutomorphyDworkMotivesPartII (pull request #2291 at d167976)

**Verdict:** needs changes

## R01 (P2) — The two new existence theorems are missing from the acceptance test

**Location:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` lines 1666 and 1681 (§§9.13–9.14); `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` line 24, “Not statable at the pins, for want of the carriers named”.
**Claim:** The repair adds two substantial general existence theorems but neither states them in `Suggested.lean` nor accounts for them in its docstring. Both are statable on native carriers at the pins.
**Witness:** Scratch signatures for both elaborate. Native carriers: Mathlib `WeierstrassCurve.IsElliptic` (`AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366`); Tau Ceti `WeierstrassCurve.frobeniusTrace` (`AlgebraicGeometry/EllipticCurve/PointCount.lean:101`) and `HeckeCharacter.infinityType` (`NumberTheory/NumberField/Global/HeckeCharacter/InfinityType.lean`).
**Repair:** Add sorried headline statements for both, importing `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount` and `TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Algebraic`. The tested conclusions are `∃ E : WeierstrassCurve (ZMod p), E.IsElliptic ∧ E.frobeniusTrace = b`, under `[Fact p.Prime]` and `b ^ 2 ≤ 4 * (p : ℤ)`; and `∃ χ : HeckeCharacter K, χ.infinityType = AlgebraicInfinityType.toContinuous (-a)`, under `[Field K] [NumberField K] [IsCMField K]`, `a : AlgebraicInfinityType K`, and `∀ σ, a σ + a (ComplexEmbedding.conjugate σ) = w`. Include their names and these hypotheses in the README and module docstring.

## R02 (P2) — The new prime-field existence target overlaps Waterhouse's classification

**Location:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` line 1666: “For every prime `p` and every integer `β` with `β² ≤ 4p` there is an elliptic curve”.
**Claim:** §9.13 independently owns the prime-field case of the classification already owned by the open AbelianVarietiesOverFiniteFields roadmap, without stating a division of ownership or a transfer to the earlier roadmap.
**Witness:** Pull request #1720, `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:893`, §4.6, states Waterhouse's list for every prime power. Its `q = 2` specialization gives exactly the same five traces `−2, −1, 0, 1, 2`.
**Repair:** Keep the needed prime-field theorem here, earlier in the merge order, and record in Scope: “§9.13 owns the prime-field case of Waterhouse's trace classification; AbelianVarietiesOverFiniteFields §4.6 consumes this case and owns the extension to non-prime finite fields.” Coordinate that citation in #1720 instead of retaining two proofs of the prime-field case. Do not introduce an upward supplier edge here.

## Previous findings

- R01 — repaired: §§5.11–5.12 and §9.4 now import the symplectic trivialization schemes and their geometric connectedness from ModularityAndLanglandsExtensions §2.14; the construction and monodromy proof retained here concern linear and unitary data.
- R02 — repaired: §§9.13–9.14 now own the elliptic-curve and Hecke-character existence inputs, and §§9.7–9.8 cite them. The two undeclared gap slugs are gone. The new targets introduce R01–R02 above.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Integral coefficients; §9.5 stable lattices | `N=401`, rank 3, `λ∣2`, `t=0` | Rational stalk modulo 2: 0; lattice modulo 2: `(O/2)³ ≠ 0`; `1−0⁴⁰¹=1`. | Correct distinction | Chosen lattice supplied by §F.4.5 |
| Complete-intersection contract; §2.2 | Smooth plane conic, `ℓ=2,3`, degrees 0–4 | Cohomology ranks `1,0,1,0,0`; `h=2[point]`; modulo 2: 0; modulo 3: a generator. | Holds | Degree range and integral generator corrected |
| §3.6 dependency on purity | Rank 3, `J=1+U`, `U³=0`, characteristic zero | `Jᴺ−1=NU+binom(N,2)U²`; its square is `N²U²≠0`; one Jordan block remains. | Holds | Semisimplicity input is §8.19 |
| §5.3 unitary proof inputs | `l=3`, `N=401`, rank 3 | `3²⁰⁰≡−1`; `σ²(ζ)=ζ`; `det=1`; fixed-field size `3²⁰⁰`, coefficient-field size `3⁴⁰⁰`. | Holds | Added linear-algebra dependencies resolve |
| §5.11 level structures | Rank 2 over `𝔽₁₁`; prescribed `η`, then `2η` | Pairing-preserving fibre: `11(121−1)=1320`; with `2η`: 0. Unrestricted isomorphisms: `(121−1)(121−11)=13200`. | Holds | Symplectic construction imported |
| §5.12 connectedness | Symplectic fibre over `𝔽₁₁` | Full `Sp₂` action: 1 orbit; on all `GL₂` isomorphisms: `13200/1320=10` orbits. | Holds | Connectedness imported; smoothness gives irreducibility |
| §7.13 added trace-formula dependency | Kummer convention, `q=7`, `N=3`, `x=3` | `3^((7−1)/3)=2`; trace `ρ(2)=ω`; inverse convention gives `ω²`. | Holds | §3.1 supplies the formula |
| §9.4 product and ownership | Two independent rank-two factors; empty family | Base dimensions: `1+1=2`, empty product 0; geometric component counts: `1·1=1`, empty product 1. | Holds | Supplier connectedness used factorwise |
| §9.5 general finite local constancy | Square-root permutation module over `ℚ₅` | At 1 and `1+5ℤ₅`, invariants dimension 2; at 2, swap matrix has invariants dimension 1. | Holds | Finite modules, not full rational stalks |
| §9.7 elliptic local inputs | `x³+x+1/𝔽₁₁`; `x³+x+4/𝔽₁₃` | Point counts 14,14; traces −2,0; discriminants 10,5; both lift with unit discriminant. | Holds | §9.13 supplies both reduction types |
| §9.8 character input | `m=3`, infinity pairs `(2,0),(1,1),(0,2)` | All pair sums 2; weight sum `0+1+2=3`; determinant exponent `−3`. | Holds | §9.14 replaces undeclared gap |
| §§9.11–9.12 rank-two input | Ordinary and supersingular curves over `𝔽₅` | `x³+3x+2`: 5 points, trace 1, `Δ=4`; `x³+1`: 6 points, trace 0, `Δ=3`. | Holds | Local models supplied by §9.13 |
| §9.13 existence, including small characteristics | All nonsingular Weierstrass equations over `𝔽₂,𝔽₃,𝔽₅,𝔽₇` | Actual trace sets: `[-2,2],[-3,3],[-4,4],[-5,5]∩ℤ`; each equals `{b:b²≤4p}`. | True; R01–R02 | Add acceptance statement; settle ownership |
| §9.13 Honda–Tate route | `(p,b)=(5,1),(2,0),(2,±2),(3,±3)` | Local degree/slopes: `(1;0,1)` or `(2;1/2)`; invariants all `0 mod ℤ`; index 1, dimension 1. | Holds | Named suppliers provide invariants and elliptic comparison |
| §9.14 prescribed pure type | `ℚ(i)`, exponents `(1,0)` | Pair sum 1; archimedean character `z⁻¹`; modulus `(1+i)³`; `(3+2i−1)/(1+i)³=−i`; conjugate values multiply to 13. | True; R01 | Native negative infinity-type signature elaborates |
| §9.14 negative controls | Trivial conductor; unequal pair sums over `ℚ(√2,i)` | First forces `Ψ(i)=1≠i`; second gives `φ₀(1+√2)=−(1+√2)`, of infinite order. | Both excluded | Conductor freedom and purity hypothesis necessary |

The adversarial rows for untouched statements stand as in the previous review of `1c99434`.

- Sources: 11 locators checked across 5 texts: QIAN23 lines 735–762; BCGNT25 lines 2359–2422, 3185–3205, 3255–3292; BLGHT11 lines 1018–1044; BLGGT14 lines 1951–1995, 4110–4131; WAT69 lines 619–682. Seeded changed targets: §§5.11 and 9.7.
- Pins: 8 declarations opened, including Mathlib `NumberTheory/NumberField/CMField.lean:373`, `AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366`, `Affine/Point.lean:477`; Tau Ceti `EllipticCurve/PointCount.lean:101,115`, `Global/HeckeCharacter/Basic.lean:70`, `Algebraic.lean:60`, `Purity.lean:98`.
- Suppliers: 9 affected supplier roadmaps resolved, including the three added contracts (§8.3, §R28.6.1, §R16.1.7), global lattices (§F.4.5), complete intersections (§4.3), and symplectic schemes (§2.14); no missing changed citation.
- Gate: all scanner checks pass; the worker's gate also reports `build=0 OK`. Targeted build passed with five `sorry` warnings and Lake's module-system notice; direct elaboration passed with only five `sorry` warnings.
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Signatures: fresh `#check @name` for all 10 declarations agrees with the README; no lost binders. Both new existence prototypes elaborate with only `sorry` warnings. The previous five-theorem padding probe remains applicable to the unchanged Lean file.
- Scope and PR text: 123 changed README lines; 0 Lean changes; 0 outside-folder paths. The description names §§9.13–9.14, their suppliers and the revised symplectic ownership; no contradictory sentence found.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, EllipticCurveModularityImaginaryQuadratic, PotentialModularityAndCompatibleSystems and PotentialAutomorphyInfrastructure; symplectic schemes and connectedness belong to ModularityAndLanglandsExtensions §2.14, Moret-Bailly to PotentialModularityAndCompatibleSystems, automorphic conclusions to the respective consumers, Dwork monodromy to this roadmap. Also read AbelianVarietiesOverFiniteFields §4.6: the prime-field existence overlap requires the downward ownership allocation in R02.

Source independence: changed passages only; 12 passages compared with 5 sources, no copied expression or reused material found; largest share QIAN23, 54 of 183 explicitly named source citations before References. No layer was added, removed or reordered; the previous independent-arrangement check stands.

## Not verifiable

- KIS99, Theorem 5.1: settled as uncertified; §9.5's finite-level argument was checked independently through the finite-étale and henselian suppliers.
- ZS76, ARTIN55, KATZ90, KM74 and LEWIS82 remain settled as uncertified; no changed passage requires reopening them.

## Source issues

- **Error** in BLGHT11 at §4, definition of `T_W` and Proposition 4.2(1), author p. 28: the source permits all linear trivializations and asserts connectedness; it should require preservation of the alternating pairings; affects a stated result; corrected in print at BLGGT14, proof of Theorem 3.1.2, arXiv v4 pp. 43–44.

## For the human reviewers

- **Scope.** `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` still lists `equivariant-toroidal-semistable-reduction`; the README instead consumes ModularityAndLanglandsExtensions §2.10 at line 1417.
- **Scope.** The plan's `curve-crystalline-companions` includes Kedlaya's full faithfulness; `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:127` cites §RD.5.8 separately and asks only for the companion at line 129.
- **Scope.** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:1` calls this Part II of PotentialAutomorphyInfrastructure; `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:17` also identifies itself as that parent's Part II.
- **Licence.** QIAN21 and ACAMPO24 remain cited as arXiv preprints only (`TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:1716,1735`); they support §8.1's attribution and one Check.
