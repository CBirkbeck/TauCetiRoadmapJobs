<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6907206101 -->
Red team round 2 pass b (claude) of 6d0579c

Verdict: needs_changes

1. **F01** (P3) Layer 11 Example on the pro-`q₁` Iwahori level is false for `n = 1`, and its argument depends on the lattice

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:714`: "Take a neat `K`
   whose component at some `q₁ ∈ S` is a pro-`q₁` Iwahori subgroup … For no `N ≥ 3` is `K` contained in
   the principal congruence subgroup `Γ(N)` of a Siegel embedding. If `q₁ | N`, the upper unipotent
   entries of `K_{q₁}` do not all vanish modulo `q₁`."

   **Claim.** For every datum, such a `K` lies in no `Γ(N)`, `N ≥ 3`, of any Siegel embedding.

   **Witness.** The Case 1 datum of `README.md:221` and `:357`: `n = 1`, `B = F = 𝒦 = ℚ(i)`,
   `S = {2, 5}`, `q₁ = 5`. `K_5 = G(ℤ_5) ∩ (1 + 5·O_F ⊗ ℤ_5)`, `K_q` maximal elsewhere; `K` is neat.
   `Λ = ℤ[i]`, `⟨x, y⟩ = Tr(xȳ·i/2)` is self-dual (`⟨1, i⟩ = 1`, `⟨1, 1⟩ = 0`). Then `K ⊂ Γ(5)`, `N = 5 ≥ 3`.

   For `n ≥ 2` the claim is true, but "upper unipotent entries do not vanish modulo `q₁`" presupposes
   a Siegel lattice adapted to the Iwahori, while "of a Siegel embedding" allows any self-dual `Λ`.

   **Repair.** Replace the bullet's first four sentences by:

   > Take a datum of rank `n ≥ 2` and a neat `K` whose component at some `q₁ ∈ S` at which `F` and `G`
   > are unramified is a pro-`q₁` Iwahori subgroup, and whose other components are maximal compact
   > (`S` may contain good primes; `K` is neat once `q₁` is large). For no `N ≥ 3` and no self-dual
   > lattice `Λ` is `K` contained in the principal congruence subgroup `Γ(N)` of `GSp(Λ ⊗ Ẑ)`. If
   > `q₁ | N`: in a factor `GL_n(F_v)`, `v | q₁`, `K_{q₁}` contains `u_j = 1 + E_{j,j+1}` (`j < n`) and
   > `u_n = 1 + q₁E_{n,1}`, with similitude `1`. The product `(u_1 − 1)⋯(u_n − 1)` acts on `V ⊗ ℚ_{q₁}`
   > as `q₁e` for a nonzero idempotent `e` (`E_{11}` on the `v`-part). If every `u_j − 1` sent
   > `Λ ⊗ ℤ_{q₁}` into `q₁Λ ⊗ ℤ_{q₁}`, then `eΛ ⊂ q₁^{n−1}Λ ⊂ q₁Λ`, hence `eΛ = e(eΛ) ⊂ q₁eΛ` and
   > `eΛ = 0` by Nakayama, although `eΛ` spans `eV ≠ 0`. For `n = 1` this fails: the pro-`q₁` Iwahori
   > subgroup of the torus is its principal congruence subgroup of level `q₁`, and `K ⊂ Γ(q₁)`
   > (`B = F = 𝒦 = ℚ(i)`, `q₁ = 5`, `Λ = ℤ[i]`).

   The rest of the bullet (the case `q₁ ∤ N`, and the conclusion) stands. Tested on the witness: the
   repaired text excludes `n = 1` and records it as the negative control. For `n = 2` the product is
   `q₁E_{11}` on the `v`-part and `q₁` times the adjoint of `E_{22}` on the conjugate part, still `q₁`
   times an idempotent; for `n ≥ 3` the conjugate part is `0`.

2. **F02** (P3) `*Needs:*` edge to ArithmeticGaloisDuality R02.2.1 that no route uses

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:166–168` (contract
   "R02.2.1: the Hochschild–Serre spectral sequence in continuous group cohomology"), `:622` (§11.2
   *Needs*), `:723` (Layer 11 Dependencies).

   **Claim.** §11.2 needs ArithmeticGaloisDuality R02.2.1.

   **Witness.** R02.2.1 at its head is `RΓ(G, A) ≃ RΓ(G/H, RΓ(H, A))` for a closed normal subgroup of a
   profinite group. The §11.2 route (`README.md:618`, `:620`) takes its spectral sequences from
   ClassicalAdicEtaleCohomology §1.3 and SchemeAndStackFoundations §2.15 only. `grep R02.2.1` finds no
   other use.

   **Repair.** Delete the subsection "### From TauCetiRoadmap.ArithmeticGaloisDuality" (`:166–168`),
   "ArithmeticGaloisDuality R02.2.1; " from the §11.2 *Needs* line, and "ArithmeticGaloisDuality
   R02.2.1; " from the Layer 11 Dependencies. (Alternative, if the edge is wanted: say in §11.2 which
   step uses a closed normal subgroup of `K_p`; none does now.)

