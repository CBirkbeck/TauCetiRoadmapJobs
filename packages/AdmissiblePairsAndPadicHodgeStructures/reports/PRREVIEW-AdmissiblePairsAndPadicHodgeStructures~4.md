# Review of AdmissiblePairsAndPadicHodgeStructures (pull request #1511 at cb12b64)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since `f4efc7c`, plus the pull request's title and description. Three P3 findings, none blocking. R01 is a defect in the sentence the previous review itself proposed; the fault is the review's, and the replacement below is checked against the instance that refutes it.

## R01 (P3) — §12.3 proof route: a countable monodromy image does not contradict profinite surjectivity

**Location:** `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:2125`, "A reduction to a connected rigid de Jong covering over the quasi-compact ordinary locus has a countable fibre, so the induced monodromy image in Z_p× is countable, contradicting surjectivity onto the uncountable Z_p×."

**Claim:** The surjectivity the paragraph establishes ("Compactness gives surjective Z_p× monodromy") is that of the inverse limit of the finite levels. A countable dense image of the covering group is compatible with it, so the step is a non sequitur.

**Witness:** Tate curve E = G_m/q^Z: the Z_p-torsor lim G_m/q^(p^n Z) has connected levels with monodromy Z/p^n, hence profinite monodromy onto Z_p, yet reduces to the connected de Jong covering G_m → E with countable fibre Z over a quasi-compact base.

**Repair:** Replace the sentence by: "A de Jong covering splits into finite étale pieces over a neighbourhood U of the point above the generic point of the ordinary special fibre. A reduction would trivialize the tower over one piece, of some degree d, so the monodromy over U would have order at most d. But U contains the tube of the special fibre minus finitely many points, over which the levels keep monodromy (Z/p^m)× of order p^(m−1)·(p−1), unbounded in m." Tested on the Tate curve: its covering group Z has no such bound to violate (each point has a neighbourhood over which the tower is split), so the argument does not wrongly exclude it, while for the Igusa tower d < p^(m−1)·(p−1) for large m.

## R02 (P3) — Description: the Lean file states nothing, and its build has no `sorry` warning

**Location:** pull request description, "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader concludes that `Suggested.lean` states some headline theorems. At this head it declares nothing.

**Witness:** `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean:42–43`: the namespace is opened and closed with no declaration between; `lake env lean` exits 0 with no output, so there is no `sorry` warning.

**Repair:** Write: "`Suggested.lean` states no declaration: none of the headline theorems is statable at the pins, and its module docstring lists the 23 groups with the carrier each lacks", and "the targeted Lake build succeeds with no warning".

## R03 (P3) — Description: goodness is not stated over an arbitrary complete DVR

**Location:** pull request description, summary block: "good bilattices over a complete DVR" and "Bilattice results hold over any complete DVR, including equal characteristic, and no prime is excluded."

**Claim:** Only the lattice and bilattice definitions of §0.1 hold over any complete DVR. Goodness and recovery (§§0.2, 0.5) assume more.

**Witness:** `README.md:279`: "Let R be a complete DVR of characteristic zero with algebraically closed residue field k and a coefficient section k→R"; `README.md:333` the same for recovery. §0.2's PGL₂ Check over Q_p[[t]] (Brauer invariant 1/2) shows the residue-field hypothesis is needed.

**Repair:** Write "bilattices over a complete DVR and good G-bilattices over a characteristic-zero complete DVR with algebraically closed residue field", and "Bilattice definitions and elementary-divisor types hold over any complete DVR, including equal characteristic; goodness and recovery assume characteristic zero, an algebraically closed residue field and a coefficient section. No prime is excluded."

## Previous findings

