# Review of PadicDifferentialEquationsAndRigidCohomologyPartII (pull request #2300 at cb67927)

**Verdict:** needs changes

## R01 (P2) — MS.2.8 and `gap:legendre-kummer-extension` do not fix `K`, `σ` and `q`

**Location** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md` line 1327 (MS.2.8) and line 356 (the gap sentence): "Let `p ≡ 1 mod 4`, `C = P¹_(𝔽_p) ∖ {0, 1, ∞}`, `L†` the rank-two overconvergent F-isocrystal `H¹` of the Legendre family".

**Claim** Under Convention 1 (`K` any complete discretely valued field with residue field `𝔽_p`, `q = p^s`), the statement is false for `s ≥ 2`: the unit-root eigenvalue is `π_p^(2s)`, not `π_p²`, and no nonsplit extension by `O(π_p²)` exists.

**Witness** `K = ℚ_p`, `σ = id`, `q = p²` (the datum of the third Check of MS.0.3): Frobenius on `H¹_rig(C, L†(χ))` has eigenvalues `π_p⁴`, `p⁴/π_p⁴`; the `π_p²`-eigenspace is 0. TSU lines 1113–1114 fix `σ = id` on `ℚ_p`, `q = p`.

**Repair** In MS.2.8 write "Let `p ≡ 1 mod 4`, `K = ℚ_p` with `σ = id` and `q = p`, `C = …`", and insert "`K = ℚ_p`, `σ = id`, `q = p`," after "for `p ≡ 1 mod 4`," in the `gap:legendre-kummer-extension` sentence (README and the plan's `needs`). Tested: with `q = p` the eigenvalues are `π_p²`, `p²/π_p²` (TSU line 1138 with `ρ = 1`), slopes 0 and 2.

## R02 (P3) — The description states what the Lean file does not contain, and omits the nine supplier contracts

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** The head contradicts both sentences, and the description does not say that the roadmap asks its supplier for nine statements the supplier does not make yet.

**Witness** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean` lines 81–83: an empty namespace, no declaration; elaboration exits 0 with no warning and no `sorry`. README lines 350–366 state nine `gap:` contracts on PadicDifferentialEquationsAndRigidCohomology.

**Repair** Replace by: "`Suggested.lean` states no declaration: no headline theorem is statable at the pins, and its module docstring names each one and the carrier it lacks." and "the targeted Lake build succeeds with no warning". Add: "The README declares nine supplier contracts (`gap:…`, under *Exact supplier contracts*) that PadicDifferentialEquationsAndRigidCohomology must provide."

## R03 (P3) — Four sentences broken by the substituted gap names

**Location** README lines 971–972 ("of the `gap:extended-log-robba-growth`"), 1336–1337 ("classifies the extensions (" then the slug on the next line), 2236–2237 ("and the `gap:docile-curve-restriction`"), 2832–2833 ("it is a separate input (" then the slug).

**Claim** A slug stands where a noun phrase was, behind an article, or an opening parenthesis ends its line; the sentences do not read and the parenthesis renders with a stray space.

**Witness** Line 972 reads "the log-growth step `Fil_λ R_log = …` of the `gap:extended-log-robba-growth`": a step "of the" a contract name.

**Repair** Line 971–972: "the log-growth step `Fil_λ R_log = ⊕_(j≥0) Fil_(λ−j)R·(log t)^j` supplied by `gap:extended-log-robba-growth`"; line 2236–2237: "and `gap:docile-curve-restriction` (MS.5.8)"; lines 1336–1337 and 2832–2833: put "(`gap:…`)" on one line with no space after the parenthesis.

## R04 (P3) — Page locators of AE and KED05 do not say which version they count

**Location** README lines 2851–2852 and 2855–2856 (References): "Ann. Sci. Éc. Norm. Supér. 52 (2019), 1243–1264; author's PDF" and "J. Algebraic Geom. 14 (2005), 187–192; arXiv:math/0303382v3".

**Claim** The README cites Abe–Esnault at pp. 4, 12, 13, 17 and Kedlaya 2005 at p. 1; neither is a page of the journal article named first, and the entries do not say which pagination is used (the other entries do).

**Witness** AE line 539 (Theorem 2.7) is on page 13 of the 21-page author's PDF; the journal runs 1243–1264. KED05 line 22 (Theorem 1) is on page 1 of the arXiv text; the journal runs 187–192.

