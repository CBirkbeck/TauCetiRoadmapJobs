# Review of PadicDifferentialEquationsAndRigidCohomologyPartII (pull request #2300 at 807aec5)

**Verdict:** needs changes

## R01 (P3) — The first Check of MS.0.4 is not an instance of the theorem

**Location** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md` lines 615–617: “for `α ∈ E ∖ E†`, the map `(E†)² → E`, `(a, b) ↦ a + αb` is injective on `(E†)²` … The rank conclusion concerns `Top(M)`, not `M`.”

**Claim** The Check gives no Frobenius structures. With the trivial ones the map is a `φ`-morphism only if `φ(α) = α`, i.e. `α ∈ E^φ = K^σ ⊂ E†`; read as an instance it would give `rank Top(M) = 2 > 1 = rank P`, against the theorem. MS.3.2 carries the disclaimer; MS.0.4 does not.

**Witness** `M† = (E†)²` and `P = E` with Frobenius `φ` on coordinates: `f(φ(a, b)) − φ(f(a, b)) = (α − φ(α))·φ(b) ≠ 0` for `α ∉ K^σ` (TSU line 521: the `φ`-fixed field is `K^σ`).

**Repair** Replace the Check by: “An injection over `E†` need not stay injective after `E`-linearisation. For `K = ℚ_p`, `φ(t) = t^p`, let `M†` have basis `e_1, e_2` with `φ(e_1) = p·e_1`, `φ(e_2) = e_2 + t⁻¹e_1` (slopes 1 and 0), `P = E(−1)` (Frobenius `p`), and `α = Σ_(n≥0) p^n t^(−p^n)`, which lies in `E ∖ E†` and satisfies `α = t⁻¹ + p·φ(α)`. Then `f(a·e_1 + b·e_2) = a − αb` is a `φ`-morphism `M → P`, injective on `M†`, whose `E`-linearisation kills the slope-zero line `E·(e_2 + αe_1)`: `λmax(M) = 1 = slope(P)` and `rank Top(M) = 1 = rank P`, while `rank M = 2`. The rank conclusion concerns `Top(M)`, not `M`.” Tested: `f∘φ_M − φ_P∘f = (t⁻¹ − α + pφ(α))·φ(b) = 0`; `|p^n|·ρ^(−p^n) → ∞` for every `ρ < 1`, so `α ∉ E†`.

## R02 (P3) — The module docstring does not name MS.2.8

**Location** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean` lines 55–61, against README line 33 (Layer MS.2, column “Headline targets”: “… the curve bounded quotient, a two-step example, the convergent PBQ filtration”).

**Claim** The README lists the Legendre two-step filtration (MS.2.8) among the headline targets of MS.2; the docstring names MS.2.2, MS.2.3, MS.2.5, MS.2.6, MS.2.7 and MS.2.9 and says what each lacks, but not MS.2.8.

**Witness** `grep -n "MS.2.8" Suggested.lean` returns nothing; every other theorem of the table's headline column is named in lines 27–78.

**Repair** Add the bullet: “The two-step PBQ filtration of the Legendre–Kummer extension (README MS.2.8; Tsuzuki §3.9) lacks overconvergent F-isocrystals on `P¹ ∖ {0, 1, ∞}`, the Legendre and Kummer objects, rigid cohomology with these coefficients and its Frobenius, and extension groups of overconvergent F-isocrystals.”

## R03 (P3) — Page range of Tsuzuki's Corollary 5.5 and Proposition 5.6

