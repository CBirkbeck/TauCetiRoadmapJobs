# Review of AutomorphyLiftingBeyondTaylorWiles (pull request #1824 at 81ebbed)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 38 lines changed since `3ab280d`, and the one finding of the previous review (the overclaim of §5.9 against CG18 Theorems 5.16 and 1.2–1.3) is repaired, with the new sentences of §5.8 and §5.9 checked against CG18 and by computation. The three small corrections and the heading note are repaired as well; one format note remains (line-number locators), not blocking. Nothing is left for a human to decide beyond the final approval.

## N01 — Line-number locators remain, and the locator of §5.9 places Theorems 1.2–1.3 in §5

The two wrong line numbers are corrected (§2.7 now line 4722, §3.5 now lines 4782, 4875 and 4885; each read). The locators still carry "CG18 line N", the line of a text extraction a reader does not have; theorem and published page suffice. In the locator of §5.9 (line 1263), "CG18, §5, Theorems 1.2, 1.3 and 5.11" would read better as "§1, Theorems 1.2–1.3, pp. 301–302; §5.4, Theorem 5.11, p. 379": only the last is in §5.

## Previous findings

- R01 — repaired: §5.9 now reads "Then the statement of §5.8 holds for n = 2 assuming only the clauses B^gal, B^lgc and B^van(b)", compares with the finite-flat case of CG18 Theorem 1.2 only, and lists what lies outside; §1.7 is renamed.
- C01 — repaired: the contract names `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean`; the definition is there at line 50 at the pin.
- C02 — repaired: the overview says "when `r̄` is trivial at none of the finitely many places where the lift may ramify".
- C03 — repaired: Scope and ownership says "the global component and operator comparison above".
- N01 — partly repaired: the lines cited in §2.7 and §3.5 are now 4722, 4782, 4875 and 4885, each correct; line-number locators as such remain (N01 above).
- N02 — repaired: no subsection heading carries a source's numbering (§§0.3, 1.3, 1.5, 1.6, 1.7, 2.8, 3.5, 3.6, 4.2, 5.4, 5.7 renamed by their mathematics).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §5.8, new sentence on a place with `r` ramified, `r̄` unramified nontrivial, `N(x) ≡ 1` | `n=2`, eigenvalues `a,b` of `r(Frob_x)`: `ab=N`, `a/b=N^{±1}` | `a²=N²` or `b²=N²`: `{±N, ±1}` same sign; mod `p` both `±1`; `r̄(Frob_x)≠1` leaves `−1` or `±`(nontrivial unipotent) | true; CG18 Theorem 5.16(6) (CG18 line 3513) admits these, §1.1 (lines 307, 313) excludes them |
| §5.9, "the statement of §5.8 holds for n = 2 …" | clauses of §2.5: B^gal, B^lgc, B^van(a), B^van(b), B^tw | B^tw from §3.5 (CG18 Lemma 9.6, line 4782, `n=2`); B^van(a) from §2.8(1); `(d,q₀,ℓ₀)=(3,1,1)` | true; a specialization of §5.8, no longer of Theorem 5.16 |
| §5.9, comparison with CG18 Theorems 1.2, 1.3, 5.11 | Theorem 1.2 (line 192): finite flat or ordinary, semistable, minimal; 1.3 (line 225), 5.11 (line 3324): `R_min ≅ T_m`, freeness | standing datum: FL weights `{0,1}` = finite flat, `p ≥ 3`; `R_triv=∅` ⇒ ramification only at unipotent `r̄`, i.e. minimal; R = T only in §5.5 | true as worded ("a form of the finite-flat case") |
| Overview, smoothness condition | places where the lift may ramify: `v ∣ p`, `R_reg`, `R_triv` | FL factor smooth (§1.2), and `r̄` nontrivial at `v ∣ p` since weights `0…n−1` distinct mod `p−1`; `R_reg` smooth; only `R_triv` not | agrees with §5.5 (`R_triv = ∅`) |
| §1.7 heading against its statement | hypotheses listed | crystalline weights `0,…,n−1`, unipotent inertia on `R`, `det r = ε^{n(n−1)/2}`; conclusion type S | heading matches |
| Locators changed in §2.7, §3.5 | CG18 lines 4722, 4782, 4875, 4885 | sentence after Conjecture B(5); Lemma 9.6; Remark 9.7; Remark 9.8 | correct |

