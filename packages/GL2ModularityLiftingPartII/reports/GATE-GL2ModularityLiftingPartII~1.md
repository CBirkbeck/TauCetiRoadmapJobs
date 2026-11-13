# GATE-GL2ModularityLiftingPartII~1: answers to human review of `35ff3e0`

Commit `fdda9163` on the pull-request branch (not pushed): "GL2ModularityLiftingPartII: review repairs (layers regrouped by mathematics; Wiese and Scholze sources cited)". Files changed: `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md`, `TauCetiRoadmap/GL2ModularityLiftingPartII/Suggested.lean` (module docstring and one section comment only).

The single review comment (CBirkbeck, 2026-11-13T11:34:45Z) makes four distinct points: F01's organisation finding (H01), F01's request for further sources (H02), and the two notes under "For the human reviewers" (H03 scope, H04 licence).

## H01 (CBirkbeck) — applied differently

The layers were regrouped by what the end theorems need (README lines 275–1256). Old → new: Layer 5 (vexing types) folded into Layer 0 as §§0.5–0.10. Old §§6.1–6.2 → §§1.6–1.7 beside the untyped degeneracy and balancedness. Old §6.3 → §3.6. Bianchi foundations: old §§8.1–8.5 → §§4.1–4.5, old §10.6 → §4.6, old §§9.1–9.4 → §§5.1–5.4. One closing **Layer 6, Minimal R = T by balanced patching**, covers both applications (old 4.1, 4.2, 4.3, 6.4, 10.1–10.4 → 6.1–6.8). **Layer 7, Modularity lifting and finite image**, holds old 4.4, 4.5, 6.5, 10.5 → 7.1–7.4. The scalar Jacobian layer (old Layer 7 → Layer 8) comes last because nothing uses it and it uses no other layer.

The suggested statement merge ("state once with a coefficient type") was not made. Merging would change content, which the finding's own last bullet rules out: the untyped torsion rank-one theorem (§6.3) has no typed counterpart (§6.4 asserts rank one only with nonzero generic fibre), and the homological typed statement swaps σ and σ*. So each typed target now sits next to its untyped case, and "How to read the build" (line 277) states that the trivial type recovers the untyped modules.

Further details:
- The forced orders are kept: 0 → 1 → 2 → 3, 4 → 5, the patching layers, and within each block.
- The unforced order (weight one before Bianchi) is justified in line 277: the Suggested.lean headlines rest only on Layers 0–3 and 6–7, while the Bianchi R = T and lifting theorems assume Conjecture A.
- Every internal reference was renumbered: 90 *Needs* tokens and every prose reference, plus the section comment in Suggested.lean (now `## Layer 7: Modularity lifting and finite image`) and the docstring's layer list.
- A mechanical check over the 53 sections finds 0 unresolved and 0 forward *Needs* references.
- No other roadmap, on main or at an open head, cites this roadmap's ids (`roadmaps grep GL2ModularityLiftingPartII` finds only this folder), so no old → new table is needed.
- Two pre-existing slips fixed on the way:
  - The numbering gap in old Layer 2 (2.1, 2.3, 2.4 → 2.1, 2.2, 2.3).
  - Line 185 listed "§§0.2, 2.4 and 8.3" as the image specializations. It now reads "§§0.2, 2.2–2.3 and 4.3": the image-algebra section is old §2.3, the one whose *Needs* cites IntegralHeckeAndGaloisDeterminants §§2.1–2.2.

## H02 (CBirkbeck) — applied

Three further sources were added, each with a locator verified against a legal arXiv copy:
- **Wiese 2014, Proposition 4.4** (wiese14 line 509) at §3.1, line 705. The citation notes that Wiese states it for a local ring finite-dimensional over 𝔽ₚ, with the indecomposability hypothesis on N; CG18 says the same at cg18 line 1492.
- **Wiese 2007, Corollary 4.4** (wiese07 line 337) at §8.4, line 1320 (the scalar lower bound, owned by SerreWeightAndLevelOptimisation §3.12) and at §8.5, line 1336 (the nonscalar multiplicity-one criterion).
- **Scholze 2015, Theorem V.4.1 and Corollary V.4.4** (scholze15 lines 3844, 3926) at §4.4, line 889, together with its owner TorsionCohomologyInfrastructure §4.6, Residual and local specialisations. The new sentence says these torsion representations exist only modulo an ideal I with I^N = 0 and carry no local conditions, so they do not supply Conjecture A. It also cites CG18's own statement of this (cg18 lines 121–127).

Reference entries are at lines 1365–1367.

Gross's Propositions 12.9–12.10 (the connected–étale sequence) were not added. The text is paywalled, and the sequence is imported through SerreWeightAndLevelOptimisation §3.10, which already cites it.

