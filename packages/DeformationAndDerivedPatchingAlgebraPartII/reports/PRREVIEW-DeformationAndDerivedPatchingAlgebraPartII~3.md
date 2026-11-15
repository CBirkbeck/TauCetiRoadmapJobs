# Review of DeformationAndDerivedPatchingAlgebraPartII (pull request #872 at f9fd940)

**Verdict:** needs changes

Incremental re-review of the 90 lines changed since `3b9100e` (README only), and the first check of the pull request's title and description against the head. The folder's files have no finding; the one finding is in the description.

## R01 (P3) — The description names two suppliers the README does not cite

**Location:** pull request description, the paragraph "Dependencies": "Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps) are consumed from main and are not prerequisites".

**Claim:** the README cites PadicMeasuresIwasawaAlgebras and RigidAnalyticGeometry.

**Witness:** a case-insensitive search of `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md` for `PadicMeasures`, `Iwasawa` and `RigidAnalytic` finds no line. The roadmaps on main it cites are those of `README.md:231–300`: SchemeAndStackFoundations, StableReduction, AdicSpacesPartII, AdicSpacesPartIII, DerivedModuleAlgebra, DGFloer, GroebnerGeometry.

**Repair:** replace the parenthesis by "(SchemeAndStackFoundations, StableReduction, AdicSpacesPartII, AdicSpacesPartIII, DerivedModuleAlgebra, DGFloer and GroebnerGeometry)". Checked on the head: each of the seven names occurs in the README (42, 12, 7, 8, 11, 4 and 3 times) and each folder is on main.

## Previous findings

- R01 — repaired: `README.md:278–282` "**ArithmeticGaloisDuality, D7.1**: its target *Grothendieck local duality for a complete Noetherian local ring* owns …"; likewise lines 777–778 and 807–808. `localDuality` no longer occurs. The target is in D7.1 at the supplier's open head.
- R02 — repaired: `README.md:45–47` "The base roadmap, DeformationAndDerivedPatchingAlgebra, is a consumer of this one, not a supplier: it uses the local-cohomology calculus of K0.1 and K0.4–K0.7 and the Rees module `Rees_I(M)` of K3.1. Macaulayfication itself … is planned in neither roadmap."
- R03 — repaired: `README.md:106` "sheafification on projective space over a field"; lines 1520–1522 "For a standard polynomial ring `κ[X₀, …, X_N]` over a field `κ` … the polynomial ring over an arbitrary ring `A` is an instance of the general-ring statements above."

No repair introduced a new problem.

## Verified sound