Round 2. Two new findings, both P3 (S01, S02). No P1, no P2. All seven round-1 findings are repaired
at this head; one repair (the Iwahori Example added for `~1b/F01`) introduced S01. No finding is
re-raised from the repair report (none was marked `not actionable in this package`).

## Round-1 findings at this head

| Id | Status | Witness at `6d0579c` |
|---|---|---|
| `~1a/F01` (P2) `u` not recorded | repaired | `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:335`: "there is a place `u` of `𝒦` above `p` (`p = uu^c`) such that, for an `ι_p` compatible with `𝔭`, the following holds at every prime `𝔭_i` of `F` above `u`"; "through the same `u`" at `:295`, `:346`, `:670`, `:701`; Check at `:356`. Recomputed: `{1,2,4}`, `p ≡ 7 (11)`: ratios `2,4,2,6,3,6`, none in `{1,7}`; `{1,1,1}`: ratio `1`. Independence of `ι_p` rechecked: `S_i′ = gS_i` at the same `𝔭_i`, `p_{gτ} = p_τ` for `g` fixing `E`. |
| `~1a/F02` (P3) `S′` in Case 1 | repaired | `README.md:637`: "In Case 1 put `S′ = S ∪ {∞, p}`, so that `S′_fin = S ∪ {p}`, `𝕋^{S′_fin} = 𝕋^{S∪{p}}`". Consistent with `:656` ("In Case 1, use §10.4 with bad set `S ∪ {p}`"). |
| `~1a/F03` (P3) "Theorem 1.1(1)/(2)" | repaired | `README.md:650` "Theorem 1.1, first assertion, and Remark 1.2"; `:736` "§11.7(2), which is that of the second assertion of [CS17] Theorem 1.1 (CS17 lines 92–95)"; `Suggested.lean:63`. `grep '1\.1('` on both files: no hit. CS17 lines 89–95 read: one unnumbered theorem. |
| `~1a/F04` (P3) AL.3 | repaired | `README.md:142`, `:449`, `:451`, `:498` cite "AL.3.7.2"; supplier head has `#### AL.3.7.2 Strong multiplicity one for isobaric sums`. |
| `~1a/F05`, `~1b/F02` (P3) §§6.23, 6.25 edges | repaired | `README.md:510` (§10.1 *Needs*, no 6.23), `:551` ("§6.8" only), `:591` (no 6.23, 6.25), `:83` ("cited only as a special case … no target here depends on it"), `:549`. "Only when `n = 1`" rechecked: a division algebra of degree `n ≥ 2` over the totally complex `F` ramifies at two finite places. |
| `~1b/F01` (P2) small level | repaired; the added Example is S01 | `README.md:616` §11.2(c), proof `:620`; `:626` and `:644` state "`K^p` small enough"; `:654` and `:670` begin with the reduction. Rechecked: `S ≠ ∅`; `K ∩ Γ(N) = (K_S ∩ Γ(N)_S) × K^S`, so the core keeps `K_q` for `q ∉ S`; `Z(ℚ) ∩ K` is torsion (units of `F` of absolute value 1), trivial for neat `K`, so the covering group is `K/K_N`; `H^a(K/K_N, M)_𝔪 = H^a(K/K_N, M_𝔪)`. PerfectoidShimuraVarieties §2.2 at its head asks "inside a level-N subgroup with `N ≥ 3` prime to `p`". |

## Adversarial pass: record

