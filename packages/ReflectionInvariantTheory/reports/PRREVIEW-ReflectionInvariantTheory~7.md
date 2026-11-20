# Review of ReflectionInvariantTheory (pull request #2539 at e113278)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the last review of `e113278`; this round read the pull request's description against the head and against the change from main. The earlier small correction is repaired: the description now says that the two old heading anchors are kept before Layers 2 and 4. Two small corrections to the description, neither blocking: its list of roadmaps on main that cite this one by section omits OrthogonalTamagawaAndLatticeMass, and two items it lists among the Checks stand under Examples. No format notes; the human reviewers have the same two facts to note as before.

## C01 — The description's list of roadmaps on main that cite §1–§4 omits OrthogonalTamagawaAndLatticeMass

A maintainer who uses the list to confirm that every inbound section citation survives the rewrite would not look at that roadmap. Under "What changes in form" the description says: "roadmaps on main cite this roadmap as §1–§4: CharacteristicClasses, K3SurfacesAndSymplecticBoundedness, LieHighestWeight, McKaySkewGroup, ReductiveGroups, RootSystems and SchubertGeometry."

On main, `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 528 cites "the invariant-degree identity |W| = ∏dᵢ of ReflectionInvariantTheory §3 and the degree table of its §4". Both land where they did: the identity is §3.6 (`README.md` line 571) and the table is in the Examples of Layer 4 (lines 869–885), so nothing in the folder needs to change. A text that would be right adds "OrthogonalTamagawaAndLatticeMass" to the list. (NilpotentOrbits on main also names this roadmap, at its line 58, without a section number.)

## C02 — Two items the description lists among the Checks stand under Examples

A reader who looks for them among the 64 Checks finds neither. Under "What is added" the description says the Checks "cover the degree tables" and that they name, among the wrong versions ruled out, "the modular coinvariant algebra over 𝔽₂".

At this head the table of degrees, exponents and Coxeter numbers is in the Examples of Layer 4 (`README.md` lines 869–885), and the coinvariant algebra `𝔽₂[x]/(x²)` of `S₂` on `𝔽₂²`, which is not the regular representation, is the third of the Examples of Layer 1 (lines 197–200). The only Check on `S₂` over `𝔽₂` is the one of §2.5 (lines 400–403), about completed local rings. The count is right: 64 Checks in 26 sections. A text that would be right: "Checks and Examples" in the first sentence, or the two items moved to a sentence of their own ("The Examples add the degree table of the irreducible types and the modular coinvariant algebra over 𝔽₂").

## Previous findings

- none: the previous report, of this same head, raised no finding.
- C01 (small correction of the previous report) — repaired: the description now reads "The README keeps both anchors, before the Layer 2 and Layer 4 headings, so those links land there", which is what `README.md` lines 207 and 659 show.

## Verified sound

The folder did not change, so the diff changes no statement. The rows are for statements the description makes claims about ("acting faithfully except in the Hilbert series"; the height partition "holds for every reduced crystallographic root pairing with finite Weyl group"; the non-faithful converse).

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `poincareSeries_coinvariants_eq_prod` (§3.5), stated without faithfulness | `ℤ/4` on `K` through the sign, kernel of order 2; `S₃` on `K³` | `ℤ/4`: the two elements acting by `−1` generate, `A = K[x²]`, `d = 2`, `C = K[x]/(x²)`: `1 + t` on both sides. `S₃`: `(1+t)(1+t+t²)` vs `1+2t+2t²+t³` | true without faithfulness | none |
| `prod_degrees_eq_card`, `sum_degrees_eq_add_card_reflections`, `exists_linearEquiv_coinvariants_monoidAlgebra` (§3.6), stated with faithfulness | same `ℤ/4` on `K`; `μ₃` on `ℚ(ζ₃)`; `S₃` on `K³` | `ℤ/4`: `∏d = 2 ≠ 4`; `Σd = 2 ≠ 1 + 2`; `dim C = 2 ≠ 4`: all three fail, so the hypothesis is needed. `μ₃`: `3 = 3`, `3 = 1 + 2`. `S₃`: `6 = 6`, `6 = 3 + 3` | true as stated; faithfulness is used | none |
| `card_height_eq_card_degrees` (§4.5), conclusion `#{ht = j} = #{k : j < d k}` | `B₂`; `G₂`; `A₁` in `ℝ²` (a fixed direction); `A₁ × A₂` | `B₂` (d = 2, 4): j = 1,2,3,4: `2,1,1,0` on both sides. `G₂` (2, 6): `2,1,1,1,1,0` both. `A₁` in `ℝ²` (1, 2): `1,0` both. `A₁ × A₂` (2, 2, 3): `3,1,0` both | true, reducible and with fixed directions | none |
| §2.4, non-faithful converse: polynomial iff `pseudoreflectionSubgroup ⊔ ker = ⊤` | `ℤ/2` trivial on `K`; `{±1}` on `K²`; `ℤ/4` on `K` through the sign | trivial action: `⊥ ⊔ G = ⊤`, `A = K[x]`. `{±1}` on `K²`: `⊥ ⊔ ⊥ ≠ ⊤`, `A = K[x², xy, y²]`, Hilbert series `(1+t²)/(1−t²)²`, not polynomial. `ℤ/4`: `⊤`, `A = K[x²]` | both sides agree | none |

