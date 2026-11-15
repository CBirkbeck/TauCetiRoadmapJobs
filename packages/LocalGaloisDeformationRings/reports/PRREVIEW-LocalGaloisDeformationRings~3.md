# Review of LocalGaloisDeformationRings (pull request #923 at 23fae83)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since `3580989`, and of the pull request's title and description against this head. Five P3 findings; none blocking.

## R01 (P3) — The 4.9 Check now states the complement of the cited source's type convention

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2626` "with rank 2 at the roots of `P`; the type is read off the determinant law `det φ = ∏_ψ (u − ψ(π))^{v_ψ}` up to a unit, so `v_ψ` is the cokernel rank at `ψ`."

**Claim:** The type `v` of a height-one lattice is the rank of the Frobenius cokernel at each embedding, so `P(u)I₂` has `v_ψ = 2` at the roots of `P`.

**Witness:** KisinFlat (2.4.2), printed p. 1124 (KisinFlat line 1775–1783, published text): the law is on the image, `det(a | im φ/E(u)𝔐) = ∏_ψ ψ(a)^{v_ψ}`. For `φ = P·I₂`: `im φ/E𝔐 = P𝔐/PQ𝔐 ≅ (𝔖/Q)²`, rank 2 at the roots of `Q`; cokernel rank is `d − v_ψ`.

**Repair:** Replace the quoted clause by: "with rank 2 at the roots of `Q`; the type is the determinant law `det(a | im φ/E_K(u)𝔐) = ∏_ψ ψ(a)^{v_ψ}` ([KisinFlat], (2.4.2)), so `v_ψ` is the rank of `im φ/E_K(u)𝔐` at `ψ` and the cokernel has rank `d − v_ψ` there." Tested on the same lattice: `P𝔐/PQ𝔐 ≅ (𝔖/Q)²` gives `v = 2` at the roots of `Q`, `0` at those of `P`; residually both lattices give `det(a | im φ/u⁴𝔐) = a₀⁴`, as the rest of the Check says. (This restores the labelling the head `3580989` had; the wording suggested in the previous review was the wrong one of its two options.)

## R02 (P3) — Own backticked API names not declared in `Suggested.lean` (previous R01, not repaired)

**Location:** `README.md:3007` "`OrdinaryWithEigenvalue.beta_relation`: `β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0`, `α = 1 + β`."; also 696–704, 1520, 2058, 3011, 3909–3910 and the further dotted names of the resolver's list.

**Claim:** A backticked name of the roadmap's own is a claim that `Suggested.lean` declares it.

**Witness:** `Suggested.lean` declares only `oddRealIdeal`, `OddRealRing`, `oddRealRing_geometry`, `completedNodeIdeal`, `CompletedNode`, `completedNode_isDomain_flat`, `IsDetOrdinary`, `HasOrderedTriangularization`, `det_ordinary_iff_ordered_triangularization`; `UniversalDeformation.hom_ext` (README:696) is not among them.

**Repair:** State the API bullets in prose (for 3007: "the eigenvalue relation `β² − tβ − t = 0` with `t = φ₁ + φ₄` and `α = 1 + β`"), keeping backticks for the nine declared names and for library or supplier declarations. No mathematics changes.

## R03 (P3) — Unnumbered subsection owned by a later target (previous R04, not repaired)

**Location:** `README.md:1182–1184` "### Ordinary flag definitions for 1.7 … Target [1.7] owns the following common predicate and elementary flag API."

**Claim:** A Layer 0 passage that 0.3 consumes is owned by target 1.7 of Layer 1 and has no target number.

**Witness:** `README.md:1230` (0.3 `*Needs:*`) cites "the ordinary flag definitions of 1.7" by the anchor `#ordinary-flag-definitions-for-17`; 1382 and 1394 (target 1.7) cite the same anchor back. Every other subsection of Layers 0–8 is `### k.n <topic>`.

**Repair:** Rename the heading "### 0.2.1 The ordinary flag predicate and its elementary API", delete "Target 1.7 owns", begin "Define the following common predicate …", and let 1230, 1382 and 1394 cite 0.2.1 (anchor updated in the three links).

## R04 (P3) — The description's supplier paragraph does not match the head