## H03 (CBirkbeck) — answered

The three contracts that no source establishes are named hypotheses, each attached only to the conclusions that use it:
- gap:scalar-variable-determinant, gap:scalar-conductor-comparison and gap:scalar-variable-global-type apply to the unrestricted scalar branch of §§8.2–8.5.
- H₃(3) applies only at p = 3 in §§5.1–5.4, 6.5–6.6 and 7.4.
- gap:integral-principal-types applies only to matched P-type summands.

The restricted versions carry none of them: no nonharmless self-extension primes, p ≥ 5, and S-only levels respectively. The 3-primary contract cannot be taken from CG18: the proof of its Lemma 5.9(1) uses H₃(Y₀(Q), k) = 0 (cg18 lines 3245–3246), which fails for stabilizer-retaining homology at p = 3, since H₃(C₃, 𝔽₃) = 𝔽₃ (the §5.3 Check).

Conjecture A is a hypothesis of CG18's own Theorem 5.11 (cg18 lines 3324–3326). §4.4 now cites the known modulo-nilpotent construction and why it falls short (H02).

## H04 (CBirkbeck) — answered

cg22 is recorded in the manifest as `status = "uncertified"`, `licence_class = "none"`, with the version note "Paywalled; cited by published locator alone". No legal open copy was found, so it has no cached text.

It is cited by its published locator only (pp. 855–856) for one convention, in Conventions line 23. The manifest records it as settled, so it was not requested again.

## Build and gate

- `lake build TauCetiRoadmap.GL2ModularityLiftingPartII.Suggested`: `Build completed successfully (18582 jobs).` The only warnings are the two expected `declaration uses 'sorry'` warnings, at Suggested.lean lines 141 and 183.
- Gate on the committed tree: `gate GL2ModularityLiftingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction check (`--movable`, `--pr 2137`): `depcheck: 216 roadmaps, 1912 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. The one new cross-roadmap citation, TorsionCohomologyInfrastructure, comes earlier in the merge order.

## Signature check

No declaration of Suggested.lean changed. The diff touches only docstring lines 14–39 and the section comment at line 54. The file has no `variable` block; every binder is explicit.

Running `#check @name` on a scratch file needs a Lean command this job may not run. The check therefore rests on the elaborated types in `scratch/signatures.md`, which are still current for all 9 declarations, with 0 lost binders. Each was compared with its README statement: `IsUnramifiedAt`, `twist`, `IsAdicallyContinuous`, `IsReducibleOn`, `inertiaInvariants`, `IsWeightOneResidual` and `IsMinimalLift` in Conventions, and `minimal_weight_one_modularity` and `minimal_lift_finite_image` in §§7.1–7.3. Nothing changed.

## Sources for the manifest

The worker should record these three works; this job may not edit `sources.toml`. All three were fetched through the sources service from arXiv and have licence class open-repository.

| key | work | fetched_from | sha256 | locators cited |
| --- | --- | --- | --- | --- |
| wiese14 | Gabor Wiese, On Galois representations of weight one, Documenta Math. 19 (2014), 689–707 | https://arxiv.org/pdf/1102.2302v2 | dc543fb374a23b472760f502371ab45d85f51c451874ee08427ead5c031bc970 | Proposition 4.4 (§3.1). The arXiv numbering agrees with CG18's citation of the published version, cg18 line 1492. |
| wiese07 | Gabor Wiese, Multiplicities of Galois representations of weight one (appendix by Niko Naumann), Algebra Number Theory 1 (2007), 67–85, doi 10.2140/ant.2007.1.67 | https://arxiv.org/pdf/math/0612318v1 | 086901982334e44e3d11a17bf0d264ac6ecdd83cd907eccebc1610696babc430 | Corollary 4.4 (§§8.4–8.5). The arXiv numbering is cited; SerreWeightAndLevelOptimisation cites the published copy as Corollary 4.5, so a version_note is needed. |
| scholze15 | Peter Scholze, On torsion in the cohomology of locally symmetric varieties, Ann. of Math. 182 (2015), 945–1066 | https://arxiv.org/pdf/1306.2070v2 | e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285 | Theorem V.4.1, Corollary V.4.4 (§4.4). The arXiv numbering is cited; TorsionCohomologyInfrastructure gives the published numbering as 5.4.1 and 5.4.4. |

A first fetch of wiese07 by DOI failed: the MSP landing page is in no licence class. A second try with a wrong arXiv id cached an unrelated paper, which is not cited anywhere. The `[[missing]]` entry that the first attempt wrote to `scratch/needs-references.toml` was deleted once the arXiv copy was found, so nothing is outstanding.