**Repair** Append "Page locators refer to the author's PDF." to the AE entry and "Locators refer to arXiv v3." to the KED05 entry.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| PBQ, MS.0.9 (sample) | zero module; `L_1 ⊕ L_0`; logarithmic module | `B(0) = 0`, no slope; `B = M`, slopes {1, 0}; `B` = unit, slope `0 = λmax`. TSU lines 864–866, 920–922; CT11 line 996 (p. 55); OHK lines 1336–1341 | not PBQ, not PBQ, PBQ; locators agree | none |
| Lefschetz condition, MS.6.1 (sample) | `A¹_(𝔽_(p²)) → A¹_(𝔽_p)`, `α = 0`; identity curve | fibre over `α` is `Spec 𝔽_(p²)`: 0 `𝔽_p`-points; identity: 1. TSU lines 1456–1463 (§6.3, p. 28) | README matches (LC); adds `X` smooth, stated | none |
| MS.0.4 rank bound | `E† → E` id; `E† → E²`; `M† = 0` | `1 ≤ 1`; `1 < 2` without spanning; zero gets slopes 0 and 1. Fixed vectors of the first reverse step inject into `(K^σ)^(rank P)` | holds; `M† ≠ 0` needed. TSU 513–539, DAD 568–581 | none |
| MS.0.6, MS.0.7 | logarithmic module | `φ(e_1)·q = e_1` forces `q⁻¹`; `a = −1`, `b = 0`; coefficient norm `p^r` at `n = p^r`: unbounded, nonsplit | third case needs boundedness; CT11 lines 547–554 | none |
| MS.0.7 uniqueness Check | `A = diag(1, q)`, `X = [[1,u],[0,1]]` | `Aφ(X) = [[1, φ(u)],[0,q]]`, `XA = [[1, qu],[0,q]]`; `|φ(u)| = |u| > |qu|` | `u = 0` | none |
| MS.1.1, MS.1.2 | `L_1 ⊕ L_0` | `P_1 = L_1`; grade slopes 1 > 0; `λmax(P_2) = 1`; `Top(G_1) ⊕ Top(G_2) = M` versus `Top(P_1) ⊕ Top(P_2)` two slope-1 lines | grades are right; TSU lines 883, 886 print nested terms | none |
| MS.1.7, MS.1.8 | logarithmic module over `E†` | `F(f_2)(e_1) = q`, `F(f_2)(e_2) = φ(log t) = q·log t`: slope 1, growth 1; `f_1`: 0, 0; `Sol_log,0 = K·f_1` | equals `S_(≤λ)`; OHK lines 716, 1938–1941, 2158–2159 | none |
| MS.2.8 | `q = p`; `q = p²` | eigenvalues `π_p²`, `p²/π_p²` (slopes 0, 2); `π_p⁴`, `p⁴/π_p⁴`, `π_p²`-eigenspace 0 | false for `q = p²` | R01 |
| MS.2.6 | source statement | TSU lines 1019–1031: objects on swapped curves, proof of (1) ends at its hypothesis, (2) cites itself | README's direct proof through MS.0.8 is needed | none |
| MS.3.5 Check | `K = W(𝔽_q)[1/p]`, `φ(e_2) = e_1 + e_2` | constant term of `c − φ(c)` is `a_0 − σ(a_0) = 0 ≠ 1` | nonsplit, reducible top | none |
| MS.3.6, MS.3.7 | logarithmic module and unit | both `B` = unit; `Sat(log) =` unit; ranks 2 and 1 | graded recovery holds; (ii) needs saturation | none |
| MS.4.2 curve rank theorem | `O(−1) ⊕ O(0) → O(0)`; ordinary Legendre; `P = 0` | sections of `O(−1)` killed, `λmax = 1 ≠ 0`; `rank Top = 1 = rank P`; zero has no slope | hypotheses needed as stated; TSU lines 1344–1349 | none |
| MS.4.5 | three slope orders, recomputed | `a < b`: `L†` in kernel of top map; `a = b`: kernel meets `L†` in 0, so 0; `a > b`: `P_1 = L†` | agrees with TSU lines 1408–1417 | none |
| MS.4.6, MS.4.8 | `h = c·id`; log object and unit; `O(1)^∨` | `g† = c·id`; isomorphic tops, ranks 2 ≠ 1; slope `−1 ↦ 1` | TSU lines 1435–1443 | none |
| MS.5.5, MS.5.7 | `M† = E†(0) ⊕ E†(−1)`, `N = M` | `H′ = E(0)`, `H/H′` slope `1 > 0`, `S_min(H) = E(0)`; `rank S_min(M) = rank Top(M^∨) ≤ rank N` | DAD lines 525–526, 582–589, 665–666 | none |
| MS.5.3 Check | `n = 2`, `L_0 ⊕ L_1` | `F² = q²` on induced `L_1`: eigenvalues `±q`; slopes (0, 0, 1, 1) | DAD line 455 omits `S_1` | none |
| MS.5.8 | `P²_(𝔽_(p²))` over `𝔽_p`; Dwork pullback to `A²` | `End` of unit: `K_2`, dimensions 2 = 2; `H⁰`: 0 on `A²`, 1 on the line | DAD 757–764; AE 509–514, 523–524 | none |
| MS.6.6 | `Spec 𝔽_q`, `L(λ)` | both sides `λ^n`; raw fibre gives `n·λ^n` | projector needed | none |
| MS.6.9 | `T² − T − 1` over `ℚ_3`; Frobenius 2 on `Spec 𝔽_3` | values 2, 2, 1 mod 3; weights `±0.876`; weight `2 log_3 2 ≈ 1.26` | `K`-object not pure; real weights. AE 539–540, 747–750; TSU 1923–1925 | none |
| MS.6.10 | `ι(a) = 2i`, `ι(c) = 4` | `ι(c/a) = −2i`; `(1 − 2it)(1 + 2it) = 1 + 4t²`; weights `≤ j < 2d` leave the pole at `q^(−d)` | TSU lines 1830–1859 | none |
| MS.6.13, MS.6.14 | lines with `Top(g′) = 2`, `h = 3` | `h ∘ Top(g′)⁻¹ = 3/2`; composing back gives 3 | TSU lines 1936–1952 | none |
| Convention 4 | `K = ℚ_p`, `q = p²`, eigenvalues `1, p²` | raw (0, 2), normalised (0, 1); parent §RD.1.35 measures with `w(π) = 1`; parent §§RD.3.25, RD.3.34: `O(n)` has `q^(−n)` | conventions agree | none |

