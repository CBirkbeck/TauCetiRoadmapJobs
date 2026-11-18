# Review of GaloisSectionsPadicPeriodMaps (pull request #1739 at 8a6331b)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 46 lines changed since `074a8b2`; all five small corrections of the previous review are repaired, the repairs introduce no new problem, and every supplier section the repairs newly name exists where it is cited. The title and description agree with this head. Four format notes of the previous review are untouched and stand, none blocking; one question remains for the human reviewers (whether the end theorem counts as statable on the fundamental group Tau Ceti already has).

## N01 — The Summary states the end theorems without the curve

Line 3 says the Selmer-section image and the finite-descent projection are finite "for a number field with no CM subfield" and never names the smooth projective curve of genus at least 2 they belong to. One clause would add it.

## N02 — Two API bullets of §1.1 define isotropic and Lagrangian submodules without naming them

Lines 187–188 read "A submodule W ≤ V with ω(W, W) = 0" and "An isotropic W equal to its own orthogonal"; the terms used from §2.3 on are never attached to them.

## N03 — §2.1 cites two ranges for one equivalence

The statement (line 374) cites PadicHodgeTheory §§3.4–3.5 and 5.3; the API bullet (line 386) cites §§3.3–3.5.

## N04 — A Check that separates `#Σ` from `dim A` in §6.8

Line 939 now says in words that the source's `dim A` form differs from the `#Σ` form; the Checks of §6.8 still use split algebras only. The example `A = ℚ_{p²}` with trivial action, `V = A ⊗ H¹_ét(E)`, `d = 1` (`Σ = ∅`; `0 ≥ 0` against `0 ≥ 1`) would tell the two apart.

## Previous findings

The previous review, of `074a8b2`, had no finding (R); its five small corrections are accounted for here.

- C01 — repaired: the docstring of `Suggested.lean` (line 13) now reads "the étale fundamental group of a connected scheme exists at the Tau Ceti pin as `Aut (TauCeti.FiniteEtaleScheme.fiber x)`, but the pins lack the homomorphism of fundamental groups induced by a morphism"; lines 24–25 likewise.
- C02 — repaired: the Check of §2.2 (line 435) reads "The proof of Betts–Stix Proposition 2.16 invokes the Galois action only; the Frobenius step of §2.4 is added here"; §2.4 (line 465) and §6.8 (line 939) carry the matching clauses.
- C03 — repaired: each of the seven lines named now lists the missing input (§2.2: MordellLawrenceVenkatesh §0.5; §2.3: §0.18; §3.1 and Layer 3: Chebotarev Layer 10; §5.2: §2.3; §7.4: §6.3; Layer 0: ComplexComparisonPartII §§C6.0, C6.2; Layer 4: AdicEtaleGeometry §§A1.1, A1.3 and §IG.0.3).
- C04 — repaired: the description now reads "The Lean file states no declaration: none of the headline theorems is statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with no warning".
- C05 — repaired: the remark of §8.1 (line 1172) reads "MordellLawrenceVenkatesh §7.1 states the Lawrence–Venkatesh version for unramified sets and Frobenius orbits"; the `*Needs:*` of §8.1 and the Dependencies of Layer 8 cite §7.1.
- N01–N04 — not taken up; written again above as format notes.

## Verified sound

The diff changes no statement; the rows are the statements the changed text cites.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §§2.2, 2.4 `End(D)` and the new clause on the source's proof | `K_v = ℚ_{p²}`, `D = ℚₚⁿʳ` | `G_v`-equivariant linear endomorphisms: `λ` with `σ(λ) = λ`, so `ℚ_{p²}`, dimension 2 > `d² = 1`; with `φ(λ) = λ`: `ℚₚ`, dimension 1 | Holds; clause matches bs lines 603–615 (Galois action only) |
| §6.8 trichotomy, alternative (c), and the new clause | `A = ℚ_{p²}`, `d = 1`; `A = ℚₚⁿ` | `Σ = ∅`: `0 ≥ 0` true, `0 ≥ 2/2` false; split: `#Σ = n = dim A` | `#Σ` form holds; bs lines 277, 2364 state `dim A` as the clause says |
| §8.1 threshold 4 against MordellLawrenceVenkatesh §7.1 | A single 5-cycle; a 3-cycle | §7.1 (orbits below 8): proportion 1 and 1; here (below 4): 0 and 1 | Different thresholds, as line 1172 says; §7.1 is the right citation |
| §3.1 infinitely many self-conjugate places (Chebotarev now in Needs) | `ℚ(i)`: primes 3, 5 | 3 inert, fixed by conjugation; 5 = (2+i)(2−i), exchanged | Holds; Chebotarev Layer 10 is the Dirichlet-density statement |
| `Suggested.lean` docstring, items 1, 12, 13 | Tau Ceti pin | `TauCeti.FiniteEtaleScheme.fiber` at `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean` line 117, namespace line 45; no induced homomorphism | Docstring true |

