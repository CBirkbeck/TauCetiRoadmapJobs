# Review of ArtinRepresentations (pull request #1711 at 67a9da9)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 67a9da9. Five P3 findings: the one carried from the previous report, two from the gate, two in the pull request's description.

## R01 (P3) — Name the supplier of the ramified local factors in the §8.2 route

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1795–1797`, “Consume the Deligne–Serre attachment of AutomorphicGaloisRepresentations §2.10, transport it through Layer 1's finite Galois factorization, and compare its full local factors with §3.4's Euler product.”

**Claim:** The §2.10 representation comes with local factors at every prime, including `p ∣ N`.

**Witness:** AutomorphicGaloisRepresentations §2.10 (open head, README line 1419) supplies only the good polynomial `X² − a_p X + ψ(p)` and unramifiedness outside `N`. For `η(z)η(23z)` the factor at 23 is `1 − X` (`a₂₃ = 1`); no target of §2.10 produces it.

**Repair:** Replace the sentence by: “Consume §2.10 of AutomorphicGaloisRepresentations for the good-prime polynomials and irreducibility; the factors at `p ∣ N` from ModularityAndLanglandsExtensions §1.2 (the all-place upgrade through GL2AutomorphicRepresentationsAndTransfer R17.5.5), read through §2.2's arithmetic convention; the newform's bad-prime coefficients from ModularForms Layer 4; transport through Layer 1's finite Galois factorization and compare with §3.4's Euler product.” All three are already in the section's `*Needs:*` line (README lines 1847–1850). On the instance this gives `1 − X` at 23 on both sides.

## R02 (P3) — `finiteLocalPolynomial` chooses its prime and its Frobenius (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/ArtinRepresentations/Suggested.lean:108–114`, `let I := h.choose.inertia (L ≃ₐ[F] L)` … `ρ h.choose_spec.choose_spec.2.choose * e`.

**Claim:** The definition is stated cleanly.

**Witness:** Gate rule `statement-hygiene`, line 110: “def `finiteLocalPolynomial` chooses its datum (`h.choose`)”. The value is independent of the pair `(Q, σ)`, so no choice is needed.

**Repair:** Define it by descent, as the common value over all pairs:

    (v : HeightOneSpectrum (𝓞 F)) : ℂ[X] :=
      ∑ᶠ p ∈ {p : ℂ[X] | ∃ (Q : Ideal (𝓞 L)) (_ : Q.IsPrime) (_ : Q.LiesOver v.asIdeal)
          (σ : L ≃ₐ[F] L), IsArithFrobAt (𝓞 F) σ Q ∧
            p = (LinearMap.charpoly (ρ σ * ((Nat.card (Q.inertia (L ≃ₐ[F] L)) : ℂ)⁻¹ •
              ∑ᶠ g : Q.inertia (L ≃ₐ[F] L), ρ g))).reverse}, p

Tested: a scratch copy with this body elaborates at the pins (`sorry` the only warning, same eleven). For the `S₃` representation of conductor 23 the set is `{1 − X}` at 23 and `{1 + X + X²}` at 2, so the value is unchanged. README lines 427–432 stay true as written.

## R03 (P3) — `finiteNPlus` chooses its place (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/ArtinRepresentations/Suggested.lean:137–141`, `ρ (TauCeti.NumberField.complexConjugationAt F h.choose h.choose_spec.choose)`.

**Claim:** The definition is stated cleanly.

**Witness:** Gate rule `statement-hygiene`, line 140: “def `finiteNPlus` chooses its datum (`h.choose_spec.choose`)”. The dimension is the same at every place above `v`.