The diff changes no statement and no Lean; the rows are for the statements the changed text cites or glosses.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| K0 opening gloss of CM-secant (reworded) against the definition under the label K0.4 | `R = M = k⟦x,y⟧/(x²,xy)`, list `[y]` | `dim = 1`; `H⁰_𝔪 = (x̄) ≅ k`, annihilator `𝔪`; `a(M) = 𝔪 ∋ y`; `M/yM = k⟦x⟧/(x²)`, dimension 0, Cohen–Macaulay. Non-CM locus `{𝔪}`, where `y` vanishes | gloss and definition agree; "product", not intersection | none |
| Same gloss, product against intersection | `M = k ⊕ k⟦x⟧` over `k⟦x,y⟧` (the Check under K0.2) | `Ann H⁰ = (x,y)`, `Ann H¹ = (y)`; product `(xy, y²)`; intersection `(y)`; `y ∉ (xy, y²)` | "product of the annihilators" is the right word | none |
| Normalized local duality, with the supplier cited by target name (K0.7) | `R = k⟦x⟧`, `ω = R[1]`; `M = k, j = 0`; `M = R, j = 0, 1` | `Ext⁰(k, R[1]) = Ext¹(k,R) = k`, `Hom(k,E) = k = H⁰_𝔪(k)`; `Ext⁻¹(R,R[1]) = R`, `Hom(R,E) = E = k((x))/k⟦x⟧ = H¹_𝔪(R)`; `j = 0`: both sides `0` | agrees | none |
| Same, against the supplier's form `Extⁱ(K,ω) ≅ D(H^{−i}_𝔪(K))` | `K = R = k⟦x⟧`, `i = −1` | left `R`; right `D(E) = R` (complete); so "degree `−j` at `K = M`, then Matlis evaluation" gives the displayed isomorphism | the named target supplies what K0.7 uses | none |
| K3.3 sentence on GroebnerGeometry G4 | `A = ℤ`, `N = 0`; `A = κ` a field | over `ℤ`: `Proj ℤ[X₀] = Spec ℤ`, sheaf of `M[t]` is `tilde M`, a K3.3 statement that G4 (over `κ` only, its line 352) does not make; over `κ`: G4 | split of ownership is right | none |
| "Consumed by" sentences of the four grouped sections | every `K a.b` reference in the README, grouped by citing section | K0.2–K0.6 cited from K0.7, K1 (Dependencies), K2.2, K2.3, K2.4, K4.1, K4.4, K4.5, K4.6; K2.2–K2.4 from K4.1, K4.3, K4.4, K4.5; K3.1–K3.3 from K3.4, K3.5, K3.6, K4.1, K4.2, K4.3, K4.5, K4.6; K4.2–K4.4 from K4.5 only | each list equals the citing sections, none missing, none extra | none |
| Scope sentence on the base roadmap (R02's repair) | DeformationAndDerivedPatchingAlgebra at its open head, line 21 | it cites this roadmap's K0.1, K0.4–K0.7 and K3.1; it is not on main and is later in the merge order | direction as stated | none |

The rows of the untouched statements stand as in the previous review, of `3b9100e`.

- Section ids: K0.3–K0.6, K2.3, K2.4, K3.2, K3.3, K4.3 and K4.4 are now run-in bold labels (`README.md:509, 595, 665, 725, 1144, 1340, 1435, 1489, 1973, 2066`) under the grouped headings; all 132 internal `K a.b` references, the two in `Suggested.lean`'s docstring, and the citations by DeformationAndDerivedPatchingAlgebra (K0.4–K0.7) and DirectSummandsAndBigCohenMacaulay (§K0.3, parameter systems) still resolve; no roadmap links to a heading anchor of this README.
- Source locators checked against the text (seeded sample, where it falls in the changed passages): `cesnavicius` lines 370–387 (Definition 3.1, pp. 9–10: secant, Cohen–Macaulay terminal quotient, membership in the product over `j < dim Supp` of the prefix quotient), lines 502–515 (Proposition 3.11, pp. 12–13), lines 566–568 (Theorem 3.14, p. 14).
- Cross-roadmap citations resolved: 3 (ArithmeticGaloisDuality D7.1 heading and target at its open head, lines 4698 and 4823; GroebnerGeometry G4 on main, `README.md:352, 362–375`; the base roadmap's line 21). Library declarations: none touched by the diff.
- Title and description: every other sentence was read against the head and holds (five slips at `README.md:143–152`; the 1999 preprint for the colon estimates and the misprints of the 2000 paper at 1279–1293; the Čech–Koszul route with no dualizing complex at 677–706; `Proj (reesAlgebra.grade I)` at 82–86; the base roadmap as consumer at 45–47; folder contents README, `Suggested.lean`, `metadata.toml`; 25 declarations added, none removed).
- Gate at `f9fd940`, run again: every check `0`, `OK`. Dependency check: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with nine `declaration uses sorry` warnings (lines 95, 104, 129, 177, 215, 238, 255, 265, 297) and nothing else; the file is byte-identical to the one reviewed at `3b9100e`, so the signature and padding checks stand.
- Overlap check: read DeformationAndDerivedPatchingAlgebra, DirectSummandsAndBigCohenMacaulay, SchemeAndStackFoundations; nothing shared (the first two consume this roadmap's K0.1, K0.3–K0.7 and K3.1; the third supplies depth, Cohen–Macaulay modules, local cohomology and dualizing complexes).
- Source independence: changed passages only; 6 passages compared with 1 source (`cesnavicius` lines 362–411, 500–545), none shared (longest common run 3 words, at line 386); largest share `cesnavicius`, 53 of about 110 source mentions; the diff adds, removes and reorders no layer, so the contents were not compared again.
- Remark, no change asked: the base roadmap at its open head still says this roadmap "owns … Macaulayfication"; that sentence is the base roadmap's to correct.

## Not verifiable

- Kawasaki's 1999 author preprint, Kawasaki 2000 and 2002, Schenzel 1982, Huneke 1982, Herrmann–Ikeda–Orbanz: as in the previous review; no changed passage rests on them.

## Source issues

- none (none new; the six of the previous review stand)

## For the human reviewers

- **Licence.** The estimates A–E of K2.3 are cited to an unpublished author preprint (Kawasaki, 19 August 1999, a `.dvi.gz` on the author's page, `README.md:2240–2244`); its text could not be read by the sources service.
- **Licence.** HJLS (`README.md:2250–2253`) is cited as an author preprint on a university page, not by its published version.
