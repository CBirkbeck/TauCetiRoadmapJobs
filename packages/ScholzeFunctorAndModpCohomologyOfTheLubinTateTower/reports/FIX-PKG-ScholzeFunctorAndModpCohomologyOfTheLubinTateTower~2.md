# Repair report: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, package round 2

There was one review with five findings. Each is settled below.

## F01 (P2) — applied

Verified: SCH18 line 871 (Proposition 4.6) and line 892 (Proposition 4.7) both assume V admissible. The proof (lines 884–890) uses finiteness of the compact-open invariants. The reviewer's witness is correct: a continuous action of a compact group on a discrete set has finite orbits.

§1.6 changes. The old text said "the continuous discrete W_F-action extends uniquely to Gal_F" for every smooth π. It now says: the continuous W_F×Dˣ-action holds for every smooth π, and the extension to Gal_F holds for admissible π, with the necessity argument stated. The S⁰ computation is now scoped to admissible π, as in Proposition 4.7. The twist isomorphism is W_F×Dˣ-equivariant for smooth π and Gal_F×Dˣ-equivariant for admissible π. The route now reduces to 𝔪ʲ-torsion and uses the finiteness from §1.5. Two Checks were added: the negative control k[t,t⁻¹] and the positive control k[t,t⁻¹]/(tᵐ−1).

Pattern search for other Galois actions:
- §1.2, §2.3 and the ClassFieldTheory contract use only Weil actions. They are unchanged.
- §6.2 and §6.4 put Gal_K on the cohomology of the tower, not on Sⁱ(π). They are unchanged.

## F02 (P1) — applied

Verified: ClassicalAdicEtaleCohomology §1.4 (the head of its open roadmap pull request) covers locally constant sheaves and twists. It has no trace.

The algebraic side is on main:
- EtaleCohomologyFoundations §0.9 gives cycle classes and the projective bundle formula with degree-one normalisation.
- EtaleCohomologyFoundations §0.11 gives the smooth trace, whose ℙ¹ trace sends c₁(O(1)) to 1.

ClassicalAdicEtaleCohomology §8.2 gives the proper algebraic comparison (Huber 3.7.2) for any torsion Λ, so p-torsion over C is allowed.

Changes:
- A new supplier subsection "From TauCetiRoadmap.EtaleCohomologyFoundations" was added.
- A §8.2 sentence was added to the ClassicalAdicEtaleCohomology contract.
- The trace citation in the §1.6 Needs line was replaced.
- Pattern repairs: the trace inputs were added to the §1.2 Needs line, and the Conventions trace Check was extended.

## F03 (P2) — applied

Verified at the pin:
- `ContRepresentation.coindV` is at `Mathlib/RepresentationTheory/Continuous/Basic.lean:533`, with the condition f(φ g * h) = π g (f h).
- `ContRepresentation.coind` is at line 550, acting by right translation.
- `QuotientGroup.rightRel J` relates x and y exactly when y·x⁻¹ ∈ J, so its classes are the cosets Jx. This matches f(jh) = j f(h).

`continuousCohomology_coind_iso` was added to `Suggested.lean`. Its binders are R and H; a closed J; X with a jointly continuous action; a continuous section s; and i. The conclusion is `Nonempty (continuousCohomology i (TopRep.of (X.ρ.coind …)) ≅ continuousCohomology i X)`.

README changes:
- §2.1 now imports the induction from Mathlib instead of constructing it, and names the theorem.
- A Mathlib contract row was added, and the scope and Needs lines were updated.
- The C₂ Check now also says that positive degrees are zero.
- The docstring now names §1.3 (strict images) as not statable at the pins.

## F04 (P1) — applied

Verified: EndoscopicTransferAndUnitaryTraceComparison §12.19 covers only the rank-two **Drinfeld** quotient. §12.7 gives the Weil cocycle and §12.14 the quotient; neither gives descent of the finite Lubin–Tate level. CDN23 line 2021 defines the Lubin–Tate quotient LT⁽ᵖ⁾ separately.

A new supplier gap was declared, `gap:lubin-tate-arithmetic-descent`, assigned to EndoscopicTransferAndUnitaryTraceComparison §12.19:
- It is in the plan's top-level `gaps` list, with a one-sentence `needs`.
- It has a `What EndoscopicTransferAndUnitaryTraceComparison must provide` line in the README.
- That line keeps both height classes and says that the n=0 fibre is two open discs, not two copies of Ω_F.

The text of §6.4 and its Needs line now cite the gap. The scope paragraph and the supplier paragraph now say that §12.19 covers the Drinfeld tower only.

## F05 (P3) — applied

Locators, as verified in the source texts:
- LUD17: line 1099 is Lemma 3.22 and line 1159 is Proposition 3.23.
- FUST22: Lemma 6.2 is at line 478, under the printed header 290 at line 454. Printed p. 295 begins at line 682.
- PadicLocalLanglandsForGL2Qp §2.7 (its README line 854) is the classification.