The rows for the untouched statements stand as in the previous review, of `3ab280d`.

- Source locators checked against the text in this round: 8 in CG18 (lines 192, 225, 3324, 3497–3525, 4722, 4782, 4875, 4885); the seeded sample falls in changed passages at §1.7 (heading), §2.7 (locator), §3.5 (heading and locator), §5.8 (new sentences), all read.
- Library declarations opened at the pin: Tau Ceti `TauCeti.MonoidAlgebra.augmentation`, `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean` line 50.
- Cross-roadmap citations: the diff adds or changes none; the changed passages cite §§1.1, 1.3, 2.8, 3.5, 5.2, 5.5, 5.8 of this README, each present under that number, and ModularityAndLanglandsExtensions §2.8 as before.
- Declared gaps: untouched by the diff; they stand as in the previous review.
- Automatic checks re-run on the head: all pass. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: exit 0, no output. The file is unchanged and declares nothing, so there is no `#check @name` comparison and no one-tactic probe; its docstring names each headline with the missing carrier, as before.
- Pull-request text read against this head: no sentence contradicted; the diff changes no heading number, supplier, headline or declaration that the description states.
- Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialAutomorphyInfrastructurePartII, GL2ModularityLiftingPartII, PotentialAutomorphyInfrastructure, CrystallineLocalGlobalCompatibilityCM, HilbertModularVarietiesAndShimuraCurves, GlobalGaloisDeformations, LocalGaloisDeformationRings (scopes as read in the previous review; the lists are unchanged and the diff moves no ownership); shared objects: the selected-root comparison of CG18 Lemma 9.6, owner this roadmap §3.5; the conditional lifting endpoint of CG18 Theorem 5.16, owner ModularityAndLanglandsExtensions §2.8, with §5.8 here a kept variant whose difference the changed passage now states exactly.
- Source independence: changed passages only; 6 passages compared with 1 source (CG18 Theorems 1.2, 1.3, 5.11, 5.16, Conjecture B, Lemma 9.6), none shared; largest share CG18, 72 of 86 line locators; contents compared with CG18: independent, as in the previous review (the diff adds, removes or reorders no layer).
- Research link: The headline targets are Lemma 8.2, Proposition 8.5, Lemma 9.6 and Theorem 9.19 of Calegari–Geraghty (2018), with Theorem 5.16 as application; §5.5 is the smooth case used by Calegari–Geraghty–Harris (2020), Theorem 1.2. Rests on CG18 and CGH20 as read.

## Not verifiable

- none

## Source issues

- **Error** in CG18 at Lemma 8.2(1), published p. 407: the source says both local rings are p-torsion free; it should be that their minimal primes have characteristic 0, since `(q−1)·tr(ΦS)=0` with `tr(ΦS)≠0` in `R¹_v`; affects the proof.
- **Error** in CG18 at Lemma 8.2(3) with the set `R` of §8.5, published pp. 407–408: the source says the character-side spectrum is irreducible for every `R`; it should require trivial `r̄|G_v` there, as distinct Frobenius eigenvalues give two components; affects a stated result.
- **Misprint** in CG18 at the proof of Lemma 9.6, published p. 416: the source says the Gram determinant is `T_x² − (1+N(x))²`; it should be `(1+N(x))² − T_x²`; affects nothing.
- **Error** in CG18 at the proof of Lemma 9.6, published p. 418: the source says the normalised squared operator acts by 1 on the amalgam cohomology; it should be `N(x)⁻²` (the unnormalised one acts by 1); affects nothing.
- **Misprint** in CG18 at the proof of Theorem 9.19, published p. 426: the source says the residual complex has `T^i` equal to the dual of degree `i − l₀`; it should be degree `q₀ + l₀ − i`; affects nothing.
- **Gap** in CG18 at Lemma 7.3, published p. 393: the source says the direct limit along powers of `T` is a perfect summand; it should be the summand cut out by the idempotent limit of `T^{n!}` (for `C=O`, `T=ϖ` the direct limit is `E`); affects the proof.

## For the human reviewers

- none
