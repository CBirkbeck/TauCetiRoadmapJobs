# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at 55f8bdd)

**Verdict:** needs changes

## R01 (P3) — The description still claims ownership of the imported formula

**Location:** Pull request description, prose after `roadmap-summary`: “Layers 2–3 here add … the squared-norm form of Kronecker's limit formula”.
**Claim:** This describes the deleted theorem as an addition, although the head imports both formulas and retains only their normalization dictionary and Checks.
**Witness:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:312` imports the formulas; supplier PR #2290, `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:352`, already states the factor-2 formula. The logarithms agree: `2(−6 log 3) = −12 log 3`.
**Repair:** Delete “the squared-norm form of Kronecker's limit formula,” from that list. Add: “Both Kronecker formulas are imported from NonordinaryCMSpecialValues §§2.2–2.3; §2.3 records the squared-norm dictionary and numerical Checks without rescaling the generators.”

## Previous findings

- R01 — repaired: README:23,122,312 imports both Kronecker formulas from NonordinaryCMSpecialValues §§2.2–2.3, removes the theorem and proof route, and identifies the supplier's explicit factor 2 with the squared-norm logarithm.
- R02 — repaired: README:846 requires “a height-one prime not containing `p`”; line 858 excludes the height-zero Gaussian case, where the inverse-image localization has dimension one.
- R03 — repaired: README:178 states “The normalization is `ℤ_2 × ℤ_2` integrally; the normalization map becomes an isomorphism only after inverting 2.”
- R04 — repaired: The `roadmap-summary` block attributes arithmetic cohomology, CM constructions and characteristic ideals to their roadmaps, and separately names native ray class fields and completed group algebras.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / wrong model | Result; change |
|---|---|---|---|---|
| §0.2 integral normalization | `ℤ₂[C₂] → ℤ₂²`, `a+bx ↦ (a+b,a−b)` | Image pairs have equal parity; cokernel `𝔽₂` | `(1,0)²−(1,0)=0`; `(1,0)` absent, `2(1,0)` present | Integral closure is the product; previous R03 repaired |
| §0.2 after inversion | Same map over `ℚ₂` | Inverse sends `(r,s)` to `(r+s)/2+(r−s)x/2` | `(1,0)` corresponds to `(1+x)/2` | Isomorphism after inverting 2 |
| §2.3 dictionary and supplier contract | `u=1,i,2+i` | `log(uū)=0,0,log 5` | `2 log abs(u)=0,0,log 5` | No change of unit or generator; previous R01 repaired |
| §2.3 seeded; description R01 | Gaussian modulus `(3)`, auxiliary `(5)`, trivial character | Theta logs `0.6619210722,5.9297526599`; inverse squared sum `−13.1833474640` | `24L′=−12 log 3=−13.1833474640`; ordinary sum `−6.5916737320` | Imported formula agrees; description needs correction |
| §2.3 retained quadratic Check | Same modulus, quadratic character | Weighted inverse squared logarithm `10.5356631754` | `24L′=8 log(2+√3)=10.5356631754` | Normalization preserved |
| §8.5 height-one descent | `R=O[[S,T]]`, `𝔭=(T)`, `q=(S,T)`, `A=R_q`, `M₁=M₂=A/(T)` | Dimensions `2→1`; quotient lengths `1,1`; S-torsion lengths `0,0` | Length formula `1−0=1−0` | Added hypothesis gives the required dimension |
| §8.5 new negative Check | Contained Gaussian case; `𝔭=(0)`, inverse-image `q=(S)` | `dim R_q=1`; cyclotomic fraction field dimension `0` | Height-one condition fails; claimed two-dimensional setting does not apply | Previous R02 repaired; §7.8 covers this case |

Rows for untouched statements stand as in the previous review of `227dc5d`.

- Sources: 3 cached texts; 11 affected/supporting locators checked, including seeded §2.3, Kato (15.5.1), (15.6.5), §§15.13–15.15, Proposition 15.17 and Lemma 14.15; JLK Lemmas 7.2, 7.6 and Proposition 3.3(4); BT Theorem 2.6.
- Pins: 6 declarations opened: `Mathlib/RingTheory/Length.lean:31`, `Mathlib/RingTheory/Ideal/Height.lean:36`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123,209`, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`.
- Supplier repair: 2 formula sections resolved at NonordinaryCMSpecialValues §§2.2–2.3; dependent §§2.4–2.5, 4.3, 7.5–7.8 and 8.6 retain compatible conventions and hypotheses.
- Dependency output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE; 0 changes outside the folder.
- Gate: worker gate and independent rerun pass; targeted build succeeds; direct `lake env lean` exits 0 without warnings. There are 0 declarations to inspect with `#check` or one-tactic probes.
- Change scope: 19 README lines, 0 Lean changes, 0 removed headings; 4 previous findings repaired; PR title, description and `roadmap-summary` checked against the head.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures and CMRankZeroConverse. Owners: modular zeta morphism—KatoEulerSystems; Kronecker formulas and CM constructions—NonordinaryCMSpecialValues; automorphic reverse bounds—AutomorphicCongruences; KMC formulation—ModularIwasawaMainConjectures; p-converse—CMRankZeroConverse; identified elliptic generator and CM equality descent—this roadmap. The closest-on-main and result/heading lists are empty; no competing head or dropped cited id is reported.

Source independence: changed passages only; 5 replacement/additional passages compared with 3 sources, with no copied expression or reused source material identified. Largest share: Kato, 39 of 107 explicit author-led locator mentions. No layer was added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- Carried forward: the dyadic compact-support comparison in §4.2 uses Itakura §3.1 via JLK line 432; the previous review's sources-service search found no legal copy of the cited preprint. This repair does not change that input.

## Source issues

- **Error** in Kato at (15.5.1), printed p. 253, and (15.6.5), printed p. 255: the source says the ordinary logarithm equals the L-derivative expression; it should be twice that logarithm, equivalently the squared-norm logarithm; affects a stated result.
- **Error** in JLK at Proposition 3.3(4), printed pp. 14–15: the source says the ordinary logarithm equals the derivative times the smoothing factor; it should be twice that logarithm, as the Gaussian calculation confirms; affects a stated result.
- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265, Kato line 5769: the source says to apply Lemma 14.12; it should be Lemma 14.15, the codimension-two length identity; affects the proof.

## For the human reviewers

- JLK line 394 chooses the ordinary Beilinson regulator; `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:393` replaces it by the Dirichlet regulator while retaining comparison (8). The previous scalar calculation stands; the dyadic integral comparison through the unavailable Itakura preprint remains unverified.