Changes:
- README §3.1 and the LUD17 `locator` in `sources.toml` now read "Propositions 3.15, 3.17 and 3.23 and Lemma 3.22".
- In §0.3, FUST22 p. 291 became p. 290; in §2.1, pp. 291–295 became pp. 290–295.
- Every PadicLocalLanglandsForGL2Qp citation of §§2.1–2.6 became §§2.1–2.7. There were five: the supplier contract and the Needs lines of §§2.1, 2.5, 5.3 and 5.4.
- No new manifest key was added.

## Checks

- **Elaboration.** `lake env lean packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean`, run from the content checkout, exited with status 0. It printed three `declaration uses 'sorry'` warnings, at lines 64, 91 and 110. No TauCeti object build was needed.
- **Binder check.** `#check @name` was run on all four declarations in one scratch file. Every elaborated type keeps its binders:
  - `continuousCohomology_coind_iso` keeps `IsTopologicalRing R`, `T2Space H`, `LocallyCompactSpace H`, `TotallyDisconnectedSpace H`, `IsClosed ↑J`, the joint-continuity hypothesis, the continuous section and the right-inverse property.
  - The other three declarations are unchanged from `signatures.md`.
- **Depcheck output.**

```text
depcheck: 56 roadmaps, 656 edges, 0 problem(s)
```

  There are no UPWARD, CYCLE or moved lines. In the merge order, EtaleCohomologyFoundations is at line 18, ClassicalAdicEtaleCohomology at line 61, EndoscopicTransferAndUnitaryTraceComparison at line 161, and this roadmap at line 309.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citations and no Lean names that are found nowhere.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.6 Galois extension, admissible π | r=1, π=k[t,t⁻¹], ϖ↦t, units trivial | Φ_geo acts by t⁻¹; orbit of 1 is {tⁿ}, infinite; O_Fˣ-invariants = π, infinite-dimensional | Not admissible, and no extension exists: kept as a negative-control Check |
| same | π=k[t]/(tᵐ−1), m=1,2 | dim π = m; orbit sizes ≤ m (1 and 2); the action factors through ℤ/m | Extension exists: positive-control Check |
| §1.6 S⁰ formula (admissible) | r=1, δ(2)=2 in 𝔽₅ | Dˣ scalar 2; Galois scalar 3 | Unchanged convention values |
| §1.6 twist, W_F vs Gal_F | δ∘det, r=2 | S¹=0, S² is free of rank 1; δ∘det is one-dimensional, hence admissible, so the Gal_F form applies | Consistent |
| Trace (§§0.9, 0.11 with §8.2) | p=2 and 3, degree-1 and degree-2 divisors | Traces 1 and 2; in 𝔽₂ these are 1 and 0; in 𝔽₃, 1 and 2 | n=pᵃ is invertible on ℙ¹ over C of characteristic zero; no prime excluded |
| `continuousCohomology_coind_iso` | J=H | Ind ≅ V by evaluation at 1; both sides equal | True |
| same | H=C₂ (discrete), J=1, V=𝔽₂ | Ind has dimension 2; H⁰ has dimension 1 on both sides; Hⁱ, i>0, is 0 on both sides (coinduced from 1) | True |
| same | H=S₃, J=1, trivial coefficients | Ind has dimension 6; H⁰ has dimension 1 = dim V | True |
| same | Coset direction | rightRel: x~y ⇔ yx⁻¹∈J; classes are Jx; coindV is f(jh)=j f(h), so it is determined on J∖H | The section has the right domain |
| gap:lubin-tate-arithmetic-descent | n=0, F=ℚ_p | Nrd(ϖ)=ϖ² shifts height by 2, leaving height classes {0,1}; geometric pieces are open discs | Stated in the README contract line |
| PadicLocalLanglandsForGL2Qp §2.7 | Section list on the open head | §2.6 is principal series/Steinberg; §2.7 is the classification | Range extended |

## Maintainer notes

- **New name in `Suggested.lean`:** `TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.continuousCohomology_coind_iso`. No existing name changed.
- **New supplier gap:** `lubin-tate-arithmetic-descent`, owned by EndoscopicTransferAndUnitaryTraceComparison §12.19. That roadmap is asked for the Lubin–Tate counterpart of its Drinfeld arithmetic descent.
- **New supplier edge:** EtaleCohomologyFoundations §§0.9 and 0.11 (on main).
- **Ownership:** the noncompact Shapiro theorem stays owned here (§2.1). Its carrier is imported from Mathlib, not planned. No notion moved down from a later roadmap.
- **Sources:** no new sources were fetched. BW00 remains uncertified and is cited by its locator. `needs-references.toml` was not created.
- **Untrusted text:** nothing in the review was suspicious.