**Location:** pull request description, "By section, the README uses: PadicLocalLanglandsForGL2Qp, which owns the shared block, Montréal and type-ring interfaces imported in §§3.7.1–3.8; … SelmerIwasawaCohomology §§2A.3–2A.4, the Selmer and determinant tangent comparisons."

**Claim:** The paragraph lists, by section, what the README consumes from its suppliers.

**Witness:** README cites no SelmerIwasawaCohomology §2A.3 (only §2A.4 and §§0.4–0.6, lines 56, 58) and no ProfiniteCohomology; it does cite DeformationAndDerivedPatchingAlgebra §§1.8–1.12, 2.1–2.7, 3.9, 4.6 (line 54), unlisted, with four more suppliers.

**Repair:** Replace the list by: "PadicLocalLanglandsForGL2Qp §0.4 (generic framed, unframed and fixed-determinant functors, representing pairs, bounded type quotients), §§2.2–2.3, 3.1–3.3, 5.1–5.6, 5.12 (blocks, Montréal functor, type rings) and §6.9 (Jacquet–Langlands); DeformationAndDerivedPatchingAlgebra §§1.8–1.9, 1.12, 2.1–2.7, 3.9, 4.6, Layer 5 and §6.7; IntegralHeckeAndGaloisDeterminants Layers 0–1; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 3.4–3.6, 4.4–4.5; AlgebraicModuliForArithmeticGeometry §§1.3–1.4, 1.7; ArithmeticGaloisRepresentations §§1.2, 1.9, 2.3–2.4, 5.10, 7.2–7.5; ArithmeticGaloisDuality D7, D8.1, R02.1, R02.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.3, R07.4, R07.5.10, R07.5.15, R07.6.7; SelmerIwasawaCohomology §§0.4–0.6, 2A.4. On main: SchemeAndStackFoundations (§§0.16, 0.20–0.21, 1.21, 4.2–4.4, 4.9–4.10), AdicSpacesPartIII F0.8, AdelicAlgebraicGroups AA.3.4, AA.4.4, SmoothRepresentationsOfLocalGroups SR.0, SR.5, ClassFieldTheory Layers 5 and 7, LocalGaloisGroups, LocalFieldsRamification, ReductiveGroups." Drop ProfiniteCohomology.

## R05 (P3) — The description's validation sentence is contradicted by the head

**Location:** pull request description, "README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero."

**Claim:** The README has no identifier that the Lean file lacks and no labelled Check.

**Witness:** `README.md:145–1136`: 95 Check bullets of Layer F open with a bold identifier label (`**modCompare_strict_basis.**` at 352, `**phiP_not_of_Hom.**` at 566). `README.md:696` `UniversalDeformation.hom_ext` is not declared in `Suggested.lean` (R02).

**Repair:** After R02 is repaired, write: "the gate passes at this head (all counters zero, including round labels and empty Lean sections); 95 Checks of Layer F carry descriptive labels, which name no Lean declaration." Until then, drop "README identifiers absent from Lean" from the sentence.

## Previous findings