Dependency check (the command of the brief, run on this head):

    depcheck: 244 roadmaps, 2287 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

Lean: no elaboration was run (read-only pass). The four elaborated types of `scratch/signatures.md`
were compared with README §§8.7–8.8: every declaration carries `[NumberField F] [NumberField L]
[IsGalois F L] [Field k] [Finite k] {n}` in its own signature; nothing changed since round 1 except
docstrings.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsStrongGenericAt` (Lean :47; §8.7) | `n = 0, 1`; `v ∣ ℓ`; `Q = ⊥`; ramified `Q` with `r` trivial on inertia; `{3,3}`, `{1,2}`, `{1,7}` at `q_v = 7`, `ℓ = 11` | `n = 0`: charpoly `1` = empty product; `n ≤ 1`: no pair; `(ℓ : 𝓞 F) ∈ v` fails clause 2; `⊥` lies over no maximal `v`; `3/3 = 1` fails; `2, 6 ∉ {1,7}` passes; `7/1 = 7` fails | equals CS17 Definition 1.9 (`∉ {1, q}`, CS17 line 153) |
| `IsCompletelySplitStrongGenericPrime` (Lean :66) | `F = ℚ(i)`, `p = 5, 3, 2`; `p = ℓ` | `ncard = 2, 1, 1` against `finrank = 2`; `p = ℓ` fails at every `v ∣ p` | complete splitting encoded; `p ≠ ℓ` forced |
| `infinite_setOf_isCompletelySplitStrongGenericPrime` (Lean :80; §8.8(a)) | `n = 0`; `L` ramified above `p₀`; `F` not Galois | class `C` of `Frob_{p₀}` in `Gal(L̃/ℚ)` lies in `Gal(L̃/F̃)`; for `p` with class `C`, `{gσg⁻¹|_{L_r}}` is the same set of `Gal(L_r/F)`-classes and `p ≡ p₀ (ℓ)`; inertia of `L/F` at `Q` maps to `1` in `Gal(L_r/F)` | true |
| `infinite_setOf_isStrongGenericAt_degree_one` (Lean :92; §8.8(b)) | `v₀` of degree `f > 1`; `v₀` ramified in `L` | class of `Frob_{v₀}` in `Gal(L_r(ζ_ℓ)/F)` fixes `r(Frob_v)` up to conjugacy and `q_v ≡ q_{v₀} (ℓ)`; degree-one places have density one | true |
| §8.1 SV3 criterion, dimension | `n = 1`; `(1,1)`; `(2,0)/(0,2)` quaternion datum at `5`; `[F⁺:ℚ] = 2`, `(1,2),(0,3)` | `G^ad = 1`; `z/z̄ ≠ 1`; `5 = (2+i)(2−i)`, index 2 at both places; `d = 2`, all four embeddings give `4` | sound |
| §8.3(5), Checks | `S_i = {τ, τ′}`, `(1,1)`, `(2,0)` | bound `diag(t², t)`, `κ = −3`; `μ_{i,τ}⁻¹`: `−1`; `det p = +2`; `⟨2ρ, ((0,−1),(−1,−1))⟩ = 1 = ⟨2ρ, ((−½,−1),(−½,−1))⟩` | sound |
| §8.4 Satake image of `P_v` | general `i`; `n = 2` | `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; constant term `q·x_1x_2` | sound |
| §8.5(1)–(3), Checks | `q = 7`, `ℓ = 11`, `{1,2}`, `{3,6}`; `deg` at `q = 5`, `ℓ = 3`; `𝔽_9` | `7⁻¹ = 8`, `T_2 ≡ 5`; `5⁻¹ = 9`, dual `X² − 5X + 8`, roots `7 + 9 = 16 ≡ 5`, `63 ≡ 8`; `7·3⁻¹ = 28 ≡ 6`, `7·6⁻¹ = 14 ≡ 3`; `X² − 6X + 5`: mod 5 roots `{0,1}`, mod 3 `X² + 2`, `{1,2} ↦ {2,1}`; `a⁻¹ = a³ = −a`; arithmetic convention `{8, 4}` | sound |
| §8.6(1) | residue field `ℚ` (`𝕋^S → ℚ` surjective); `𝔪 ∌ ℓ` | `ℓ^r ∉ 𝔪`, both localizations `0` | sound |
| §8.7 auxiliary pair (repaired) | `u` and `u^c`; two `ι_p` | above; `S_i′ = gS_i` | sound |
| §8.8(b) consequence | degree-one `v`, `p ∉ S` | `F_v = ℚ_p`, `S_i = {τ₀}`; `τ₀c` over `u^c`; `p` unramified of degree one in `𝒦`, so split | sound |
| §8.9 Checks | `ℤ[T]/(T⁴−1)`, `ℓ = 5`; `𝔪_2`, `ℓ = 3`; `(2,0),(0,2)` inert | `2² = −1 (5)`; `T + 2 ≡ 4` unit mod `𝔪`, acts by `2 − i ∈ 5ℤ_5`; `ℤ_3 ⊗ ℤ_(2) = ℚ_3` (`3` is odd, so inverted); average `(−½,−½)`, class of `p⁻¹` over `F_𝔭` | sound |
| §9.2, §9.5, §9.6 | `GL_2`, `(1,1)`; ordered pairs | `LJ(Ind) = 0`, `LJ(1) = −1_{D^×}`; non-ordinary factor has a fractional slope over `F_{𝔭_i}`; (ii) excludes `|·|^{±1}` both ways | sound |
| §9.4, §10.5 normalization | trivial rep of `GL_2`, `q = 7` | `√7·√7 = 7`, `√7/√7 = 1`; `S(T_1) = 8` | sound |
| §10.1 local-index argument | central `γ`; `d_v ∤ n₁` | `d·m_ie_i = k·e_i g d′²`, `d′ = d/g`, so `m_i = kd′`; `(X − γ)^n` | sound |
| §10.3 | `n = 1`; `GU(1,1)`; Harris–Taylor | `ep(1) = 1` (full pair `0`); `2` (`K_max`: `1`); `∏ binom(n, p_τ) = 1, 2, n`; `(−1)^{q(G)}` twice | sound |
| Conventions, integral localization | `M_𝔫` with `𝔫 ∩ 𝕋^S ≠ 𝔪` | `t ∈ 𝔫 ∩ 𝕋^S ∖ 𝔪` nilpotent and inverted: `(M_𝔫)_𝔪 = 0` | `C_𝔪 ⊗^L 𝔽_ℓ = (C ⊗^L 𝔽_ℓ)_𝔪` holds |
| §11.2(c) (new) | `S = {2}`; `K ⊂ Γ(N)`; `d = 0` | `N = 4`; `K_N = K`; second assertion empty | sound |
| §11.4(1) against the parent's §4.5 | torsion versus localization | parent states `H^i(Ig^b)[𝔪]`; for a union of finite modules `M[𝔪] ≠ 0 ⇔ M_𝔪 ≠ 0`; `Γ_m = 1 + p^m End` pro-`p` | sound |
| §11.4(2)–(3) | `m ≥ 1` | `RHom(M[−d_b], ℤ_ℓ)[−2d_b] = M^∨[−d_b]`; one degree, no cancellation | sound |
| §11.6 step 4 | minimal `b` ordinary | `d_{b′} ≥ d` and `≤ d` | sound |
| §11.8(2) | `H^*(S_{K′})_{𝔪^∨} ≠ 0` | duality gives `H^*(S_{K′})_𝔪 ≠ 0`, so the hypothesis reaches `𝔪^∨` | sound |
| Layer 11 Example, Iwahori (new) | `n = 1`, `q₁ = 5`, `ℚ(i)`; `n = 2`; `N = 6` | `K ⊂ Γ(5)`; `q₁e`, `e ≠ 0`; `3 ∥ 6`, `−1 ≢ 1 (3)` | **S01** |
| Worked examples | `p` split / inert in `F⁺` | `(e,f,g) = (1,1,4)`, `(1,2,2)`; `c_1 = 1` or `0` | sound |

