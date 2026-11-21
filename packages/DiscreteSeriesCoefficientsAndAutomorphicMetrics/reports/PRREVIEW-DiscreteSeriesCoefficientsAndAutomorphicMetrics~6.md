# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at 6496872)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 29 lines changed since `6d1a84a`. The one finding of the previous review is repaired: 8.3 now defines the compact dual as a connected compact group with Lie algebra `𝔨 ⊕ i𝔭` into which `K` embeds, shows that the measure does not depend on the choice, and carries the `SO(3)` negative control; I recomputed the independence argument, the factor `m` and the `SL₂(ℝ)`/`PSL₂(ℝ)` values. Three format notes remain (two carried over), none blocking; the scope, licence and organisation questions of the previous review stay with the human reviewers.

## N01 — In 8.3 (line 275) the existence clause says "as in AutomorphicFormsOnReductiveGroups §2.4", but §2.4 only says "connected real reductive group"; the realisation as (the identity component of) the real points of a connected reductive group over `ℝ` is in that roadmap's §2.2 and in ArithmeticLocallySymmetricSpaces ALS.0.1–ALS.0.3. Pointing there would let a reader find the hypothesis.

## N02 — Harish-Chandra 1966, Müller 1998, Harris 1989 and Zuckerman 1977 are cited by the whole paper, and Gross and Knapp by a range; a theorem number where one is known would let a reader check the hypotheses at the claim. (Carried over; untouched text.)

## N03 — Layers 2 and 8 need each other at the level of layers (2.4a uses 8.1; the route of 8.3 uses 2.4a and 2.4b). The targets are acyclic and the overview says so; placing 8.1 and 8.2 before Layer 2 would remove the forward citation, if that is wanted. (Carried over; untouched text.)

## Questions for the author

- In the formal statement of 2.4b (b) the signature is `(r + k, r + 1)` with `k ≥ 1`, so the range is `p ≥ q ≥ 1`, as the README says. Is the case `p < q` meant to follow by exchanging the signs, or is it left out on purpose? (Carried over; I did not open the definitions behind the formal statement.)

## Previous findings

- R01 — repaired: "`U` the compact dual containing `K`: a connected compact Lie group with Lie algebra `𝔨 ⊕ i𝔭` together with an injective homomorphism `K → U` whose differential is the inclusion of `𝔨`" (8.3; also the Conventions, headline (1), the ownership sentence and the docstring).
- C01 (small correction) — repaired: the Check now names the measure (`dx dy/y²` times the probability measure on `PSO(2)`, covolume `π/3`) and cites the value `d_n = (n − 1)/(4π)` of the Checks of VonNeumannAlgebras Layer 9, which is there (its lines 2548–2549).
- C02 (small correction) — repaired: the References entry lists the ten targets that name the formal proof; they are exactly the sections of the README that do (2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.3, 9.1, 10.2), and the description lists the same ten.
- N01, N02 — not changed; written again above as N02 and N03.
- The first question of the previous review (groups not contained in their complexification) is answered by the repair: existence is asserted for the identity component of the real points of a connected reductive group over `ℝ`, which is the supplier's class.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 8.3, definition of `U` and existence | `SL₂(ℝ)`, `PSL₂(ℝ)`, `U(1,1)`, compact `G` | analytic subgroup of `𝐆(ℂ)`: `SU(2)`, `SO(3)`, `U(2)`, `G`; compact since `𝔨 ⊕ i𝔭` = compact centre ⊕ compact form of the derived algebra; `K ⊂ U` | holds |
| 8.3, independence of `U` | `U = Ũ/Γ`, `U′ = Ũ/Γ′` | maximal torus of `U` in `K` (connected) ⇒ `Z(U) ⊂ K` ⇒ `K̃Γ = K̃Z(Ũ) = K̃Γ′`, so `U/K = U′/K`; measure = prob. on `K` × prob. on `U/K` | holds |
| 8.3, kernel of order `m` | `SL₂(ℝ)` with `SO(3)`, `m = 2` | image `K/μ_m` has mass one ⇒ `K` has mass `m` ⇒ volume form × `m`, degree × `1/m`; `SL₂`: `(k − 1)/2` against `k − 1` | holds |
| 8.3, formal degree and dimension clause | `SL₂(ℝ)`/`SU(2)`; `PSL₂(ℝ)`/`SO(3)`, `k` even; `U(1,1)`/`U(2)` | `d = k − 1 = dim` of weight `k − 2`; push-forward of the `SL₂` measure is `(4π)⁻¹dx dy/y²` × prob. on `PSO(2)`, `d = k − 1` (odd dimension, a representation of `SO(3)`); `c_{1,1} = 0!·1!/π = 1/π`; `λ − ρ` integral on the torus of `K ⊂ U` | holds |
| 8.3 Check, `PSL₂(ℝ)` and VonNeumannAlgebras Layer 9 | `dx dy/y²` × prob. on `PSO(2)` | `d = (k − 1)/(4π)`; covolume of `PSL₂(ℤ)` is `π/3`; product `(k − 1)/12`; supplier's Check: `d_n = (n−1)/(4π)`, `covol = π/3` | agrees |
| Headline (1), Conventions, ownership, docstring | against 8.3 | each now says "compact dual … containing/that contains `K`"; same hypotheses (Cartan compact modulo `A_G`, regular `λ`) | agree |
| References entry [FormalProof] | sections of the README naming it | 10 listed, 10 found (plus the Conventions and References themselves); 7.5c, 8.2, 10.1 do not name it | agrees |

