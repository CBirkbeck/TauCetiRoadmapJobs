# Triage report: TARGET-EllipticCurveModularityCMFields

**Verdict:** part-ii of EllipticCurveModularityImaginaryQuadratic (ECMIQ, roadmap pull request #1048). The name is EllipticCurveModularityImaginaryQuadraticPartII, inserted in the merge order immediately after ECMIQ (position 183). The brief is `packages/EllipticCurveModularityCMFields/target.md` and the manifest is `packages/EllipticCurveModularityCMFields/sources.toml`. No text is missing, so there is no `needs-references.toml`.

**History of this job.** Run 1 finished its triage, but the worker could not submit it because of a GitHub API rate limit. Its files were never reviewed. In this run I re-checked every decision against the current board, merge order and roadmap heads (the READMEs of ECMIQ, CrystallineLocalGlobalCompatibilityCM and ModularityAndLanglandsExtensions are unchanged since run 1). I re-read the key source passages and corrected three points of the run-1 draft (listed at the end).

## What I searched

**Consolidation against the open board.** I compared the target, by mathematical object, with every open target and design in the brief. Only one is in the same area: TARGET-EllipticCurveModularityTotallyReal (#3439, needs-references). I read that job's unsubmitted triage.

- It plans totally real fields by a reflection twist down to the real cyclotomic subfield.
- Its lifting layer is totally real (Breuil–Diamond, Freitas–Le Hung–Siksek and the totally real lifting theorems), and its seed is the FLHS 3–5 criterion.
- It explicitly leaves CM fields to this target.

The two targets share only ECMIQ's geometric layers (a common supplier) and the LeHung26 source. Neither plans the other's lifting theorems, seeds or descent. That is a shared supplier, not overlap, so there is **no merge**. The other open designs (stacks, PDE, analysis, explicit analytic number theory, Lie theory and others) are unrelated.

**Duplicate search.** I ran `roadmaps grep` over main and all open heads (index of 2026-11-06T19:39Z, 459 pull requests) for:

- elliptic modularity over every, all or arbitrary CM fields;
- the configuration ζ₅ ∈ K or ζ₅ ∈ F;
- the SL₂(𝔽₅) and PSL₂(𝔽₅) exceptions;
- Steinberg places together with Taylor–Wiles primes, Selmer groups or adequacy;
- the sources' names and identifiers.

I read the relevant roadmaps at their heads:

- **ECMIQ** (#1048): scope, §§0.3, 2.1–2.3, 5.1–5.3, 6.5–6.6, 7.4, Layer 8, and "Downstream consumers and boundaries".
- **ModularityAndLanglandsExtensions** (#1180): §§2.29–2.30.
- **CrystallineLocalGlobalCompatibilityCM** (#1182): Layer 9 (§§9.1–9.12).
- **LocalGaloisDeformationRings** (#923): §§2.3–2.5.
- **ArithmeticGaloisRepresentations** (#856): §7.9.
- **GL2AutomorphicRepresentationsAndTransfer** (#931): Layer R17.4.
- **AutomorphyLiftingBeyondTaylorWiles** (#1824): scope only, to rule out ownership of the non-adequate case.

I also checked that the section headings of every other supplier the brief names exist, that every supplier sits above 183 in `ORDER.txt` or is on main, and the board's package index (three imported packages, none relevant). The new name is used nowhere: not on main, not at any open head, not on the board and not in the merge order.

## What I found

- **Nothing owns modularity of elliptic curves over a general CM field.** ECMIQ's endpoint is imaginary quadratic only. Its boundary section puts the extension to other CM fields outside its scope and warns that the seed must then come before the cyclotomic base change. It gives the example K = ℚ(ζ₁₅ + ζ₁₅⁻¹, i). I re-checked it: K is the fixed field of {1, 29} in (ℤ/60)ˣ, and 29 ≢ 1 both mod 5 and mod 3, so ζ₅ ∉ K but K(ζ₃) = ℚ(ζ₆₀).
- **ECMIQ already states the needed general interfaces:**
  - §5.2 `potentiallySemistableCM` and §5.3 `cm_modularity`, over any CM field (the latter with ζ₅ ∉ L);
  - §0.3 `switch_five` and `modular_elliptic_all_coefficients`;
  - Layers 1–4 and 6;
  - §7.4 `simultaneous_specialization`, stated over an arbitrary number field with the d-conjugate Weil-restriction argument.

  Only §§8.2–8.6 are phrased after specializing to imaginary quadratic K, and their proofs do not use that hypothesis.
- **ModularityAndLanglandsExtensions §2.29 is a downstream adapter.** Its *Needs* line consumes ECMIQ's `switch_five`, `switch_three` and `cm_modularity`, and ECMIQ's scope section says the same. The filing's "consumes ModularityAndLanglandsExtensions §2.29" is therefore corrected. Consuming it would also have pushed this roadmap after position 184 for no reason.
- **No roadmap owns the case of residual image SL₂(𝔽₅) with ζ₅ in the field.** CrystallineLocalGlobalCompatibilityCM §9.12 keeps CN's p = 5 clause (4), and its §9.3 keeps AKT's p = 5 exception in Taylor–Wiles selection. ArithmeticGaloisRepresentations §7.9 records in a Check that SL₂(𝔽₅) is not adequate because H¹ ≠ 0. AutomorphyLiftingBeyondTaylorWiles works with an explicit Hecke–Galois hypothesis and does not treat this case.
- **Local inputs already owned elsewhere:**
  - LocalGaloisDeformationRings §2.3 (minimally ramified lifts, CHT §2.4.4) supplies the smooth ring at a residually unipotent place. Its §2.5 covers only trivial residual data.
  - GL2ModularityLifting §1.7 owns CHT Lemma 4.1.2.
  - AutomorphicGaloisRepresentationsPartII AG2.5 owns ACC Theorem 3.1.1.
  - EllipticCurves Layer 4 (main) owns Tate curves.
  - The pinned `WeierstrassCurve.torsionGaloisAction`, `WeierstrassCurve.quadraticTwist`, `NumberField.IsCMField`, `IsCyclotomicExtension` and `groupCohomology` all exist.

## Why part-ii

The target continues ECMIQ in the same direction: the same geometric prime switch and the same CN lifting theorems over CM fields, now over a general CM base. It starts exactly at ECMIQ's stated boundary and imports ECMIQ's layers by section. It owns:

1. the seed before base change and the general-K assembly (route 1);
2. the Steinberg-protected lifting theorem at 5, in general form (route 2);
3. the protected auxiliary curve and the headline over every CM field.

It keeps ECMIQ's lifting layers. That is the difference from the totally real target, which was triaged as a design because it replaces those layers with totally real ones and does not generalize ECMIQ's endpoint.

Following the board's convention (RealReductiveGroupsStructure became LieGroupsPartII), the name is `<Base>PartII`, and the suggested name is dropped. The sibling totally real design should refer to this roadmap by its new name.

**Generality.** The filed headline is already general. I kept the ζ₅ ∉ K theorem as its own final target (T1), because it uses only CN's lifting theorems. I stated the route-2 lifting theorem (T4) for an arbitrary ρ with a protected place rather than for H¹(A_t), and noted that its unprepared form must be derived, since CaptainSude26 proves only a prepared form. The argument of CN23 Lemma 6.1.4 uses only the determinant, so with inverse-cyclotomic determinant the exceptional case arises only when ζ₅ ∈ F. The brief therefore states T4 as CN Theorem 5.2 with clause (4) weakened to "(4), or a nonempty protected set".

## Sources

- **LeHung26.** The totally real triage could not find this text. It is on the Hexagon open repository (hexagonmath.org) as 2610.00156v1, under CC BY 4.0, fetched through the sources service as `open-repository`. The PDF's title and date (7 October 2026) match the filing; the landing page's different title is recorded in `version_note`. Its §4 numbering confirms the filed locators: §4.1 is the lifting-theorem subsection, Geometric input 4.1 is in §4.2 (line 284), §§4.3–4.6 are on pp.7–9, Remark 4.2 is at line 352 and Lemma 5.1 at line 357. Its Remark 1.3.1 (line 125) cites the CaptainSude manuscript v1.0.0 as its reference [13] for removing the ζ₅ hypothesis. **The totally real job's missing-reference request for LeHung26 can be answered with this location.**
- **CaptainSude26.** Despite the filing, no local copy was staged. I read the PDF from the author's own GitHub repository at tag v1.0.0, through the service as `author-page`. It has 15 pages, not 6. No licence is stated, so it is cited with provenance only.
- **OpenAI26, CN23, AKT23, ACC23 and CHT08** come from open copies; CHT08 is on Numdam.
- **Locators checked in the texts this run:**
  - LeHung26 Theorem 1.1 (line 86), §§4.1–4.6 (lines 272–355) and Lemma 5.1;
  - CaptainSude26 Theorem 1.1 (line 26), Lemmas 3.1–3.4 (lines 177–263), the prepared setting (lines 264–289), Theorem 4.2 (line 410), Lemma 5.1 (line 503), Proposition 5.2 (line 538), Corollary 5.3 (line 604) and Proposition 6.2 (line 634);
  - CN23 Theorem 5.2 (line 3849), Theorem 6.1 (line 4513) and Lemma 6.1.4 (line 4562);
  - ACC23 §6.5.12 (line 7059).

  Run 1 checked the AKT, ACC, CHT and OpenAI locators.
- `sources check`: 0 problems.

## Mathematical checks I did myself

- **Route 1.** It composes published inputs. Its one new lemma, descent of decomposed genericity and of cyclotomic absolute irreducibility from F to K, follows from the definitions: a rational prime split completely in F is split completely in K with the same local Frobenius, and G_{F(ζ₅)} ⊂ G_{K(ζ₅)}.
- **Route 2, local and finite-group steps.** These check out:
  - h¹(F_v, ad⁰) = 2 from the local Euler characteristic, since h⁰ = h² = 1 when μ₅ ⊂ F_v;
  - the trace form and the cup product give a nondegenerate alternating pairing on this 2-dimensional H¹, so every line, in particular the Steinberg (unramified) line, is its own annihilator;
  - restriction from H¹(SL₂(𝔽₅), ad⁰) to the Sylow-5 subgroup is injective (index 24), and H¹(⟨U⟩, ad⁰) is the line of E₂₁, because (D − 1)³ = 0 makes the norm vanish in characteristic 5;
  - the presentation count g = r − 3d − 1 + t keeps the deficit ℓ₀ = [F⁺:ℚ].
- **Route 2, global steps.** These are plausible but not established, and are listed as risks (i)–(v) in the brief.

## Corrections to the run-1 draft

1. **Withdrawn flag.** Run 1 claimed that CaptainSude26's citation of "ACC §6.5.12" for an imaginary-quadratic helper did not match ACC's numbering. That was wrong. ACC23 v2 §6.5.12 (line 7059) is the soluble base-change reduction at the end of the Fontaine–Laffaille proof, and it constructs exactly such auxiliary imaginary quadratic fields (line 7163). The flag is removed from the risks and from `sources.toml`.
2. **Base-change locators.** In GL2AutomorphicRepresentationsAndTransfer, prime-cyclic base change, its compatibility, descent, the cuspidality criterion and solvable towers are R17.4.2–R17.4.5 and R17.4.8, not "R17.4.3–R17.4.4".
3. **T4 hypotheses.** I made T4's hypothesis at protected places precise (the local form of CaptainSude26 Lemma 3.1), and corrected the condition on the solvable preparation to "ramification index prime to 5 at the places above P".

## Untrusted text

Nothing in the issue, the roadmaps or the fetched sources asked for any action outside this job.