Headline theorems (README): CS17 Theorem 6.3.1(1) (§11.5), 6.3.1(2) (§11.6), Theorem 1.1 (§11.7),
Remarks 1.3 and 1.7.1 (§11.8), Theorem 5.5.7 (§9.6), Corollary 5.6.3 (§10.6). None is statable at
the pins (no PEL moduli, étale cohomology of varieties with Hecke action, Igusa varieties,
`B(G, μ⁻¹)`); each is named in the module docstring with the missing carrier. Statable and stated:
§8.8(a), (b). Padding probe by reading: both theorems need Chebotarev's density theorem, which
neither pinned library states (`grep -i chebotarev` finds no theorem in Mathlib; Tau Ceti's
`NumberTheory/ClassFieldTheory/Global/FrobeniusGeneration.lean` says it avoids it); the two
definitions are used by both theorems. No padding.

Ownership: `roadmaps grep` for the four Lean names finds no match on main or in any open roadmap
pull request. `roadmaps grep 'Theorem 6\.3\.1'` finds no other roadmap stating the CS17 end
theorems. AutomorphicGaloisRepresentationsPartII AG2.7 «Strong local decomposed genericity» and
«Infinitely many decomposed generic primes» were read at the head; the scope paragraph
(`README.md:11`) describes both correctly (local predicate; existence for the ratio-`q` predicate
`FiniteModelDecomposedGenericPrime`).

