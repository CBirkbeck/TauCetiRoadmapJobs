# Review of CrystallineLocalGlobalCompatibilityCM (pull request #1182 at cb5cbd7)

**Verdict:** accepted

No findings. Incremental re-review of the 139 lines changed since 762a228 (README only), plus the pull request's title and description. Accepted means ready for a human's final approval; it is not approval.

## Previous findings

- none: the review of 762a228 carried no finding (its R01 bullet recorded an earlier repair of §8.6; that passage, README:1550–1575, is untouched by this change).

## Verified sound

| Statement (changed or cited by the change) | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.2 evaluation at the identity, README:278 (reworded) | n=1, zero weights; GL₂ dual Weyl lattice of weight (1,0) with Borel `P_{1,1}` | Constant 1 ↦ 1: image `O`, cokernel 0. Linear forms on `O²` evaluated on one basis vector: image `O`, kernel rank 2−1=1. Zero map would give cokernel `O`. | Same statement as CN line 839–843; none. |
| §7.3 separating character, README:1414 (reworded) | n=1, k=F₅, local value `χχᶜε(Frob)=1`; twist value u=ψψᶜ(Frob) | u=1: ratio 1·1=1, the two constituents coincide, (1) fails. u=2: ratio 2≠1, (1) holds. (2) is equality of constituent sets, the opposite relation, on a different pair. | "Disjoint" in (1), "same" in (2), unramified at `S_p`, decomposed generic all kept (CN lines 3658–3663); none. |
| §8.3 propagation, README:1520 (reworded) | `R=R′=O[[x,y]]/(xy)`, `C_a=V(x)`, `C=V(y)`, `T=R/(x)`; then `C=C_a` | Special generic points `(ϖ,x)`, `(ϖ,y)` generalize to `(x)` and `(y)`: different, hypothesis fails, and `C⊄Spec T`. For `C=C_a` both generalize to `(x)`; conclusion `C⊂Spec T` holds. | Hypothesis still requires one common generic point of Spec `R′_∞` (CN lines 4084–4088); none. |
| §8.4 comparison of complexes, README:1536 (reworded) | `K=K′`, one-point space, coefficients `R` | Both complexes `R[0]`; map on `H⁰` is 1↦1; scalar Hecke action a ↦ a on both. | Naturality and Hecke-equivariance kept (CN lines 4166–4170); none. |
| §8.5 support at points, README:1544 (reworded) | `C_∞=O[0]`, `S_∞=R_∞=O`, `x=y=(0)` | `H^*(C_∞⊗S_∞/y)_y = E ≠ 0`, support `{(0)}` contains `x`; `(0)` has dimension 1 and characteristic 0, and the `[1/p]` module is `E`. For `O/ϖ[0]` it is 0. | Matches CN lines 4124–4128; none. |
| §9.1 prepared hypotheses (5)–(15), README:1607–1609 (reworded and grouped) | (6): four p-adic places of `F⁺` of degree 2; five of degree 2. (11): auxiliary residue characteristics (7,7), (7,11) | Four places: remaining sum 4, half-degree 4, 4>4 false. Five: 6>5 true. (7,7): one distinct characteristic, fails; (7,11): two, holds. | All eleven conditions and four data items agree with CN lines 4227–4260; strict inequality and "strictly larger than `F_p`" kept; none. |
| §9.2 and `determinant_kernel_reducible_except_tetrahedral` (heading renamed; cited by §9.11) | Twisted binary tetrahedral group over F₇ (recomputed); `C₂` via diag(−1,1), p=3 | Order 24, det image {1,2,4}, kernel order 8 and nonabelian, projective image 12, projective kernel 4, trace condition true off the kernel. `C₂`: tr²=0=(1+det)². | Exceptional and ordinary branches both hold; statement and Lean unchanged. |
| §9.11 reduction (heading, back-reference and locator reworded) | Reference to §9.2 by its new heading; locator "End of the proof of Theorem 5.2, reducing it to Proposition 5.6.1, pp.85–87" | New heading text equals README:1627. CN: "end of the proof" starts line 4433 (p.85), the application of Proposition 5.6.1 is lines 4493–4509 (p.87). | Resolves; none. |
| §9.12 qualified lifting theorem, README:1800 (reworded) | p=3, 5, 7; identity control `ρ=r_ι(π)` | `[F(ζ_p):F]` divides 2, 4, 6: the value 3 is impossible at 3 and 5, possible at 7 (`F∩Q(ζ₇)=Q(√−7)`). Identity control: `Π=π` with the same `ι`. | Conditions (1)–(5d) agree with CN lines 3849–3872; "ramified at finitely many places" = unramified almost everywhere; extra cubic-tetrahedral hypothesis kept; none. |
| §1.9 (heading renamed, statement unchanged; seeded) | Empty selected-place set | Both sides `π`, comparison the identity; locator CN Lemma 2.2.6 at line 1373, printed p.28. | Statement and locator agree; none. |
| The eight grouping sentences (README:615, 665, 821, 902, 1083, 1177, 1669) | Each "consume" claim against every `*Needs:*` line | §1.9–1.13 ← §2.3, §2.4, §2.6, §3.16, §6.6 (lines 685, 692, 720, 929, 1257). §2.1–2.4 ← §2.5, §5.8, §6.6 (712, 1133, 1257). §3.7–3.12 ← §3.13–3.16 (908, 915, 922, 929). §3.16 ← §6.6; §3.17 ← §6.8 (1257, 1288). §5.2–5.6 ← §5.7 (1125). §6.3 ← §6.12 (1368). §9.4–9.9 ← §9.10, §9.11 (1780, 1796). | Every claimed consumer exists and none is omitted; none. |