## Ownership

The repairs state no new construction. The only new cross-roadmap object cited is the modulo-nilpotent torsion Galois representation. Its owner is TorsionCohomologyInfrastructure §4.6, read at its open head and earlier in the merge order. It is cited as background in §4.4, not as a *Needs* input. No notion moved down.

## Adversarial pass on added or changed statements

| statement | instances tried | values computed | result | change |
| --- | --- | --- | --- | --- |
| Line 277: the trivial type recovers the untyped modules | T = ∅, G = 1, W = O | L_σ = (f_*O_{X_V} ⊗ O)^1 = O_X; L^sub = O_X(−C), as in the §0.6 Check | holds | none |
| Line 277: Layer 8 neither uses nor supplies a defect-one module | *Needs* closure of §8.5; users of §8.x outside Layer 8 | closure {8.1, 8.2, 8.3, 8.4}; outside users: none | holds | none |
| Line 277: Suggested.lean headlines rest only on weight-one layers | *Needs* closure of §§7.1–7.3 | 7.3 closure: 0.1–0.10, 1.1–1.7, 2.1–2.3, 3.1–3.6, 6.1, 6.2, 6.4, 7.1, 7.2; no §4.x or §5.x | holds | none |
| Line 277, first draft: "every Bianchi conclusion assumes Conjecture A" | §5.2; §4.6 | §5.2 says no Conjecture A hypothesis enters; §4.6 uses none | false | narrowed to "the Bianchi R = T and lifting theorems" (§§6.5–6.8 and 7.4 all assume it) |
| Line 7: vexing primes enter through §§0.5–0.10, 1.6–1.7, 3.6, 6.4, 7.3 | sections mentioning W_σ, L_σ or vexing primes | the cited sections are the type and vexing-coefficient targets; the only other mentions are the standing assumption "the vexing set is empty" in §§3.1–3.5, 6.1–6.3 and 7.1–7.2 | holds | none |
| §3.1: CG18 takes the criterion from Wiese Proposition 4.4 | Jordan generator J = [[1,1],[0,1]] on k², diagonal N → M², difference quotient | N̄, L̄ both indecomposable (J − 1 ≠ 0, (J − 1)² = 0); both versions give N ≅ M ≅ L of dimension 2 | holds | none |
| §4.4: Scholze gives representations only modulo I, I^N = 0, without local conditions | n = 2, [F:ℚ] = 2; I ≠ 0 nilpotent | representation over T_m/I with N = N(2, 2); the contract needs it over T_{Q,m} with conditions (2)–(4); the existing Check "only over T/I does not satisfy this contract" agrees | holds | first draft said "over a CM field"; narrowed to imaginary quadratic F, because Scholze's unconditional case needs an imaginary quadratic subfield (scholze15 line 121) |
| §8.4: scalar multiplicity at least two is Wiese's | scalar Frobenius I; type-three T_m | Wiese: r ≠ 1 and r ≥ 1, so r ≥ 2. CG18: dim J[m] ∈ {3, 4} ∩ 2ℤ = {4}, so r = 2. Wiese Cor 4.2: r = (3 + 1)/2 = 2 | consistent | none |
| §8.5: multiplicity one exactly when Frobenius at p is nonscalar | [[1,1],[0,1]] and I over 𝔽₅ | both have polynomial X² − 2X + 1. Jordan: nonscalar, r = 1. I: scalar, r ≥ 2 (= 2 by §8.4). Matches the §8.5 Check | holds | none |
| Layer 7 Examples | diag(2,3); O[ε]/ε² | trace 5, det 6; inverse: 1/2 + 1/3 = 5/6, det 1/6. (I + aεE₁₂)(I + bεE₁₂) = I + (a + b)εE₁₂, so the group ≅ (O, +) is infinite; every map to a field sends ε ↦ 0, so its image is {I} | holds | none |
| Line 185: image specializations §§0.2, 2.2–2.3, 4.3 | *Needs* of 0.2, 2.2, 4.3; text of 2.3 | 0.2, 2.2 and 4.3 cite IntegralHeckeAndGaloisDeterminants §§2.1–2.2; 2.3 forms B = A[T_p] as an image on ψ(M²) | holds (old "2.4" omitted the A_n section) | corrected |
| Renumbering | all *Needs* and prose references | 53 sections; 90 *Needs* tokens remapped; 0 missing; 0 forward | holds | none |

P3 note, not changed: §3.1's hypothesis "split as R-modules" is implied by L being free, because an exact sequence ending in a projective module splits. Wiese's Proposition 4.4 omits it.

## Untrusted text

The review text contained no instructions beyond the mathematics; nothing suspicious to report.