The rows for the untouched statements stand as in the previous review, of `6d1a84a`.

- Seeded sample: of the thirteen targets only 8.3 falls in the changed passages; its source locator (Harish-Chandra 1966) is unchanged and uncertified.
- Cross-roadmap citations resolved in the changed text, 3: VonNeumannAlgebras Layer 9 Checks (lines 2548–2549, on main); AutomorphicFormsOnReductiveGroups §2.4 (lines 374–380) and §2.2 (line 336); NoncompactQuantumSymmetry M4.P (unchanged).
- Library declarations: none touched; `Suggested.lean` changes its module docstring only.
- Dependency check: `depcheck: 170 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index; the diff since `6d1a84a` touches only the folder's two files.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: exit 0, no output; the file declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: four, none statable at the pins, each named in the docstring with what it lacks; headline (1) in the docstring agrees with 8.3 at this head.
- Pull request text: title and description read against this head; no sentence contradicted (the description's list of targets naming the formal proof is the README's), and the repair changes nothing they describe.
- Overlap check: read BesselPoincareSeriesAndGramBounds, RowTowerAndRallisIdentities, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaKernelsForUnitaryDualPairs (open), AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, BallQuotientsAndComplexHyperbolicLattices (main); nothing shared (scopes as read in the previous review; the change adds no object and no layer).

Source independence: changed passages only; 5 passages compared (8.3 statement, two Checks, the Examples sentence, the docstring bullet) with the sources in the cache, none shared, and none of the six cached texts contains the compact-dual normalisation; largest share FormalProof, 37 of about 56 locators; the arrangement was not compared again (no layer added, removed or reordered).

Research link: 8.3 is Harish-Chandra's formal degree (1966), 10.1–10.2 Mumford's proportionality (1977), 7.5a–7.5c Gross's algebraic modular forms (1999), 9.1 Müller's trace class theorem (1989, 1998); 2.4a–2.4b come from Alpöge's formal proof (2026). Rests on the README's References and the sources read.

## Not verifiable

- Harish-Chandra 1966 (8.3), Gross 1999 (7.5a), Müller 1998 (9.1, general `f`): settled as uncertified; not read.
- Harris 1989, Zuckerman 1977, Knapp 1986, Harish-Chandra 1955–1956: not read.
- The formal statement behind 8.3 (`GlobalTheory.Published.FormalDegreeCompactDual`) was not reopened in this round to see which compact group it normalises by; the constant `c_{p,q}` it uses agrees with `U(n)`, which contains `K`.

## Source issues

- none

## For the human reviewers

- Scope: 2.4a (b)–(d) and 2.4b rest only on a formal Lean proof announced on 20 November 2026 (README line 456; Announcement line 53), not refereed; its public repository describes it as a claimed proof under independent verification. 6.8a cites no published source.
- Licence: the public repository of the formal proof carries no licence. The README cites 37 of its module paths and declaration names and reproduces none of its code.
- Organisation: the roadmap extends AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers 2.4a, 6.8a, 7.5a–7.5c after sections of the first; it is not titled a Part II of any of them.
- Not tested: the source with the largest share of locators is the formal proof, which has no table of contents; the arrangement was compared with its directory names only, in the previous review. Six cited works were not read.