- R01 — partly repaired: the "finite orbits" sentence is gone; its replacement, "has a countable fibre, so the induced monodromy image in Z_p× is countable, contradicting surjectivity", fails on the Tate curve. Written again as R01 above.
- R02 — not repaired, and withdrawn rather than carried: §9.4 still reads "an H-basic [b_H]∈B(H,[mu_H^-1])", which is the source's standing hypothesis (HKII line 2346 fixes b_H as the basic class of B(H,[μ_H⁻¹]) before Definition 8.4.1). The previous finding misread the source; no change is asked.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §12.3, changed sentence | Tate curve G_m/q^Z; Igusa tower at p = 2, 3 | Tate: fibre Z countable, image Z dense in uncountable Z_p, levels Z/p^n all connected. Igusa: level orders (1,2,4), (2,6,18), unbounded | Inference refuted; R01 |
| §12.3, replacement route | finite étale piece of degree d over U | torsor trivial on the piece ⇒ image of π₁(U) of order ≤ d; p^(m−1)·(p−1) > d once m is large | Holds |
| §12.3, target statement | HKII lines 2882–2891 | source: ordinary locus, no p-level, Z_p× tower, not of finite type, no reduction to a rigid variety; README states the same and adds the Q_p× extension | Agrees; unchanged |
| §9.4 (previous R02) | GL₂, Borel, b = b_H = diag(1,p) | root slope −1, so b_H is not the basic class of B(H,[μ_H⁻¹]); excluded by README and by HKII line 2346 alike | README matches source |
| §0.2 against the description (R03) | PGL₂ quaternion torsor over Q_p[[t]]; F₂[[t]] | invariant 1/2, no double coset over Q_p[[t]], invariant 0 over Q̄_p[[t]]; F₂[[t]] is admitted by §0.1 only | Description overclaims |

The rows of the previous review for the untouched statements stand as in the previous review, of `f4efc7c`.

- Gate, run again at `cb12b64`: every check 0, `OK`; the worker's run, which includes the targeted build, also reports `build=0`.
- Dependency check: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 260.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` exits 0 with no output. The file has 0 declarations, so there is nothing for the one-tactic probe or a `#check` comparison.
- Outside-folder diff against `origin/main`: empty. Change since `f4efc7c`: one line of `README.md` (2125), no heading, supplier, locator or Lean statement touched.
- Source locators read this round: 2 (HKII lines 2876–2891 for §12.3; HKII lines 2338–2366 for §9.4). Seeded sample: only §12.3 falls in the changed passage.
- Citations in the changed paragraph (HodgeTateAndCanonicalSubgroups §5.1, AlgebraicModularFormsAndSerreWeights §3.5, IgusaVarietiesAndTorsionConcentration Layer 1) are unchanged from the head the previous review resolved; the worker's resolver and overlap listing report nothing unresolved, dropped or conflicting.
- Description, sentences checked and found to agree with the head: it adds a new roadmap (not on `origin/main`); the Ax–Lindemann summit is conditional on the arbitrary-field de Rham criterion (README Summary, lines 170 and 242); Liu–Zhu's finite-extension base (line 164); twisted-invariant vanishing in recovery (line 335); Layer 12 uniformization as a supplier input (line 224).
- Overlap check: read BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, IgusaVarietiesAndTorsionConcentration, GeometricSatakeAndFusion, VectorBundlesAndIsocrystals, DiamondsAndVStacks (the two vocabulary lists; the results list is empty) through the README's scope paragraphs and the previous review's resolution of them; nothing shared, and the change touches no ownership statement.
- Source independence: changed passages only; 1 passage compared with 1 source (HKII lines 2882–2891), none shared; largest share HKII, 154 of 229 line locators; arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- The description's account of its own history ("2 independent review rounds and 2 red-team rounds") was not checked against the board.
- The step "the tube of the special fibre minus finitely many points keeps full monodromy" in R01's repair rests on irreducibility of the Igusa curves, which AlgebraicModularFormsAndSerreWeights §3.5 states for the whole ordinary locus; the restriction to a dense open is standard and was not read in a source.
- The items of the previous review's list stand (declared gaps are contracts; AdicSpacesPartV read only as a board design; published versions of HKI and HKII not collated).

## Source issues

- **Gap** in HKII at §10.1, printed p. 64 (HKII lines 2889–2891): the source says a reduction to a rigid variety is impossible because the monodromy is onto Z_p×; it should argue locally near the generic point of the reduction, since the Tate-curve Z_p-tower has full monodromy and reduces to G_m; affects the proof.

## For the human reviewers

- none