The rows for the untouched statements stand as in the previous review, of `762a228`.

- Source locators checked against the text this round: 8 in CN (arXiv v3): Lemma 2.1.12 (line 839, pp.17–18), Lemma 2.2.6 (1373, p.28), Sub-lemma 1 (3658, pp.70–71), Theorem 5.2 (3849, pp.73–74), Assumption 5.4.1 and Proposition 5.4.2 (4064–4088, pp.78–79), Corollary 5.4.3 (4124, p.79), Lemma 5.5.1 (4166, p.80), §5.6 data (4223–4260, pp.81–82). Seeded targets in the changed text (§§1.9, 7.3, 8.4, 9.11, 9.12) are among them; the other ten seeded targets are untouched.
- Demoted targets: the 27 sections now carried as bold numbered paragraphs (1.10–1.13, 2.2–2.4, 3.8–3.12, 3.14–3.17, 5.3–5.6, 6.4–6.5, 9.5–9.9) keep their numbers, statements, locators and `*Needs:*` lines; no stale reference to a former heading remains (the one hit, README:1641, is the reworded locator).
- Cross-roadmap citations resolved: the citations of this roadmap in EllipticCurveModularityImaginaryQuadratic (§§7.5–7.6, 8.7, 9.1–9.12, 9.4, 9.6) and ModularityAndLanglandsExtensions (§§1.1–1.8, 2.3–2.4, 5.7–5.8, 6.6–6.13, 7.4–7.6, 9.12 with heading names) all resolve at this head; the citation resolver reports none missing for either, and none for this README (its one Lean-name lead is this roadmap's own theorem).
- Overlap check: read PotentialAutomorphyInfrastructure, PotentialAutomorphyInfrastructurePartII, AutomorphyLiftingBeyondTaylorWiles, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups; nothing shared (PotentialAutomorphyInfrastructurePartII is the polarized, definite-unitary theory and states that the unpolarized Caraiani–Newton lifting theorems are not treated there).
- Pull request text: title and every prose sentence of the description read against this head. The folder holds exactly the three files named; the summary's claims (Siegel parahorics, P-ordinary control, weight independence, Bruhat subquotients, degree shifting, the excluded cubic-tetrahedral case, impossibility of degree 3 at p=3, 5, the named consumer) match README:3–13 and README:27; the change since 762a228 removes no section number, headline, Lean declaration or supplier, so nothing in the text became wrong.
- Gate at this head: every count zero, OK; targeted build passed (worker), and `lake env lean` on `TauCetiRoadmap/CrystallineLocalGlobalCompatibilityCM/Suggested.lean` gives the single warning `declaration uses sorry` at line 64. The Lean file is unchanged since 762a228; its three signatures equal the supplied elaborated types.
- Dependency check: `depcheck: 246 roadmaps, 2257 edges, 0 problem(s)`; no UPWARD or CYCLE line. No supplier was added or dropped by the change. No file outside the folder is changed.
- Source independence: 9 passages compared with 1 source (changed passages only), none shared beyond formulas and runs of at most four forced words; largest share CN, 96 of 98 locators; contents not compared again (the change adds, removes and reorders no layer).
- Remark: the README's title calls it "Part II" of potential automorphy over CM fields while the open roadmap PotentialAutomorphyInfrastructurePartII carries the same designation for a different subject (see the last section).

## Not verifiable

- The access limits recorded in the earlier reviews (Jantzen I.3.3–I.3.7; Kisin's lecture; Cab84; Ger19 §5.2) concern untouched text and were not requested again.
- The statements outside the changed passages were not re-derived this round; they rest on the review of 762a228.

## Source issues

- **Error** in CN at Lemma 5.6.5, printed pp.85–86: the source says the determinant kernel is always reducible under the trace-square condition; it should exclude determinant order three with tetrahedral projective image, where the quaternion kernel is irreducible (order-24 example over F₇ recomputed); affects a stated result.

## For the human reviewers

- **Scope / source status.** 96 of 98 locators point to one arXiv preprint (CN, arXiv:2301.10509v3). The README corrects its Lemma 5.6.5, so §9.12 carries a hypothesis absent from CN Theorem 5.2 (README:9–11, 1800).
- **Naming.** README:1 titles this roadmap "potential automorphy over CM fields, Part II"; the open roadmap PotentialAutomorphyInfrastructurePartII is also Part II of PotentialAutomorphyInfrastructure, on polarized lifting. Their scopes do not overlap.
- **Not tested.** The arrangement of layers against CN's table of contents was not compared this round (incremental review; no layer changed).