**Repair:** Use the decomposition group, which also removes the case split:

    (ρ : Representation ℂ (L ≃ₐ[F] L) V) (v : InfinitePlace F) (_hv : v.IsReal) : ℕ :=
      ⨅ w : {w : InfinitePlace L // w.comap (algebraMap F L) = v},
        Module.finrank ℂ
          (Representation.invariants
            (ρ.comp (MulAction.stabilizer (L ≃ₐ[F] L) w.1).subtype))

and reword README lines 435–436 to “the dimension of the invariants of the stabilizer of a place above `v`: the +1-eigenspace of conjugation when the place is ramified, the full dimension otherwise”. Tested: the scratch copy elaborates with both repairs. Values: `χ₋₄` on `ℚ(i)/ℚ` gives 0, the trivial line 1, the `S₃` plane of conductor 23 gives 1 at each of the three places, a totally real `L` gives `dim V`: all as before.

## R04 (P3) — The description's sentence on transitive-group labels contradicts the head

**Location:** pull request description: “Its transitive-group labels in degrees 6–11 cite PolynomialGaloisGroups Layer 1D, from #763.”

**Claim:** The roadmap cites a supplier for container labels in degrees 6–11.

**Witness:** `TauCetiRoadmap/ArtinRepresentations/README.md:1639`: the `T`-number is PolynomialGaloisGroups' `TransitiveGroupLabel` “(its Layer 6, for degree at most 5) … no numerical label above degree 5 is supplied here”. PolynomialGaloisGroups is on main (completed); no Layer 1D is cited anywhere.

**Repair:** Replace the sentence by: “Container labels in degree at most 5 cite `TransitiveGroupLabel` of PolynomialGaloisGroups Layer 6 (on main); above degree 5 the roadmap states the transitive permutation group and no numerical label.”

## R05 (P3) — The description says local constants are only consumed

**Location:** pull request description: “conductors, local constants and the proved cases are consumed by name.”

**Claim:** No local constant is constructed in this roadmap.

**Witness:** `README.md:209–210`: “The characteristic-zero higher-rank existence theorem, Weil–Deligne extension and transfer are owned by §2.4 here”; §2.4 (line 800) constructs `ε(V, ψ, dx)`. The description's own summary block says the same.

**Repair:** Write: “conductors, scalar local constants, equal-characteristic local constants and the proved cases are consumed by name; the higher-rank local constants in characteristic zero are constructed in §2.4.”

## Previous findings

- R01 — not repaired: README lines 1795–1797 are unchanged, “Consume the Deligne–Serre attachment of AutomorphicGaloisRepresentations §2.10 … and compare its full local factors with §3.4's Euler product.” Written again as R01.

## Verified sound

| Statement | Instance | Values computed on each side | Result; change |
|---|---|---|---|
| `finiteLocalPolynomial` (R02), head body against repair | `S₃` plane of conductor 23 at `p = 23` | Head: any chosen `(Q, σ)` gives `ρ(σ)e` with eigenvalues 1, 0, reversed charpoly `1 − X`. Repair: value set `{1 − X}`, finite sum `1 − X`. | Equal; R02. |
| same, unramified prime | same representation at `p = 2` | Inertia trivial, `e = 1`; both Frobenius elements have order 3: `1 + X + X²`. Set is a singleton. | Equal; R02. |
| same, independence of the pair | `σ' = σι`, `ι ∈ I_Q`; `Q' = gQ` | `ρ(σι)e = ρ(σ)e`; `ρ(gσg⁻¹)e_{gQ} = ρ(g)ρ(σ)e_Q ρ(g)⁻¹`, same charpoly. | The set is always a singleton. |
| same, junk branch | no pair above `v` | Head `else 1`, repair `0`; unreachable by Tau Ceti `exists_isArithFrobAt` (`NumberField/Frobenius.lean:67`). | No effect. |
| `finiteNPlus` (R03), head body against repair | `χ₋₄` on `ℚ(i)/ℚ`; trivial line; `S₃` plane; totally real `L` | Head: eigenspace of `ρ(c)` at 1: 0; 1; 1; else-branch `dim V`. Repair: stabilizer invariants: 0; 1; 1; trivial stabilizer, `dim V`. | Equal; R03. |
| same, empty index | no place above `v` | `⨅` over the empty type would be 0; excluded by Mathlib `comap_surjective` (`InfinitePlace/Ramification.lean:86`). | No effect. |
| `weight_one_full_artin_comparison` route (R01) | `η(z)η(23z)` at 23 | Newform side `a₂₃ = 1`; Artin side `1 − X`; §2.10 alone supplies neither. | R01. |
| Description, “9 layers and 44 milestones” | heading count at the head | 9 `## Layer` headings; 44 numbered `###` sections. | Correct. |
| Description, degree 6–11 labels (R04) | `8t12` container of the tetrahedral example | README Check, line 1652: its numeral “is not furnished by the degree-at-most-5 supplier”. | R04. |

The rows of the untouched statements stand as in the previous review, of `67a9da9`.

- Gate at 67a9da9: FAIL, `statement-hygiene=2` (R02, R03); every other scanner 0, `build=0`, `outside-folder=0`, `stray-files=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ArtinRepresentations/Suggested.lean` at the pins: eleven `declaration uses sorry` warnings, nothing else. The scratch copy with the repairs of R02 and R03: the same eleven warnings, no `choose` left in the file.
- Library declarations opened: 4 (`arithFrobAt`, `Mathlib/RingTheory/Frobenius.lean:260`; `comap_surjective`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:86`; `complexConjugationAt`, `TauCeti/NumberTheory/NumberField/ComplexConjugation/Basic.lean:77`; `exists_isArithFrobAt`, `TauCeti/NumberTheory/NumberField/Frobenius.lean:67`).
- Cross-roadmap citations resolved: 2 (`TransitiveGroupLabel` in `Completed/PolynomialGaloisGroups/README.md:210` on main; the §8.2 `*Needs:*` line at README lines 1847–1850). The worker's 26 unresolved names are the same own, supplier and database names as before.
- Description read against the head: title, summary block and file list agree with the head except R04 and R05. Remark on a generated block, no change asked: `depends-on` lists four suppliers, while the README also consumes GL2AutomorphicRepresentationsAndTransfer, AutomorphicGaloisRepresentations and ModularityAndLanglandsExtensions.
- Source locators checked this round: 0 (no passage changed; the seeded sample falls in unchanged text).
- Overlap check: the scopes of the closest roadmaps (ArithmeticGaloisRepresentations, ZerosOfLFunctions, GL2AutomorphicRepresentationsAndTransfer, FiniteGroupInvariants, HilbertModularForms, NumberFieldArithmetic, LFunctions, InductionRestriction) were not read again this round, since the folder did not change; the overlap tool's result at the current heads was read (no other pull request changes this roadmap, no cited id dropped, no second copy, no roadmap close by results or headings).
- Source independence: changed passages only; 0 passages compared with 0 sources, none shared (the folder did not change); no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The items of the previous review stand: `neukirch1999`, `serrerep`, `serrelocal`, `tate1979`, `tate1984`, `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`, `frohlich1985`, `klein1884` are publisher-only or unresolved; none is touched by this round.
- The LMFDB column name `conductor_primes` (README line 1966) is not in the cached display code.

## Source issues

- none

## For the human reviewers

- Not tested: the publisher-only sources listed under “Not verifiable” (among them `neukirch1999`, `serrerep`, `tate1984`) were not read by any review round; wording and arrangement were not compared with them.