**Location** README line 1683 (MS.3.9): “(Tsuzuki, Corollary 5.5 and Proposition 5.6, pp. 25–26, for morphisms of connected schemes”.

**Claim** Both statements and their proofs are on p. 25 of arXiv v3; nothing of either is on p. 26.

**Witness** TSU lines 1297–1300 (Corollary 5.5) and 1301–1315 (Proposition 5.6 with proof); the marker of page 26 is TSU line 1336, after Proposition 5.8.

**Repair** Write “(Tsuzuki, Corollary 5.5 and Proposition 5.6, p. 25, for morphisms of connected schemes”. Line 1716 (“Proposition 5.8 and Definition 5.9, pp. 25–26”) is right as it stands: Definition 5.9 is TSU line 1338.

## Previous findings

- R01 — not repaired: deferred (D01)

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Sample: PBQ (MS.0.9) | unit; `E(−1) ⊕ E(0)`; logarithmic module; zero module | `B(M)` slopes: `{0}`; `{1, 0}`; `{0}` with `λmax = 0`; no slope. PBQ: yes, no, yes, no | Agrees with TSU lines 864–866 (Def. 3.16, p. 16) | None |
| Sample: Lefschetz condition (MS.6.1) | `X` a curve, identity; `A¹_(𝔽_(p²)) → A¹_(𝔽_p)` at the origin | `k(α)`-points over `α`: 1; 0 (fibre `Spec 𝔽_(p²)`) | Agrees with TSU lines 1456–1463 (§6.3, p. 28): rational point required | None |
| MS.0.4 opposite slope rank bound | `E† → E`; `E† → E²`; `M† = 0`; the instance of R01 | `(λmax, rank Top, rank P)`: `(0,1,1)`; `(0,1,2)`; undefined; `(1,1,1)` with `rank M = 2` | Statement holds; printed first Check carries no `φ`-structure | R01 |
| MS.0.3 normalisation | `(ℚ_p, id, q = p²)`, eigenvalues `1, p²`; `σ²`, `q = p⁴`; `ℚ_p(√p)` | raw `(0,2)`, `(0,4)`, `4`; normalised `(0,1)`, `(0,1)`, `4/4 = 1` | Consistent with §RD.1.35 (`w(π) = 1`) | None |
| MS.0.7 bounded splitting | `A = diag(1, q)`, `X = [[1, u], [0, 1]]`; logarithmic module | `φ(u) = q·u` forces `u = 0` since `|φ(u)| = |u| > |qu|`; coefficient norm `p^r` at `n = p^r` | Split ⇔ bounded on both instances; CT11 Theorem 4.1, p. 46 | None |
| MS.1.1–MS.1.2 PBQ filtration, graded formula | `L_1 ⊕ L_0`; logarithmic module | grades' maximal slopes `(1, 0)`, nested terms `(1, 1)`; `⊕ Top(G_i)` rank `2 = rank B(M)`; `r = 1`, rank `1 = 1` | Grade convention needed; TSU line 883 prints nested terms | None |
| MS.1.7–MS.1.8 growth versus slopes | logarithmic module over `E†`: `f_1`, `f_2` | `F(f_1) = f_1`, `F(f_2) = q·f_2`; slopes `(0, 1)`, exact growths `(0, 1)`; `λmax = 0`: `Sol_log,0 = K f_1`, `Sol_log,1` all | Equals `S_(≤λ−λmax)`; OHK lines 1938–1941, 2158–2159 | None |
| MS.2.2 intersections | `Σ p^n x^(p^n)` on `G_m`; `A¹` | in `Â`, `E_η`, `E†_0`: yes; in `E†_∞`: `|p^n| r^(−p^n) → ∞`, no; `k[x]` = regular rational functions | Boundary condition at `∞` needed | None |
| MS.2.8 Legendre–Kummer | `p ≡ 1 mod 4`, `q = p`; `p ≡ 3 mod 4` | eigenvalues `π_p²`, `p²/π_p²`: valuations `(0, 2)`, complex absolute value `p` each; `(−p, −p)`: slopes `(1, 1)` | TSU lines 1126–1127; grades of ranks `2, 1`, slopes `1 > 0` | None |
| MS.3.5 irreducibility criterion | `φ(e_2) = e_1 + e_2` over `𝔽_q`, `σ = id` | `c − φ(c) = 1` has constant term `0 ≠ 1`: nonsplit; PBQ yes, saturated yes, top reducible | Reducible, as the criterion gives | None |
| MS.3.7 local reconstruction | `N†` logarithmic, `M† = Sat(N†)` | tops both the unit, `h = id`; ranks `2 ≠ 1` | Saturation hypothesis needed in case (ii) | None |
| MS.4.2 curve rank theorem | identity; `O(−1) ⊕ O(0) → O(0)`; logarithmic object on `G_m`; ordinary Legendre | `(λmax(N), slope P, rank Top, rank P)`: equal; `(1, 0, ·, ·)` injectivity fails; kernel the slope `−1` line; `(1, 1, 1, 1)` | TSU lines 1344–1349 | None |
| MS.4.5 extensions | `a < b` logarithmic; `a = b`; `a > b` Legendre–Kummer | kernel of `M† → Top(M)`: contains `L†`; `0`; `0` iff nonsplit (it injects into the rank-one quotient) | TSU lines 1408–1417 | None |
| MS.4.6 and MS.4.8 specified map | `h = c·id`; logarithmic object versus unit; dual of `O(1)` | `g† = c·id`; tops equal, ranks `2 ≠ 1`; slope of `O(1)^∨` is `1` | TSU lines 1435–1443; direction of the dual lift `M† → N†` checked | None |
| MS.5.3 reduction to `n = 1` | `n = 2`, `L_0 ⊕ L_1` with `F² = (1, q²)` | induced rank `4`, `F`-eigenvalues `1, 1, ±q`, slopes `(0, 0, 1, 1)`; first step rank `2 = 2` | DAD lines 438–442, 451 | None |
| MS.5.5 and MS.5.7 minimal slopes | `N = M`; `N` dagger-extendable; `M† = E†(0) ⊕ E†(−1)` | `rank S_min(M) ≤ rank N` and `N ⊆ S_min(M)`; `H/H′` minimal slope `1 > 0` | DAD lines 568–571, 665–666; MS.4.2 applied to `M^∨ → N^∨` | None |
| MS.5.8 docile Lefschetz | `P²_(𝔽_(p²))` over `𝔽_p`; Dwork pullback to `A²` | `H⁰`: `K_2 → K_2`, dimensions `2 = 2`; `0` versus `1` on the line `x = 0` | AE lines 509–514, 523–524; docility needed | None |
| MS.6.6 trace formula | `X = Spec 𝔽_q`, `L(λ)`; unit with `L = K_α`, `deg α = 2` | both sides `λ^n`; raw fibre trace `2`, coefficient fibre trace `1` | TSU Prop. 7.12, lines 1709 ff. | None |
| MS.6.7 projected average | `m = 2` on `L²` | trace of `(1, 0)`: `1`; of `(1, 1)`: `2`; composites `2` and `4 = m²` | TSU line 2112: `n·deg(L/K) = m²` for `K′ = K_m`, `n = m` | None |
| MS.6.9 purity | `L = ℚ_3(√5)`, `a = (1 + √5)/2`; Frobenius 2 on `Spec 𝔽_3` | `T² − T − 1` at `0, 1, 2` mod 3: `2, 2, 1`; `|ι|`: `1.618`, `0.618`, weights `±0.876`; weight `2 log_3 2 = 1.262` | `L`-linear pure, `ℚ_3`-object not; real weights needed (TSU line 1815 has `w ∈ ℤ`) | None |
| MS.6.10 fibrewise criterion | `ι(a) = 2i`, `ι(c) = 4`; pole count | `ι(c/a) = −2i`, `(1 − 2it)(1 + 2it) = 1 + 4t²`; weights on `H^j_c` at most `j < 2d` | Pole at `q^(−d)` uncancelled | None |
| MS.6.13–MS.6.14 finite-field theorems | `Top(g′)(e_N) = 2e_M`, `h(e_N) = 3e_M`; `M† = N†`, `c′ ≠ c` | `h ∘ Top(g′)⁻¹ = 3/2`; `(3/2)·2 = 3`; `c′·id` induces `c′ ≠ c` | TSU lines 1936–1952; (2) needs the curve hypothesis | None |

- Source locators: 146 cited statements located at their printed pages in the cached texts (TSU 70, DAD 18, OHK 32, CT11 14, AE 5, KED04 2, KED05 1, STACKS 4 tags); one wrong page range (R03).
- Library declarations opened at the pins (`1b1ccf4`, `2fd255d`, as in `lake-manifest.json`): Mathlib `LinearAlgebra/Isomorphisms.lean:39`, `RepresentationTheory/Invariants.lean:121–137`, `LinearAlgebra/Trace.lean:75, 190`, `NumberTheory/Padics/PadicNumbers.lean:881`, `FieldTheory/Fixed.lean:42–44`, `RingTheory/Spectrum/Maximal/Localization.lean:38`, `RingTheory/WittVector/Isocrystal.lean:112, 179`; Tau Ceti `RingTheory/PowerSeries/Bounded.lean:33, 81`, `RingTheory/PowerSeries/OpenDisc/Basic.lean:54`, `RingTheory/Dagger/WeakCompletion/Basic.lean:81, 185–229`, `RingTheory/Dagger/WashnitzerAlgebra.lean:111–115`, `RingTheory/Dagger/Derivative.lean:44`. Tau Ceti has no Robba ring and no Frobenius lift on these rings.
- Cross-roadmap citations: all 75 parent ids `RD.x.y` are headings at the parent's open head; §§RD.0.9, RD.0.53, RD.1.35, RD.1.41, RD.1.72, RD.3.44, RD.5.8c and RD.5.112 read against their use; RigidAnalyticGeometry Layer 5 and AlgebraicCurves Layer 12 (12A–12C, 12B.0b) read on main; KloostermanSheavesAndBesselIsocrystals cites §MS.4.6 for a statement MS.4.6(i) contains.
- Declared gaps: nine slugs in the README; eight `needs` sentences agree with the plan, the ninth is D01. None asks for what the parent, Mathlib or Tau Ceti states.
- Dependency check: `depcheck: 241 roadmaps, 2192 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside-folder diff empty.
- Gate: every check 0, `OK`. `lake env lean` on `Suggested.lean`: exit 0, no warning. The file has no declaration, so the `#check` comparison and the one-tactic probe have no instance.
- Headline theorems: every theorem of the table's headline column compared with the docstring; all but MS.2.8 are named with the carrier they lack (R02); none is statable at the pins (no Frobenius-equipped coefficient ring, no isocrystals).
- Pull-request text: title, summary block and prose read against the head; nine contracts, seven layers, no declaration, new folder: all as the head shows.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, AdicSpacesPartIV; nothing shared (the parent owns the carriers, slopes and full faithfulness, AdicSpacesPartIV the dagger algebras; no other roadmap states PBQ, saturation, dagger hulls or the Lefschetz condition).

Source independence: 16 passages compared with 6 sources, none shared; largest share TSU, 76 of 106 locators (citation groups led by an author's name); contents compared with TSU: independent (TSU §§2–3 are split over MS.0–MS.2 with CT11, OHK and DAD material, §§4–5 merge into MS.3, §6 splits into MS.4 and MS.6, MS.5 comes from DAD; the order local, curve, finite field is forced by the `*Needs:*` lines of MS.2.5, MS.4.2 and MS.6.2).

## Not verifiable

- DEJONG98 Proposition 6.4 and TSU98 Theorems 4.2.6 and 7.2.3: settled as uncertified, cited by locator only.
- MS.2.8, the K3 zeta-function input behind the slopes `0, 2`: read in TSU lines 1126–1141 only; the primary sources for that surface were not read.
- The two counterexamples to DAD Proposition 4.2.12 in “Corrections to the sources” were not recomputed; MS.5.7 does not use that proposition.

## Source issues

- **Misprint** in TSU at Theorem 3.19(1)(ii), p. 16: the source says the strictly decreasing maximal slopes are those of the nested terms; it should be those of the successive quotients; affects nothing.
- **Error** in TSU at Definition 7.14, p. 34: the source says weights are integers; it should be real numbers, since the rank-one object with Frobenius 2 over the field with 3 elements is irreducible; affects a stated result.
- **Misprint** in TSU at §3.9, p. 21: the source says the support-forgetting map has ordinary rigid cohomology as domain and codomain; it should be compactly supported cohomology in the domain; affects nothing.
- **Misprint** in OHK at Definition 2.9, p. 13: the source says membership of the real index in the filtered ring defines the growth of an element; it should be membership of the element; affects nothing.
- **Gap** in DAD at the proof of Lemma 4.2.7, p. 15: the source says injectivity for the residue field of rational functions follows from Kedlaya's Proposition 4.1; it should be argued separately, that proposition having a complete residue field; affects the proof.

## For the human reviewers

- **Scope.** TSU is cited as arXiv:1910.03871v3; DAD line 665 cites it as [Tsu23], a published version whose numbering was not compared with v3.
- **Licence.** AE was read from an author-hosted PDF (the co-author's university page); README lines 2852–2854 say its page locators are that PDF's, not the journal's.
- **Scope.** README lines 2757–2840 list 35 corrections to the sources; this review verified those at TSU Theorem 3.19, Definition 7.14, §3.9, Lemma B.1 and DAD Lemma 4.2.7, not all 35.