Declared gaps: the three slugs are in `design/plan.json` `gaps` with suppliers and sections
`AG2.2`, `§6.3`, `AG2.7`, the same as `README.md:89`, `:98`, `:99`. Supplier §6.3 at its head still
gives only finiteness of `Ram_ℚ(ϖ)`; «Unitary discrete-parameter export» exists at AG2.7. Not raised.

Arrangement: 74 of 88 bracketed citations are to CS17. Its contents: §§1–4, 5.1–5.6, 6.1–6.3. Pairs
by number: Layer 9 ↔ §§5.2–5.5, Layer 10 ↔ §5.6, Layer 11 ↔ §6.3 with §1; Layer 8 draws on §§1, 5.1,
5.4, 6.2, 6.3 and has §8.9, which CS17 lacks. One layer of four pairs with a single section. The
order is forced by §10.6 *Needs* §§9.2, 9.5; §11.4 *Needs* §§9.3, 10.3; §11.6 *Needs* §§9.6, 10.6;
inside Layer 9, §9.5 (Lemma 5.5.8) precedes §9.6 (Theorem 5.5.7), the reverse of the source.

Wording: 12 passages put beside CS17 (Theorem 1.1, Remarks 1.3, 1.5, 1.7, Definition 1.9,
Definition 6.2.1, Cases 1–2 of §6.3, Theorem 6.3.1(2), Remarks 6.3.2–6.3.3, Proposition 5.6.1,
Corollary 5.6.2, Corollary 5.6.3) against §§8.1, 8.7, 8.8, 10.1, 10.3, 10.6, 11.7, 11.8, the Layer 11
Examples and both theorem docstrings. Longest shared run: "at most one `τ`" with the formula
`p_τq_τ ≠ 0`, a hypothesis the mathematics forces. No table, figure or list taken over.

Source independence: 12 passages compared with 1 source (CS17; the four Shin texts were compared in round 1 and their cited passages are unchanged), none shared; largest share CS17, 74 of 88 locators; contents compared with CS17: independent (one layer of four pairs with one section; order of Layers 9–11 forced by the dependency lines named above).

## Verified sound

- Declarations read: 4 of 4 (`Suggested.lean`, all 98 lines). Single `import Mathlib`; namespace
  `TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII`; no `set_option`, `lemma`, `#eval`,
  sorry'd data or `True` placeholder; docstring on every declaration.
- README: all 746 lines read. Targets read: 29 (§§8.1–8.9, 9.1–9.6, 10.1–10.6, 11.1–11.8).
- Locators verified against the cached text this round: 25, all in CS17 (lines 84–115, 124–132,
  147–153, 3676–3682, 4060–4111, 4324–4342, 4360–4442). None wrong.
- Checks and worked values recomputed: 28 (table above). One false (S01). Every definition has at
  least three Checks (§8.1: 9; §8.3: 5; §8.4: 4; §8.5: 7; §8.7: 7; §8.9: 6; §9.4: 4; §10.3: 4;
  §10.5: 4).
