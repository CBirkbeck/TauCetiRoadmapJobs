# Review of GlobalGaloisDeformationsPartII (pull request #1837 at 222567a)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since df03de2 (the head merges main; the outside-folder diff against main is empty). This round read the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "The two uniform finite-coefficient torsion theorems of §4.4 … are the headlines statable at the pins, and both are stated in `Suggested.lean`: the degree-one form, and the form in every degree, degree zero included".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `uniformTorsion` (description: "every degree, degree zero included, for lattices on which no open subgroup fixes a nonzero vector"; `Suggested.lean:147`, `n : ℕ`) | G trivial, V=O; G trivial, V=0; G=ker(SL₂(ℤ_p)→SL₂(𝔽_p)), V=ℤ_p² | V=O: `hfix` fails at U=⊤, and H⁰=O/ϖʳ needs e·a≥r, unbounded; V=0: all groups 0, a=0; congruence case: H⁰(V/pʳ)=pʳ⁻¹V/pʳV, killed by p¹ for every r | degree zero holds only with the hypothesis, as the description and `README.md:907` say | none |
| `uniformTorsion_H1` (description: "the degree-one form"; `Suggested.lean:128`) | G trivial; G=ℤ_p acting trivially on O | trivial G: H¹=0, a=0; G=ℤ_p: H¹=Hom(ℤ_p,O/ϖʳ)=O/ϖʳ, needs e·a≥r, unbounded, and its Lie algebra ℚ_p is abelian, so `IsSemisimple` excludes it | holds; FKP19 line 2846–2847 gives i=1 without the invariants hypothesis | none |
| §2.9 Checks (description: "the refuting example recorded as a Check") | `README.md:740–745`, M*=𝔽_p(κ̄)³, two basis lines, two new primes | (η₁ʷ−η₂ʷ)(τ_w)=1−1=0; relation coefficients (1,−1,−1,1), sum 0; inertia orbit rank 1 in a rank-2 product | the Check is at the head and refutes FKP22 Lemma 3.7 (line 666) in its stated scope | none |
| §8.5 (description: "at every weight and at Serre weight with prime-to-p level") | `README.md:1366`; FKP22 lines 116, 1601; p=3 with χ̄ trivial on Γ_ℚp | every r≥2 at some level; r=k(ρ̄) at level prime to p; at p=3 the ratio 1 differs from ω, of order 2 | description agrees with the head and the source | none |
| §10.1 and §10.3 (description: "two Steinberg places … strictly pure compatible system") | `README.md:1565`, `:1595`; coefficient characteristic ℓ equal to one of the two residue characteristics | v₀, v₁ of distinct residue characteristics; at every ℓ at least 2−1=1 place has residue characteristic ≠ℓ | description agrees with the head | none |

The rows for untouched statements stand as in the previous review, of `df03de2`.

- The pull request's text against the head, sentence by sentence: title (a new roadmap; the folder is not on main: 1811 insertions, 0 deletions, three files); summary block (global fields of characteristic ≠p, smooth affine G with split reductive G⁰ and prime-to-p components, fixed multiplier, `README.md:25–27`; G/Gᵈᵉʳ possibly disconnected and bounds depending only on the root datum, `:27`; no representability assumed, `:7`); prose (base roadmap's stopping point, `:7`; §3.2 hypothesis and its exemption for §6.6 and §§10.1–10.3, `:3`; Layers 7–10, `:1190`, `:1366`, `:1443`, `:1456`, `:1478`, `:1565`, `:1595`; two Lean headlines; the Lean imports no roadmap). No sentence is contradicted; no section, declaration or supplier is removed by the change.
- Gate, rerun at 222567a: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run also has `build=0`.
- Dependency check, complete output: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean`, exit 0; the only messages are `declaration uses sorry` at 128:8 and 147:8. The file is unchanged since df03de2, so the signatures and one-tactic probes stand.
- Source locators checked against the text: 4 (FKP19 Lemma B.1, p.64, lines 2838–2847; FKP22 Theorem 7.4, p.35, line 1601, and Theorem B, line 116; FKP22 Lemma 3.7, p.15, line 666; FKP22 Proposition 9.1, p.41, line 1864). The fifteen seeded targets lie in untouched text; the README flags no locator as unverified.
- Cross-roadmap citations resolved again: 5. PotentialAutomorphyInfrastructurePartII §§7.3, 7.4, 7.14 exist at its open head (`README.md:1411`, `:1425`, `:1572`); ModularityAndLanglandsExtensions §§2.28, 2.48 exist at its open head (`:1263`, `:1558`); IntegralHeckeAndGaloisDeterminants "Classical Ribet lattice" is on main (`:2584`). The Lean names `ModPow`, `modPowSub`, `modPowRep`, `modPowCont`, `uniformTorsion_H1`, `uniformTorsion` occur in no other roadmap, open or on main.
- Remark (no change asked): `README.md:264` cites PotentialAutomorphyInfrastructurePartII §8.17; at that roadmap's open head the id is kept by its table "Design identifier (earlier numbering)", `README.md:105`, which sends §8.17 to ModularityAndLanglandsExtensions §4.2 (`:2438` there: CM field, ℓ>3, ℓ∤n, the same constituent, Steinberg, seed, cyclotomic and primitivity conditions). The citation resolves through that mapping, and the new owner is earlier in the merge order.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, IntegralHeckeAndGaloisDeterminants; nothing shared (ANT lifting: ModularityAndLanglandsExtensions §4.2, consumed here; the Ribet lattice: IntegralHeckeAndGaloisDeterminants §1.4, consumed here). The overlaps tool lists no pull request changing this roadmap, no dropped id and no id only an open revision defines. The scopes of PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLiftingPartII, GL2ModularityLifting, PotentialAutomorphyInfrastructure and SmoothRepresentationsOfLocalGroups were not read again: the folder adds no object since df03de2.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages were compared; largest share FKP22, 95 of 181 source mentions, as counted at df03de2; no layer is added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Gur99 Theorem A; NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9; BC14 Lemma 10, Propositions 11 and 32, Definitions 29–30: settled as uncertified, cited by locator only, not read.
- The description's sentence on AI assistance (the number of review and red-team rounds) is a record of process that the head neither supports nor contradicts.

## Source issues

- none

## For the human reviewers

- none