The rows of the previous review for the untouched statements stand as in that review, of `074a8b2`.

- Source locators checked against the text: the four line locators the diff adds (bs lines 277, 603–615, 2364, and the unchanged 576 beside them); all agree. The seeded sample falls in the changed passages only at §3.1 (its `*Needs:*`) and §8.6 (the Layer 8 Dependencies); both checked.
- Library declarations opened at the pin: 1 (`TauCeti.FiniteEtaleScheme.fiber`, file and line above).
- Cross-roadmap citations resolved, every one the diff adds or changes: Chebotarev Layers 10, 13, 14 and LocalGaloisGroups Layer 7 (both completed, on main); AdicEtaleGeometry §§A1.1, A1.3; InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; ComplexComparisonPartII §§C6.0, C6.2; PadicHodgeTheory §§7.2–7.3; ArithmeticGaloisRepresentations §1.3; AnalyticNumberTheoryPartI §0.32 (all on main); MordellLawrenceVenkatesh §§0.5, 0.18, 7.1 (at the head of its open pull request). None missing; each is already used by a `*Needs:*` line or route of the layer whose Dependencies now name it.
- Declared gaps: the two the diff newly names in `*Needs:*` and Dependencies lines (symplectic-faltings-finiteness at MordellLawrenceVenkatesh §1.2, linnik-polynomial-least-prime at AnalyticNumberTheoryPartI §0.32) carry the same slug and supplier as under the supplier contracts.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 212 roadmaps, 2281 edges, 0 problem(s)`, no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: exit 0, no output. The file has no declaration, so the `#check` inventory and the one-tactic probe have no case.
- Headline theorems: §9.1, §9.3, §9.4, §9.5 and those behind them, each named in the module docstring (fourteen items) as not statable; none stated through a stand-in. Unchanged since the previous review except for the wording of items 1, 12 and 13.
- Pull request text: title, summary block and prose read against the head. It adds a new roadmap (nothing removed or renumbered against the base, no declaration removed); "states no declaration", "fourteen items", "no warning" and "Part II of AnabelianGeometryAndNonabelianChabauty" (README lines 3 and 1388) all agree with the head. No stale sentence.

Overlap check: read MordellLawrenceVenkatesh, MordellLawrenceVenkateshPartII, AnabelianGeometryAndNonabelianChabauty, PadicHodgeTheory; nothing shared (none of them mentions Selmer sections, self-conjugate places, modified adelic points or filtered discrete modules; AnabelianGeometryAndNonabelianChabauty §7.1 owns section classes and is cited).

Source independence: changed passages only: 4 passages compared with 1 source (bs), none shared; largest share bs, 65 of 68 locators as counted in the previous review; contents not compared again (the diff adds, removes or reorders no layer).

Research link: Layer 9 is Theorems A and B of Betts–Stix (2022; Annals of Mathematics 2025), which refine the method of Lawrence–Venkatesh (2020) and pass to finite descent through Harari–Stix (2012) and Stoll (2007); rests on the README's references and on bs §1, hs Theorem 2.1 and stoll §2 as read in the previous review.

## Not verifiable

- The description's account of earlier review rounds is a statement about process, not about the head; not checked.
- The generated dependency and merge-order blocks of the description are outside the check of the text.

## Source issues

- **Gap** in bs at Proposition 2.16(1), proof, p. 12: the source says commuting with the Galois action alone yields a trace identity over `ℚₚ`; it should be over `K_{v,0}` unless commutation with Frobenius is also used; affects the proof.
- **Error** in bs at Proposition 6.7(c), p. 46, and Proposition 1.8(c), p. 6: the source says the count of small-index points is at least `dim A/(d+1)`; it should be `#Σ/(d+1)`, which is what its proof gives (the two agree for split `A`); affects a stated result.

## For the human reviewers

- The Lean file states nothing. Tau Ceti at the pin has `Aut (FiniteEtaleScheme.fiber x)` and `pullbackCompFiberIso` (`TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`, lines 117, 179) but no induced maps, section classes or genus; whether §9.4 is statable on these is yours to decide.