- Source locators: 117 mapped to line and page (TSU 46, OHK 29, DAD 17, CT11 13, AE 5, STACKS 4, KED04 2, KED05 1), theorem number and page agree in all; 41 statements read in full against the README.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): `LinearAlgebra/Isomorphisms.lean:39`, `RepresentationTheory/Invariants.lean:126,131,137`, `LinearAlgebra/Trace.lean:75,190`, `NumberTheory/Padics/PadicNumbers.lean:881`, `FieldTheory/Fixed.lean:103`, `RingTheory/Spectrum/Maximal/Localization.lean:38`, `RingTheory/WittVector/Isocrystal.lean:112,179`; Tau Ceti `PowerSeries/Bounded.lean:62,81`, `PowerSeries/OpenDisc/Basic.lean:294`, `Dagger/WeakCompletion/Basic.lean:81,190,229`, `Dagger/WashnitzerAlgebra.lean`, `Dagger/Derivative.lean`. All exist as described.
- Cross-roadmap citations: 74 parent sections (§RD.0.1 … §RD.6.85, including §RD.5.8c) resolve to headings of PadicDifferentialEquationsAndRigidCohomology at its open head; statements read for §§RD.0.9, RD.0.53, RD.1.35, RD.1.72, RD.3.25, RD.3.34, RD.3.44, RD.5.4, RD.5.7, RD.5.8, RD.6.57. AlgebraicCurves Layer 12 (12A–12C, 12B.0b) and RigidAnalyticGeometry Layer 5 exist on main. KloostermanSheavesAndBesselIsocrystals cites §MS.4.6 with the statement made here.
- Declared gaps: nine slugs, the same in the README and the plan; none is provided by the supplier (no log-growth filtration, no Abe–Esnault input, §RD.5.4 has no submodule comparison, §RD.0.53 assumes a complete residue field, §RD.6.85 is `K`-linear). The acceptance of a later round is conditional on them.
- Headline theorems (MS.4.6, MS.4.8, MS.5.7, MS.2.5, MS.4.2, MS.0.7, MS.1.1, MS.1.8, MS.3.7, MS.6.13, MS.6.14, MS.5.8, MS.0.4 and the eight groups of the docstring): none statable; neither pin has an Amice or bounded Robba field with Frobenius and derivation, `(φ,∇)`-modules, or F-isocrystals on schemes. Each is named in the module docstring. No declaration, so no `#check` comparison and no one-tactic probe apply.
- Gate: every check 0, `OK`. Dependency check: `depcheck: 241 roadmaps, 2192 edges, 0 problem(s)`; no UPWARD or CYCLE line. Elaboration of `Suggested.lean`: exit 0, no message.
- Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, AdicSpacesPartIV; nothing shared (weak completions are AdicSpacesPartIV F1's and Tau Ceti's, consumed here as rings; no other roadmap, open or on main, states PBQ modules, saturation, dagger hulls or the minimal slope theorems).
- Source independence: 12 passages compared with 5 sources (TSU, DAD, CT11, OHK, AE), none shared beyond forced wording (longest common run 6 words, the definition of the hull, DAD line 436); largest share TSU, 81 of 127 locator groups; contents compared with TSU: independent (TSU §§2–3 are spread over MS.0–MS.2 with Appendix A, §§4–5 merge into MS.3, §6 splits between MS.4 and MS.6, MS.5 has no counterpart; the order MS.0 → MS.4 is forced by the `*Needs:*` lines of MS.4.1–MS.4.2).