- R01 — not repaired: `README.md:3007` still reads "`OrdinaryWithEigenvalue.beta_relation`: `β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0`"; 704 and 2058 unchanged. Written again as R02.
- R02 — repaired: `README.md:793–794` "ArithmeticGaloisRepresentations §5.10 (`GaloisRep.carayol_conj_of_trace_eq`) and §7.2, Schur's lemma over a local ring (span and scalar centraliser)"; no occurrence of the undeclared name remains (line 960 cites "§5.10 and §7.2").
- R03 — repaired: `README.md:2451` "Layer 4 is the finite-flat deformation-ring layer; its Savitt ring presentations are target 4.2."; `R08` occurs nowhere.
- R04 — not repaired: `README.md:1182` "### Ordinary flag definitions for 1.7", 1184 "Target [1.7] owns the following common predicate and elementary flag API". Written again as R03.
- R05 — partly repaired: the convention is now stated at `README.md:2626`, but as "`v_ψ` is the cokernel rank at `ψ`", the complement of the cited source's law; the repair introduced R01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 4.9 Check 4 (`README.md:2626`), changed | `p=3`, `E_K=u⁴+3u²+3=PQ`, `d=2`, `φ=P·I₂` | README: `v=2` at roots of `P` (cokernel `(𝔖/P)²`). KisinFlat (2.4.2): `im φ/E𝔐=P𝔐/PQ𝔐≅(𝔖/Q)²`, `v=2` at roots of `Q`. | Fails on the label: R01. |
| 4.9 Check 4, rest of the bullet | Lattices `(ue₁,ue₂)`, `(e₁,u²e₂)` in `φ(e_i)=e_i` | `φ(ue_i)=u²·ue_i`, `φ(u²e₂)=u⁴·u²e₂`; `im φ/u⁴𝔐`: `(k⟦u⟧u²/u⁴)²`, type `(2,2)`, and `k⟦u⟧/u⁴`, type `(4)`; both `det(a)=a₀⁴`. | Pass; unaffected by the labelling. |
| 4.6 dimension formula (cited by the changed Check) | `d=2`, `v_ψ=1`; `v↦d−v` | `d²+Σ_ψ(d−v_ψ)v_ψ=4+f`; symmetric under `v↦d−v`; agrees with KisinFlat line 1736–1739. | Pass. |
| F.2.7 `*Needs:*` (`README.md:793–794`), changed | The cited section at the supplier's head | ArithmeticGaloisRepresentations §7.2 (its line 4609–4612): `A` local, absolutely irreducible reduction, `ρ(Γ)` spans `M_n(A)`, centraliser `A`; §5.10 line 3772 declares `GaloisRep.carayol_conj_of_trace_eq`. | Pass. |
| Layer 3 Dependencies (`README.md:2451`), changed | The targets named | Layer 4 heading "Finite-flat models and Barsotti–Tate components" at 2453; target 4.2 carries the Savitt presentations. | Pass. |
| Lean `oddRealRing_geometry`, `completedNode_isDomain_flat`, `det_ordinary_iff_ordered_triangularization` (untouched) | Elaborated again | Three `sorry` warnings at lines 64, 88, 121, nothing else; signatures as in the worker's list, no binder lost. | Pass. |

The rows for the untouched statements stand as in the previous review, of `3580989`.

- Source locators checked against the text: 1 (KisinFlat (2.4.2), with (2.2.2), (2.2.4) and the dimension corollary at line 1736–1739 read beside it), in the publisher's open copy of the published article.
- Cross-roadmap citations resolved at the supplier's current head: 2 (ArithmeticGaloisRepresentations §5.10 and §7.2); the resolver lists no cross-roadmap citation found nowhere.
- Gate at `23fae83`: every counter zero, build passes. Dependency check output: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives `declaration uses 'sorry'` three times and no other message.
- Files changed outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Title and summary block read against the head: the title, the three summary paragraphs, "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" and the on-main claims (SchemeAndStackFoundations, ClassFieldTheory, ReductiveGroups on main; LocalGaloisGroups, LocalFieldsRamification completed on main) agree with the head.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, GlobalGaloisDeformations, GL2ModularityLifting; nothing shared (the first two cite this roadmap as supplier, the first with six declared gaps on it; no `Suggested.lean` at any open head declares one of the nine names).
- Source independence: changed passages only: 3 passages compared, 1 of them with 1 source (KisinFlat), none shared (the other two are citations without source wording); arrangement not compared again, the diff adds, removes and reorders no layer.
- Remark (untouched text): the 95 bold Check labels of Layer F (`README.md:145–1136`) read like declaration names; they matter here only through R05.

## Not verifiable

- KisinFlat in the author's DVI, which is the version the README's page locators cite: the sources service does not read the file; (2.4.2) was read in the published article, whose numbering I assume agrees.
- Kisin2adic, KisinPST, Geraghty and the CHT08 §2.4.1 sign: as in the previous review, not attempted again (no changed passage cites them).

## Source issues

- none

## For the human reviewers

- **Licence.** KisinFlat was read from the Annals of Mathematics site's own PDF of the published article, a host the sources service places in no licence class; I classed it as the publisher's open archive.
- **Not tested.** The source with the largest share of the locators was not determined again this round, and neither wording nor arrangement was compared outside the three changed passages.