- Sibling citations: 141 cited ids at 20 roadmaps resolved to a heading or named target, on main
  (SchemeAndStackFoundations, IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups,
  ArithmeticLocallySymmetricSpaces, ComplexComparisonPartII) or at the open heads through
  `roadmaps show`; none missing (`R15.5` is the supplier's own layer identifier). Statements read
  against the README this round: 17 (PerfectoidShimuraVarieties §2.2; PELModuli §§M1.9, M1.13, M6.1;
  IgusaVarietiesAndTorsionConcentration §§0.11, 3.17, 4.5; SchemeAndStackFoundations §2.15;
  ArithmeticGaloisDuality R02.2.1; ArithmeticGaloisRepresentations §§5.1, 5.9;
  EndoscopicTransferAndUnitaryTraceComparison §6.3; AG2.7, two targets; ClassicalAdicEtaleCohomology
  §§1.3, 1.4; SR.5.2 «Modular generic segments»).
- Pinned declarations found: `IsArithFrobAt` for a group element (`Mathlib/RingTheory/Frobenius.lean`),
  `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`, an `abbrev` for
  `I.toAddSubgroup.inertia G`, which is the form `Suggested.lean:52` writes), `Ideal.primesOver`,
  `Ideal.LiesOver` (`Mathlib/RingTheory/Ideal/Over.lean:379`, `:128`), `NumberField.IsCMField`,
  `NumberField.maximalRealSubfield`, `Mathlib/NumberTheory/HeckeRing/Defs.lean`,
  `instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`),
  `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`
  (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`).
- Policy: `git diff --name-only origin/main...HEAD` lists only files under
  `packages/IgusaVarietiesAndTorsionConcentrationPartII/`. No pull-request number, process word or
  machine path in the README, the Lean file or `sources.toml`. `scratch/citations.md` lead
  `LocallySymmetric.FrankeInput`: a hypothesis name of ArithmeticLocallySymmetricSpaces ALS.5b.4 on
  main, not a pinned declaration; no finding. `scratch/overlaps.md`: no shared roadmap, dropped id
  or second copy.

## Not verifiable

- The truth of the three declared gap statements (contracts, by the brief's rule).
- The four Shin texts were not reopened this round; their locators were verified in round 1 and the
  citing passages are unchanged by the repair.
- Journal pagination of Shin09, Shin12 and Shin-BCU: only author copies are cached, as the README says.
- The `(𝔪_G, K_∞)` reindexing of ALS.5b.4 by `π ↦ π ⊗ (ω ∘ ν)` (Conventions) beyond `GU(1,1)`.
- PELModuli §M6.1 is stated for levels inside `G(Ẑ^□)`; that a general neat `K = K_SK^S` is brought
  there by a `K`-stable lattice was checked by argument, not against a supplier statement.
- No Lean was elaborated; signatures are those of `scratch/signatures.md`.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the
  indexed heads (2026-11-16T04:02:03Z) only.

## Source issues

- **Misprint** in CS17 at Theorem 6.3.1(1), p. 757 (CS17 lines 4402, 4407): the source says the similitude factor at a prime `q` is the `p`-adic unit group inside the `p`-adic numbers; it should be the `q`-adic units inside the `q`-adic numbers; affects nothing.
- **Misprint** in CS17 at Corollary 5.6.3, p. 750 (CS17 line 4103): the source says `S_i` is defined by composing `ι_p` after `τ`, which is not defined; it should be `ι_p⁻¹` after `τ`; affects nothing.
- **Misprint** in CS17 at Remark 6.3.3, p. 758 (CS17 line 4432): the source says exactly one embedding has nonzero signature product; it should be two, conjugate to each other, exactly one of them in the union of the `S_i`; affects nothing.
- **Misprint** in CS17 at §5.6, p. 749 (CS17 lines 4077–4078): the source says the extension from acceptable functions is Lemma 6.4 of Shin's 2011 paper; it should be Lemma 6.4 of Shin's "Counting points on Igusa varieties"; affects nothing.
- **Gap** in CS17 at proof of Theorem 6.3.1, p. 758 (CS17 lines 4439–4441): the source says the least nonvanishing degree at finite level is a nonvanishing degree at infinite level at `p`; it should give only some degree at most that one, since hyperspecial `K_p` has higher mod `ℓ` cohomology; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6d0579cb1e1aee23ca2a838f90a1942ed9825c9b", "job": "RT-IgusaVarietiesAndTorsionConcentrationPartII~2b", "model": "fable", "worker": "chris-x79"} -->