The rows for the other statements stand as in the previous review, of `e113278`.

- Description against the head: the three headline bullets against the overview (lines 11–24); the count of Checks (64 in 26 sections, recounted); the sections said to cite no source (§§3.3, 3.7, 4.7, 4.8, 5.3: none has a locator) and the three unlocated items of §3.1 (lines 439–444); the supplier lists against the three contract sections (lines 1059–1227); each "old text said" quotation against the README on main; the `Suggested.lean` paragraph against both versions of the file (13 declarations removed, 12 added, `shephard_todd_target` restated; ten new admitted theorems, two predicates, six Tau Ceti imports). Two inaccuracies, C01 and C02.
- Library declarations opened at the pins for the description's claims: Mathlib `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/WeylGroup.lean` line 55), `RootPairing.weylGroupToPerm` (same file, line 25), `RootPairing.Base.height` and `IsPos` (`LinearAlgebra/RootSystem/Base.lean` lines 540, 619); Tau Ceti `TauCeti.IsRegularRing.of_faithfullyFlat` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean` line 465), `TauCeti.HopfIdeal.coinvariants` (`Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Basic.lean` line 95), `TauCeti.CommHopfAlgCat.coinvariantsBaseChangeEquiv` (`…/Coinvariants/BaseChange.lean` line 114), Molien's formula (`RepresentationTheory/SymmetricAlgebra/Molien.lean` line 139: any field with `|G|` invertible). `GroupTheory/Coxeter/Poincare.lean` has no sentence about scope or degree products, as the description says. The two imports said to be dropped are absent from the head and present on main.
- Cross-roadmap citations resolved: the inbound citations on main, by roadmap (CharacteristicClasses, K3SurfacesAndSymplecticBoundedness, LieHighestWeight, McKaySkewGroup, NilpotentOrbits, OrthogonalTamagawaAndLatticeMass, ReductiveGroups, RootSystems, SchubertGeometry); every section number they use (§1, §2, §3, §4, §§1–3) is a layer of the same number at this head.
- Source locators checked against the text: none this round; the folder is unchanged and no target of the seeded sample lies in a changed passage. The README flags no locator as unverified.
- Automatic checks: all passed when rerun; none set aside. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings (lines 65, 79, 92, 106, 122, 139, 152, 162, 174, 187, 202) and nothing else.
- Headline theorems and padding: unchanged; not probed again.

Overlap check: read RootSystems and LieHighestWeight (main; their open revision was read in the previous round and the folder has not changed since) and NilpotentOrbits (it names this roadmap as a consumer and owns none of its objects); LieHighestWeightPartII and RootSystemsPartII were not reread, the change adding no object; the results-and-headings list was empty; nothing shared beyond what the earlier reviews recorded (the Weyl Coxeter presentation, greatest roots and the classification belong to RootSystems and Tau Ceti and are cited here; degrees, exponents and `|W| = ∏ dᵢ` belong to this roadmap).

Source independence: changed passages only; the folder has no changed passage, so 0 passages were compared with 0 sources. Largest share Stanley1979, 11 of 42 locators; the arrangement was not compared again, since no layer was added, removed or reordered.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955) with Steinberg's stabilizer theorem (Steinberg 1964). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959, Macdonald 1972 and Springer 1974, which CharacteristicClasses C5a.7 uses for the rational cohomology of compact Lie groups. Rests on the README's References and the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): cited only through Fogarty 2001, p. 5; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001, Smith 1995: listed in the References with no locator in the README; not fetched.
- The seeded sample's targets lie in passages unchanged since earlier reviews; they were not reread in this round.
- The description as quoted may be cut; anything after the quoted text was not checked.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans; Stanley 1979, Smith 1997 and Steinberg 1959 from the free AMS back issues; SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated; unchanged by this pull request) reports Tau Ceti proofs later than the pinned commit, so several `Suggested.lean` statements may be library theorems once the pin moves.