## Not verifiable

- DEJONG98, Proposition 6.4 (`gap:dejong-disc-robba-submodules`): uncertified, text not read.
- TSU98, Theorems 4.2.6 and 7.2.3 (`gap:unit-root-correspondence-perfect-base`): uncertified, text not read; TSU lines 1042–1048 confirm only that Tsuzuki's proof of Lemma 3.32 cites them.
- Katz's correspondence at the generic point (TSU line 1043 cites it): the primary text is not in the manifest; read only through Tsuzuki's use.
- The two counterexamples the README gives against the proof of D'Addezio's Proposition 4.2.12: not recomputed; the proposition is not used.
- The zeta function of the K3 family behind the slopes 0 and 2 of MS.2.8 (TSU lines 1128–1141): taken from Tsuzuki's citation, its sources not read.

## Source issues

- **Misprint** in TSU at Theorem 3.19(1)(ii) and (2), pp. 16–17: the source says the maximal slopes of the nested terms decrease and the bounded quotient is the sum of their tops; it should be the grades `P_i/P_(i−1)` in both places; affects a stated result.
- **Gap** in TSU at Lemma 3.31, p. 19: the source says the direct image of an object on `C` and the pullback of one on `C′`, and its proof of (1) ends at the hypothesis while (2) cites the lemma itself; it should be the pullback from `C` and direct image from `C′`, with a direct proof of (1); affects the proof.
- **Misprint** in TSU at Remark 3.25, p. 18: the source says the growth class is defined by boundedness of the product of the coefficient norm with `(n+1)^λ`; it should be the quotient by `(n+1)^λ`; affects nothing.
- **Misprint** in TSU at §3.9, p. 21: the source says the support-forgetting map goes from `H¹_rig` to `H¹_rig`; it should be from the compactly supported group; affects nothing.
- **Misprint** in TSU at Theorem 6.4, p. 27: the source says `h` is an isomorphism of overconvergent objects into a generic fibre; it should be a convergent isomorphism between the two bounded quotients on the curve; affects a stated result.
- **Misprint** in TSU at the proof of Corollary 6.8, p. 29: the source says the isomorphism on the curve ends at the restriction of `N†`; it should be the restriction of `M†`; affects nothing.
- **Error** in TSU at Definition 7.14, p. 34: the source says weights are integers; it should be real numbers, since Theorem 7.18 otherwise fails for the constant line with Frobenius 2 over `𝔽_3`; affects a stated result.
- **Error** in TSU at the proof of Proposition 7.15(2), p. 35: the source says a lift with target `M†` of an endomorphism of the top of `N`, composed with the inverse of `g′`; it should be an endomorphism `τ` of `N†` and `g′ ∘ τ`; affects the proof.
- **Misprint** in DAD at the proof of Lemma 4.1.4, p. 12: the source says the chain of equalities starts with the sum of the Frobenius pullbacks of the hull; it should be the first slope step of that sum; affects nothing.
- **Misprint** in DAD at Theorem 4.2.6(i), p. 14: the source says the `i`-th reverse grade completes to `S_(m−i)/S_(m−i−1)`; it should be `S_(m+1−i)/S_(m−i)`, as `i = m` shows; affects a stated result.
- **Gap** in DAD at the proof of Lemma 4.2.7, p. 15: the source says injectivity of the multiplication map for the pair with residue field `k(t)` follows from Kedlaya's Proposition 4.1; that proposition is stated for the complete residue field, so the generic case needs its own argument; affects the proof.

## For the human reviewers

- **Scope.** TSU (the source of 81 of 127 locator groups) is cited as arXiv:1910.03871v3; DAD line 561 cites it as [Tsu23], so a published version exists whose numbering was not compared with v3.
- **Licence.** AE was read from an author-hosted PDF (the manifest records the host); the README's page locators count that PDF, not the journal (R04).
- **Scope.** The README's section "Corrections to the sources" (lines 2756–2839) lists 35 corrections to published papers; 11 were checked here against the texts, the rest (among them the two against D'Addezio's Proposition 4.2.12) were not.
