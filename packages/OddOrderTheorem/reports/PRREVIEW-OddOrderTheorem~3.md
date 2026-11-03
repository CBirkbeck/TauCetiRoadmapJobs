# Review of OddOrderTheorem (pull request #1777 at d5131ed)

**Verdict:** needs changes

**Previous findings.** All nine findings of the review at 1812f9e are repaired at this head. R01/R02: the header is now `module` / `public import Mathlib` / two `public import TauCeti.*` lines and the worker's gate reports `build=0 imports=0 mathlib-subimports=0 no-import-mathlib=0`. R03: the README has `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (five subsections), `## How to read the build`, `## Layer 0`–`## Layer 6` with `### k.n` prose targets, `*Needs:*` lines, `**Checks.**` lists, `### Examples`/`### Dependencies` per layer, `## Downstream consumers`, `## References`. R04: every target now carries theorem numbers (I resolved every one in the sample below). R05: "`T` is of type II" is now §5.3, after §5.2's overgroup `L`, and §4.4 keeps only (13.2). R06: no pull-request numbers, links or "Coordinate" sentence remain (`grep` of the README for `#[0-9]`, `pull request`, `Coordinate`, `prototype`: empty). R07: the docstring is in the required form and names the headlines that are not statable with what each lacks; `exists_dadeExtension` carries `[Fintype G]` only. R08: `familySpan`, `coherenceDomain`, `IsCoherent`, `sigmaPrimes` are gone and the reusable export `isDadeExtension_eq_indClassFunction` is stated. R09: all ten Lean names occur in the README (lines 12–15, 30, 96, 223, 407, 442, 445, 475, 897).

The two blocking findings are transcription errors in Layer 2 targets: (6.3) is stated without its hypothesis and with the wrong conclusion, and (4.3)'s degree congruence is stated as an equality that the README's own Check refutes.

## R01 (P2) — Theorem (6.3) is stated without its hypothesis and with the wrong conclusion

Location: `TauCetiRoadmap/OddOrderTheorem/README.md` lines 534–536: "for `K ⊴ L` and the induced families `S(H₁)` of §4.1, the coherence of `S(H₁)` with `H ⧸ M` nilpotent and `|H : H₁| > 4 |L : K|² + 1` (Theorem (6.3))".

Claim: Theorem (6.3) concludes that `S(H₁)` is coherent from the nilpotence and the inequality.

Witness: MC-PFsection6 lines 119–126 (`bounded_seqIndD_coherence`): hypotheses `M, H, H₁ ⊴ L`, `M ≤ H₁ ≤ H ≤ K`, `H ⧸ M` nilpotent, **`S(H₁)` coherent**, `|H : H₁| > 4|L : K|² + 1`; conclusion **`S(M)` coherent**. The coherence of `S(H₁)` is an input, and the output is the larger family `S(M)`. The Check at lines 543–546 reads the theorem the same wrong way (it treats `H₁ = M = 1`, where input and output coincide and the theorem says nothing). The same paragraph's (6.8) drops the second alternative's conditions: MC-PFsection6 lines 575–582 require, in case (c2), a `W₂` of **prime order with `W₂ ≤ H'`** and the prime Dade hypothesis of (4.6) for `(G, L, H, H, H^#)`, not merely "carrying a prime T.I. configuration of §2.8".

Repair: state (6.3) as "if `S(H₁)` is coherent, `H ⧸ M` is nilpotent and `|H : H₁| > 4|L : K|² + 1`, then `S(M)` is coherent (`M ≤ H₁ ≤ H ≤ K`, all normal in `L`)"; replace the first Check by an instance with `M < H₁`, for example `L = C₇ ⋊ C₃`, `K = H = C₇`, `H₁ = C₇`, `M = 1`: `|H : H₁| = 1 > 37` fails, so (6.3) does not extend the (trivially coherent) empty family `S(C₇)` to `S(1)`, and Sibley's (6.8) is what gives coherence of `S(1)`. For (6.8) write the second alternative as "a prime Dade configuration (§2.8) for `(G, L, H, H, H^#)` whose `W₂` has prime order and lies in `H'`".

## R02 (P2) — the `μ_ij` of Theorem (4.3) do not have degree `|W₁|`

Location: `README.md` lines 586–588: "the characters `μ_ij = Ind_W^L w_ij`-related irreducibles of `L` of degree `|W₁|`"; the Check at lines 603–604.

Claim: each `μ_ij` is an irreducible character of `L` of degree `|W₁|`.

Witness: MC-PFsection4 line 415 (`prTIirr1_mod`, Theorem (4.3)(d)): `μ_ij(1) ≡ δ_j (mod |W₁|)`, and line 548 (`prTIirr_1`): `μ_ij(1) = μ_0j(1)`. The degree is a congruence, not a value. The README's own third Check computes the instance `L = W = C₃ × C₅` where `μ_ij = w_ij` has degree `1 ≠ 3`, and then says the clause "is about `L ⊋ W`"; it is not: (4.3) is stated under Hypothesis (4.2) alone (MC-PFsection4 lines 148–152), which the instance satisfies.

Repair: replace "of degree `|W₁|`" by "with `μ_ij(1) ≡ δ_j (mod |W₁|)` and `μ_ij(1)` independent of `i`"; rewrite the third Check as: "for `L = W = C₃ × C₅`, `μ_ij = w_ij` has degree `1 ≡ δ_j = 1 (mod 3)`; a wrong statement giving the degree `|W₁| = 3` fails here".

## R03 (P3) — two Checks miscount the degree of `Ind ω − Ind ω²`

Location: `README.md` lines 400–401 ((1.4) Check: "`Ind ω − Ind ω²` is a difference of two distinct irreducibles of degree `3`") and 466–467 (§2.3 Check 4, the same claim).

Witness: in `G = C₇ ⋊ C₃` with `L = C₃`, Frobenius reciprocity gives `⟨Ind ω, μ⟩ = ⟨ω, Res μ⟩`, which is `1` for exactly one linear character `μ_ω` of `G` (the three linear characters restrict bijectively to `L`) and `1` for each of the two degree-3 characters (their restriction to `L` is the regular character `1 + ω + ω²`, since they vanish off `C₇`). So `Ind ω = μ_ω + χ₁ + χ₂`, `Ind ω² = μ_{ω²} + χ₁ + χ₂`, and `Ind ω − Ind ω² = μ_ω − μ_{ω²}`: a difference of two distinct **linear** characters, norm `2` as stated, values `ω − ω²` on `L^#` as stated.

Repair: "of degree `1`" in both Checks; the conclusions (norm `2`, `(T f)(a) = f a`) stand.

## R04 (P3) — the (1.8) Check uses the wrong `D`

Location: `README.md` lines 402–403: "(1.8) on `G = S₃`, `C = A₃`, `B = D = 1`: `χ(1) ≤ 2 · 1 = 2`".

Witness: the bound is `|G : C| · √|C : D|` (MC-PFsection1 lines 552–555); with `D = 1` it is `2 · √3`, not `2`. The value `2` needs `D = C = A₃` (`D ⧸ B = A₃` is central in `C ⧸ B = A₃`).

Repair: "`B = 1`, `D = C = A₃`: `χ(1) ≤ 2 · √1 = 2`".

## R05 (P3) — `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` is not the smallest odd-order group of `p`-length two

Location: `README.md` lines 363–364 (Layer 1 Examples): "the group `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` as the smallest odd-order witness that `p`-length two occurs".

Witness: `C₁₃ ⋊ C₃` (`3 ∣ 12`) has the faithful irreducible `𝔽₃`-module `𝔽₂₇` of dimension `3` (the order of `3` modulo `13` is `3`, and `C₃` acts as the Frobenius `x ↦ x³`), so `X = 𝔽₃³ ⋊ (C₁₃ ⋊ C₃)` has odd order `27 · 39 = 1053`, `O_{3'}(X) = 1` (a normal `3'`-subgroup meets `V` trivially, hence centralizes `V`, hence is trivial by faithfulness), `O_3(X) = V`, `O_{3,3'}(X) = V ⋊ C₁₃` and quotient `C₃`: `3`-length two. `1053 < 3⁷ · 7 = 15309`.

Repair: drop "smallest", or use `𝔽₃³ ⋊ (C₁₃ ⋊ C₃)` as the witness (its `3`-rank is `3`, so §1.2's hypothesis still excludes it).

## R06 (P3) — §2.4's forward direction needs `A` nonempty

Location: `README.md` lines 472–473: "for a Dade datum with `H a = ⊥` for every `a ∈ A`, the set `A` is a trivial-intersection set with normalizer `L` (`TauCeti.IsTISet A L` and `N_G(A) = L`)".

Witness: `A = ∅` is a Dade datum for every `L` (all clauses vacuous), `TauCeti.IsTISet ∅ L` holds, but `N_G(∅) = G ≠ L` for `L ≠ ⊤`. Peterfalvi (2.3) is an equivalence with `A ≠ ∅` on the right (MC-PF2 lines 174–175: `reflect (A != set0 /\ {in A, forall a, H a = 1}) (normedTI A G L)`). The Lean theorem is unaffected (`supportedClassFunctions L ∅ = {0}`).

Repair: "for a Dade datum with `A ≠ ∅` and `H a = ⊥` for every `a ∈ A`".

## R07 (P3) — the "multiplicity" of §3.1 is not `sigma_length`

Location: `README.md` lines 637–640: "the multiplicity of `x` as the cardinality of that finite set (§14, `sigma_mmax_of`, `sigma_length`)".

Witness: MC-BGsection14 lines 86–90: `sigma_mmax_of X = {M maximal | X ≤ M_σ}`, but `sigma_length x = |{x_{σ(M)} : M maximal} \ {1}|`, the number of distinct nontrivial `σ(M)`-parts of `x`, not `|sigma_mmax_of ⟨x⟩|`; Theorem 14.4 (line 871–874) relates the two only under `ℓ_σ(x) = 1`.

Repair: define both objects under their names (`M_σ[x]` and the `σ`-length `ℓ_σ(x)`), and cite 14.4 for `|R[x]| = |M_σ[x]|` when `ℓ_σ(x) = 1`.

## R08 (P3) — (1.5)(a) is about the restriction, not the induced character

Location: `README.md` lines 797–798: "an induced irreducible is irreducible iff its inertia group is `K`, and in general it is `|I_M(χ) : K|` times the sum over the `M`-orbit of `χ`"; Check 2 at lines 815–817 ("equals `|I : K| = 3` times the sum of its single constituent").

Witness: MC-PFsection1 lines 262–264: `Res_K (Ind_K^M χ) = |I_M(χ) : K| · Σ_{orbit} χ^m`. For `M = C₃ × C₃`, `K = C₃ × 1`, `Ind χ = λ₁ + λ₂ + λ₃` (three distinct extensions, multiplicity one each), while `Res_K Ind χ = 3χ`.

Repair: "its restriction to `K` is `|I_M(χ) : K|` times the sum over the `M`-orbit"; in the Check, "its restriction to `K` is `3χ`, while `Ind χ` is the sum of the three extensions of `χ`".

## R09 (P3) — §2.6 needs §2.8, which comes after it

Location: `README.md` line 539: "*Needs:* §2.3, §2.5, §2.8"; §2.8 is at line 581.

Witness: (6.8)'s second alternative is the prime Dade configuration of §2.8 (MC-PFsection6 lines 579–581); no cycle (§2.8 needs §2.3 and §2.7 only), but a target needs a later one (defect class 11).

Repair: order Layer 2 as §§2.1–2.5, 2.7 (cyclic isometry), 2.8 (prime configurations), 2.6 (coherence theorems), or split (6.8)'s prime case into §2.8.

## R10 (P3) — wording and locator notes

- Line 170: "L3's starred theorems": LocalFiniteGroupTheory marks them with a dagger (†), not a star (its L3 header, "Where marked †").
- Line 627: "(§5, the definition of narrow)": Bender–Glauberman define narrow `p`-groups through the centralizer of a subgroup of order `p` (`S × C` with `C` cyclic); the rank-two maximal elementary abelian subgroup the README uses is their Theorem 5.3 characterization (MC-BGsection5 lines 20–36). Cite "§5, Theorem 5.3".
- Lines 735–737: "the normalizer `N_G(D)` equals `N` iff `N_G(D) ≤ N`" contradicts the Conventions (line 113: `N_G(D) = N` follows from the data). It does follow: `N ≤ N_G(D)` by `conj_mem`, and `g ∉ N` gives `gDg⁻¹ ∩ D = ∅ ≠ D` for `D ≠ ∅`. State the equality, not the iff.
- Lines 589–591: the prime Dade configuration (4.6) also requires `A ⊆ K \ {1}` (MC-PFsection4 line 714).
- Lines 852–853: (7.10) holds for **some** Frobenius maximal subgroup (`exists i`, MC-PFsection7 line 661), not for each.
- Lines 1065–1066: neither `TauCetiRoadmap/CFSGStatement/README.md` nor `TauCetiRoadmap/CFSGBasicProperties/README.md` on main mentions the odd order theorem or either Lean name (`grep` empty); the open head of CFSGBasicProperties mentions Feit–Thompson only as a source prerequisite. Say "may consume" or drop the two names.

## Verified sound

**Gate and build.** Worker's gate at d5131ed: every counter `0`, `OK`. My plain run of the gate command: identical counters except `depcheck=1 NOT IN ORDER: OddOrderTheorem`, which is the structural result for a roadmap not yet in the repository's merge order (the worker's run uses the candidate order, where it is line 374). Dependency check with the candidate order and `--movable`: `depcheck: 205 roadmaps, 1653 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.

**Pins.** `lake-manifest.json` pins mathlib `f6090c7` and Tau Ceti `358314d`; the shared packages directory is at the same revisions (`git log -1` in both).

**Elaboration and signatures.** A scratch copy of `Suggested.lean` with `#check @` for all ten declarations and `#check @` for all 86 Mathlib and Tau Ceti names in the supplier tables elaborated with `lake env lean`: exit 0, the six `declaration uses 'sorry'` warnings only, every name resolved. The elaborated types coincide with the worker's `signatures.md`; each theorem keeps `[Finite G]` or `[Fintype G]` in its own signature, and the three definitions are total. Three Tau Ceti names whose object files are not built in the packages directory were checked in source instead: `TauCeti.frobeniusKernel` (`TauCeti/GroupTheory/FrobeniusKernel.lean:145`), `TauCeti.frobeniusKernelSubgroup`, `coe_frobeniusKernelSubgroup`, `frobeniusKernelSubgroup_normal`, `frobeniusKernel_isComplement'` (`RepresentationTheory/FrobeniusGroup/Basic.lean:238–261`), `TauCeti.ClassFunction.indExtend` and `characterPairing_indExtend_indExtend` (`Induction/ExceptionalCharacter.lean:115, 270`).

**Padding probe.** Each of the six `sorry`s replaced by `first | simp_all | infer_instance | omega | decide` on a scratch copy: all six fail (five "expected type must not contain free variables" from the last alternative after the others failed, `appendixC_prime_le` "unsolved goals"). Nothing closes in one tactic, nothing mirrors a Check or computes a value.

**Library declarations opened at the pin.** `Subgroup.indClassFunction` (`TauCeti/RepresentationTheory/Induction/ClassFunction.lean:456`) is the coset sum `Σ_{t ∈ G ⧸ S} f°(t⁻¹ g t)` without division (`:190–202`), so it is the standard induced class function used in R03/R06 and in `isDadeExtension_eq_indClassFunction`. `TauCeti.ClassFunction.characterPairing` (`CharacterTable/Pairing.lean:58–61`) is `(Nat.card G)⁻¹ ∑ g, f₁ g · f₂ g⁻¹`, as the Conventions say. `TauCeti.IsTISet` (`GroupTheory/TrivialIntersection.lean:194–201`) has exactly the three fields the README lists. `TauCeti.IsFrobeniusComplement` (`:326`) is a structure with `ne_bot`, `ne_top` and the T.I. field. `FiniteField.algebraMap_norm_eq_pow`: `algebraMap K K' (norm K x) = x ^ ((Nat.card K' − 1)/(Nat.card K − 1))`; `FiniteField.unitsMap_norm_surjective`: `Function.Surjective (Units.map (Algebra.norm K))`; `rootsOfUnity : ℕ → (M : Type) → [CommMonoid M] → Subgroup Mˣ`; `Subgroup.normalizer : Set G → Subgroup G`; `Group.isSolvable_of_subgroup_quotient`, `IsSimpleGroup.comm_iff_isSolvable`, `Group.IsSolvable.commutator_lt_top_of_nontrivial`, `IsPGroup.le_sylow_of_normal`, `IsZGroup.coprime_commutator_index` all as cited.

**Cross-roadmap citations resolved.** LocalFiniteGroupTheory at the head of #1634 (new folder, another author): L1 `pCore`, `piCore`, `pPrimeCore`, Hall subgroups, Schur–Zassenhaus conjugacy; L2 `fitting`, `fitting_eq_iSup_pCore`, `C_G(F(G)) ≤ F(G)`; L3 coprime action including the `A × B` lemma and generation by centralizers; L4 `IsElementaryAbelian`, `pRank`, `IsExtraspecial`, `J(P)`, replacement theorems; L5 `HasNormalPComplement`, `IsPStable` with "prove the two forms equivalent", `ZJ`; L6 `isNilpotent_of_fixedPointFree`, `isNilpotent_of_coe_eq_frobeniusKernel`; L7 `IsSignalizerFunctor`, `signalizerCompletion`, `signalizerCompletion_complete` for `m_p(A) ≥ 3`: all present. FiniteGroupExtensionSplitting at the head of #1774: `exists_isComplement'_of_coprime_index` at `### 2.4`, `exists_isComplement'_iff_sylow` at `### 3.1`. CharacterTheory on main: `### 4.2 Values are cyclotomic integers`, `### 4.3 Central characters and degree divisibility`, `### 4.4 The Galois action and the field of values`, `### 4.6 Background: Burnside's pᵃqᵇ theorem`. InductionRestriction on main: Layer 2 (induced characters, Frobenius reciprocity), Layer 3 (Mackey), Layer 4 (intertwining numbers), Layer 5 (Clifford), Layer 6 (virtual-character ring). GlaubermanZStar (#1778) cites "OddOrderTheorem F2" as a supplier and is not cited here: no cycle. Neither supplier pull request cites OddOrderTheorem.

**Ownership.** `roadmaps grep` over the open pull requests and main for `Dade`, `odd order theorem|Feit.Thompson`, `coherent`: no other roadmap states the odd order theorem, Dade data, the Dade isometry, coherence, the cyclic T.I. isometry, the prime sets or the five types; GlaubermanZStar consumes the Layer 2 comparison. Mathlib at the pin has no Hall subgroups, `π`-cores, Fitting subgroup or `p`-length; Tau Ceti at the pin has no Dade object (`grep -r Dade` empty). This roadmap owns Layers 0–6.

**Sources read.** Every locator below was checked in the math-comp odd-order transcription (the cache files named in the brief), whose comments carry the theorem numbers of both books; the two Cambridge volumes themselves are uncertified. Sampled targets: §0.1/§0.3 (Hypothesis 7.1 and the observations after it: MC-BGsection7 lines 43, 377, 457); §1.1 (`plength_1 p G := O_{p',p,p'}(G) = G`, MC-BGsection1 line 70); §1.2 (4.18(c,e): solvable, odd, `r_p ≤ 2` ⇒ `O_{p'}(G')` Hall in `G'`, `G ⧸ O_{p',p}` abelian `p'`-group, MC-BGsection4 lines 1144–1148); §2.1 ((1.1)–(1.8), MC-PFsection1 lines 38–39, 74–75, 92–96, 128–133, 189–198, 262–264, 385–387, 552–555); §2.2–§2.4 ((2.2) MC-PF2 lines 94–98; (2.3) 174–175; (2.4)(a,b,c) 190, 210, 229; (2.5) 262–272, 285; (2.6)(a) 408, (2.6)(b) 728; `Dade_Ind` 417–418; (2.7) 335, 396; (2.8) 437; (2.10) 602; (2.11) 756, 784); §2.5 ((5.1) 483–486; (5.2) 491–499; (5.3)(a,b) 641–644, 688–695; (5.4)–(5.9) 882, 937, 1127–1134, 1230, 1375, 1519, 1586 of MC-PFsection5); §2.6 (MC-PFsection6 lines 84–89, 120–126, 575–582); §2.7 ((3.1) MC-PFsection3 lines 28–31; (3.5) 1282–1287; (3.2)(a–c) 1386–1389; (d) 1502; (e) 1506–1507; (3.7) 1511; (3.8) 1603; (3.9) 1754–1819); §2.8 ((4.2) MC-PFsection4 lines 148–152; (4.3) 228, 293–298, 415; (4.6) 712–722; (4.7)–(4.10) 785–968); §3.1 (α, β, σ MC-BGsection10 lines 58–69; narrow MC-BGsection5 line 51; `β ⊆ α` line 141; remark before 10.1 lines 169–181; τ₁–τ₃ MC-BGsection12 lines 44–46; κ MC-BGsection14 lines 102–104); §3.2 (7.6 MC-BGsection7 lines 958–960; 7.1–7.4 lines 489–639); §3.3 (10.2(a1, b1, b2, a2, c, d2, e) MC-BGsection10 lines 394–466; 10.4(a) 521; 10.6 632; 10.8 800–813; 12.1 MC-BGsection12 lines 223–252; `sigma_complement` 48–50; 12.5/12.7/12.8 605, 759, 1062; 14.1/14.4/14.5 MC-BGsection14 lines 414–417, 871–876, 1110–1112); §3.4 (15.2 MC-BGsection15 line 322; `of_typeF`, `of_typeI`, `of_typeP`, `of_typeII_IV`, `of_typeII`–`of_typeV` MC-BGsection16 lines 116–162, clause by clause against the README table; `FTtypeP` line 1032; (8.8) MC-PFsection8 lines 433–449; (8.9) 471; (8.11) 512–514; (8.17) 929–940); §4.1 (`seqIndD` MC-PFsection5 line 292; (7.1)–(7.3), (7.5), (7.10), (7.11) MC-PFsection7 lines 62, 108, 131, 183, 661–663, 826; (9.4)–(9.10) MC-PFsection9 lines 161, 195, 275, 330, 849, 1261, 1443; (10.8), (10.10) MC-PFsection10 lines 1162–1163, 1172; (11.3)–(11.9) MC-PFsection11 lines 210–996); §4.2 ((12.7) MC-PFsection12 lines 1282–1283); §4.3 ((12.17) line 1306; (12.14) 944); §4.4 ((13.2) MC-PFsection13 lines 197–203; (13.3) 271, 312; (13.5)–(13.9) 441–822; (13.15) 1492–1493; `typeP_pair_sym` MC-PFsection8 line 440); §5.1 (Theorem C hypotheses MC-BGappC lines 35–48, conclusion line 767; use of (B) lines 225–232); §5.2 ((14.3) MC-PFsection14 lines 499–517; (14.4) 524–535; (14.5) 537–549; (13.17), (13.19) MC-PFsection13 lines 1661, 1989); §5.3 ((14.8)(a) `q^{p+1} > p^{q+1}` line 682, (b) `(v−1)/p > (u−1)/q` line 712; (14.9) 736–737); §5.4 ((14.2) lines 483–487; (14.7) 638–639); §5.5 ((14.10) 861; (14.12)/(14.13) 1053; (14.14) 1065–1067; (14.15) 1104; (14.16) 1171–1176; endpoint 1259–1265).

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsMinimalOddSimple G` | trivial; `C₃`; `S₃`; `A₅`; `C₇ ⋊ C₃`; infinite `G` | trivial: not `Nontrivial`; `C₃`: `IsMulCommutative`; `S₃`, `A₅`: `Nat.card` 6, 60 even; `C₇ ⋊ C₃`: `C₇` normal, not simple; infinite: `Nat.card = 0`, `Odd 0` false | no instance at these; conjunction equals math-comp `minSimpleOddGroupType` (MC-BGsection7 lines 23–27, 68–70) | none |
| `isSolvable_of_odd_natCard` | `C₇ ⋊ C₃`; `C₃ ≀ C₃`; infinite `G` | 21 odd, derived series `21 > 7 > 1`; 81 odd, `3`-group, nilpotent; `Nat.card = 0` not odd and `[Finite G]` in scope | matches `Feit_Thompson` (MC-PFsection14 line 1259) | none |
| `even_natCard_of_nonabelian_simple` | `C₂`; `A₅`; `PSL₂(𝔽₇)` | abelian, excluded; 60 even; 168 even | matches `simple_odd_group_prime` (line 1263) | none |
| three forms equivalent (§0.2) | both directions | minimal odd simple ⇒ odd, nonsolvable; nonsolvable odd ⇒ least nonsolvable section is simple (§0.1), nonabelian (`isSolvable_of_comm`), proper subgroups smaller sections | consistent | none |
| `DadeDatum L A H` vs (2.2) | clause by clause, MC-PF2 lines 94–98 | `A ⊴ L`, `1 ∉ A` = `subset` + `invariant`; (a) = `fusion`; (b) `H a ⋊ C_L(a) = C_G(a)` = `centralizer`, `normal`, `disjoint`, `product`; (c) = `coprime` over all `a, b` | exact | none |
| `DadeDatum`, instances | `S₃`, `L = ⟨(12)⟩`, `A = {(12)}`, `H = ⊥`; `C₃ × S₃`, `L = S₃`, `A` = transpositions, `H = C₃`; `S₄`, `L = S₃`, `H a = ⟨(34)⟩`; `S₃`, `L = A₃`; `A = ∅` | `C_G((12)) = L`, all clauses hold; `C_G((12)) = C₃ × ⟨(12)⟩ = H a ⋊ C_L(a)`, `gcd(3,2) = 1`, fusion by `S₃`: holds, Dade support 9 elements; `C_G((12)) = ⟨(12),(34)⟩`, `gcd(2,2) = 2`: coprimality fails, and the would-be map sends an indicator of norm `3/6` to one of norm `9/24`; `3`-cycles conjugate in `S₃` not in `A₃`: fusion fails; `∅`: vacuous | README Checks 1–5 of §2.2 correct | none |
| `supportedClassFunctions L A` | `A = ∅`; `A = L^#`; `L = S₃`, `A = {(12)}` | `{0}`; class functions vanishing at `1`; `0` (a class function nonzero at `(12)` is nonzero at `(13) ∉ A`) | submodule; Check 5 of §2.2 correct | none |
| `IsDadeExtension`, determination | `T` satisfying clauses 1–2, `D` the Dade map | `‖T f‖² = ‖f‖² = ‖D f‖²`; `T f = D f` on the Dade support, `D f = 0` off it ⇒ `‖T f‖² = ‖D f‖² + ‖(T f)|_off‖²` ⇒ `(T f)|_off = 0` | clauses 1–2 determine `T`, as the docstring says; clause 3 is (2.6)(b) | none |
| `IsDadeExtension`, wrong models | identity/induction; `|H a| · f a`; `f a / |H a|`; `−D`; zero map | on `C₃ × S₃`, `f = 1_A`: `Ind f` norm `27/18 = 3/2 ≠ 1/2`; rescaled norms `9/2`, `1/18`; `−D` gives value `−f a`; zero map norm `0 ≠ ‖f‖²` | each excluded by clause 1 or 2 | none |
| `exists_dadeExtension`, values and integrality | `C₃ × S₃`, `f = 1 − ε` (value 2 on transpositions) | `T f = 2` on the 9 elements `z·(ij)`, `= 1 − ε̃` with `ε̃` the sign pulled back along `C₃ × S₃ → S₃`: a virtual character; `‖T f‖² = 4·9/18 = 2 = 4·3/6 = ‖f‖²` | all three clauses hold with equality | none |
| `isDadeExtension_eq_indClassFunction` | `S₃`, `L = ⟨(12)⟩`, `f(12) = 1`; `C₇ ⋊ C₃`, `L = C₃`, `f = ω − ω²`; `A = ∅` | `(Ind f)(12) = |{x : x(12)x⁻¹ ∈ A}|/|L| · 1 = 2/2 = 1 = f(12)`, zero on `3`-cycles, norms `1/2 = 3/6`; `Ind f = μ_ω − μ_{ω²}` (linear), `= ω − ω²` on `L^#`; both sides `0` | equals `Dade_Ind` (MC-PF2 line 418) with `Subgroup.indClassFunction` the coset sum; R03 | R03 |
| trivial complements ⇔ T.I. (§2.4) | both directions; `A = ∅` | `H a = ⊥` ⇒ `C_G(a) = C_L(a)`; `a ∈ A ∩ gAg⁻¹`, `a = gbg⁻¹`, fusion `lbl⁻¹ = a`, `l⁻¹g ∈ C_G(b) ≤ L` ⇒ `g ∈ L`; conversely T.I. gives fusion and `C_G(a) ≤ L`; `A = ∅`: `N_G(∅) = G` | R06 | R06 |
| Hermitian vs bilinear pairing (Conventions) | `C₃`, `χ = ω` | `(1 + ω ω̄ + ω² ω̄²)/3 = 1`; `(1 + ω² + ω⁴)/3 = (1 + ω² + ω)/3 = 0` | witness correct; equality on virtual characters by `conj_apply_of_mem_virtualCharacters` | none |
| (1.4) Check | `H = C₃`, `Χ = {ω, ω²}`, `G = C₇ ⋊ C₃` | `Ind ω = μ_ω + χ₁ + χ₂`, `Ind ω² = μ_{ω²} + χ₁ + χ₂`; difference `μ_ω − μ_{ω²}`, degree `1`, norm `2` | degree miscounted | R03 |
| (1.8) Check | `S₃`, `C = A₃`, `B = 1`, `D = 1` vs `D = A₃` | `2·√3 ≈ 3.46` vs `2·√1 = 2` | `D = C` is the instance attaining `2` | R04 |
| degree-zero vs `CF(L, A)` (§2.5 Check 1) | `S₃`, `S = {ε, ρ}`, `A = S₃^#` and `A` = `3`-cycles | `ρ − 2ε` has degree `0`, vanishes at `1`; `(ρ − 2ε)(12) = 0 − 2(−1) = 2 ≠ 0` | correct | none |
| (6.3) | `L = C₇ ⋊ C₃`, `K = H = C₇`, `H₁ = M = 1` | `|H : H₁| = 7 > 37` false; and with `H₁ = M` input and output families coincide | theorem misread | R01 |
| (4.3) degrees | `L = W = C₃ × C₅`, `K = C₅`, `W₁ = C₃` | `μ_ij = w_ij`, degree `1`; `1 ≡ 1 (mod 3)` | congruence, not `|W₁| = 3` | R02 |
| Hypothesis (4.2) instances (§2.8 Checks) | `C₇ ⋊ C₃`; `C₃ × C₅` | `C_K(x) = 1`, no `W₂ ≠ 1`; `C_K(x) = C₅ = W₂`, `W = L` cyclic odd, `|V| = 15 − 3 − 5 + 1 = 8` | correct | none |
| cyclic T.I. isometry (§2.7 Checks) | `|W₁| = 3`, `|W₂| = 5`; `a_ij` at `x ∈ W₁`; `‖a_ij‖²`; `−σ` | `|V| = 8 = 2·4 = dim CF(W,V)`; `w_0j(x) = 1` ⇒ `a_ij(x) = 0`; four `±1` coefficients ⇒ `4`, `‖Ind a_ij‖² = 4` (T.I. with normalizer `W`); `−σ` has `σ 1 = −1` | correct | none |
| `α, β, narrow` (§3.1) | `C₃³`; `C₃² × C₅`; `C₃ ≀ C₃` | `α = {3}`, `β = {3}` (every rank‑2 subgroup lies in the rank‑3 one); `α = ∅`; `C_base(x)` = diagonal, `C_G(x) = ⟨x⟩ × diag ≅ C₃²` maximal elementary abelian ⇒ narrow, `3 ∈ α \ β`, rank `3` (order 81, not elementary abelian) | correct against `narrow` (MC-BGsection5 line 51) | R10 (locator) |
| `σ`, `τ`, `κ` (§3.1) | `S₄`, `M = S₃`; `C₇ ⋊ C₃`; `C₅ × (C₇ ⋊ C₃)` | `N(A₃) = S₃ ≤ M` ⇒ `3 ∈ σ`; `N(⟨(12)⟩) = ⟨(12),(34)⟩ ⊄ M` ⇒ `2 ∉ σ`; `m_3 = 1`, `3 ∤ 7` ⇒ `3 ∈ τ₁`, `C₃` fixed-point-free on `C₇` ⇒ `3 ∉ κ`; `C₃` centralizes `C₅ ≤ M_σ` ⇒ `3 ∈ κ` | correct against lines 58–69, 44–46, 102–104 | none |
| `M_σ ≤ M'`, `M_σ ≠ 1` are theorems (§3.3 Check 2) | `S₄`, `M = S₃`; `M = A₄` | `σ = {3}`, `M_σ = A₃ = M'`; `N(V₄) = S₄`, `N(C₃) = S₃` not in `A₄` ⇒ `σ = ∅`, `M_σ = 1 ≠ V₄` | correct | none |
| `H(M)` vs `F(M)` (§3.4 Check 1) | `S₃`; `C₇ ⋊ C₃`; `S₄` | `A₃`; `C₇`; `1` (no normal Sylow) vs `F(S₄) = V₄` | correct | none |
| Frobenius-type data (§3.4 Checks 2–3) | `C₅ × (C₇ ⋊ C₃)`; `H = C₇²`, `E = C₃²` | `E₀ = E = C₃` centralizes `C₅`: fails; `E₀ = ⟨e₁⟩`, `x ↦ x²` has no fixed point, `exp = 3`, `E₁ = E` abelian ⊇ `C_E(h)`: holds while `e₂` fixes the second `C₇` | matches `of_typeF` (MC-BGsection16 lines 116–119) | none |
| types I–V vs `of_type*` | clause by clause | I (a)(b)(c); P: (a) `W₁` cyclic Hall `≠ 1`, `M' ⋊ W₁ = M`; (b) `E` nilpotent `≤ M'`, `W₁`-normalized, `H ⋊ E = M'`; (c) `H` not cyclic, `M'' ≤ F(M)`, `H·C_M(H) = F(M)`, `F(M) ≤ M'`; (d) `W₂` cyclic `≠ 1`, `≤ H ∩ M''`, `C_{M'}(x) = W₂`; (e) `V` T.I. with normalizer `W`; II–IV: `E ≠ 1`, `|W₁|` prime, `F(M)^#` T.I.; II: `E` abelian, `N(E) ⊄ M`, `M'` type F with `H(M') = H(M)`; III/IV: `N(E) ≤ M`, `E` abelian/nonabelian; V: `E = 1` + (a)/(b)/(c) | exact (lines 121–162) | none |
| exclusivity of type I (§3.4 Check 5) | P-configuration, `w ∈ W₁` of prime order `r` | `W₁` Hall ⇒ `r ∤ |E|`; `E₀ ≤ EW₁` of the same exponent has an element of order `r^k` generating a Sylow `r`-subgroup, conjugate into `W₁`; `C_{M'}(w) = W₂ ≠ 1`, `W₂ ≤ H(M)` ⇒ fixed point | argument correct | none |
| (8.8) alternative | vs MC-PFsection8 lines 433–438 | cyclic T.I. hypothesis for `W`; `S' ⋊ W₁ = S`, `T' ⋊ W₂ = T`, `S ∩ T = W`; type 2 for `S` or `T`; both in 2–5; non-type-I maxima conjugate to `S` or `T` | exact; `gcd(|W₁|,|W₂|) = 1` from cyclicity (`C₃ × C₃` not cyclic) | none |
| induced family (§4.1 Checks) | `S₃`, `K = A₃`; `C₃ × C₃`, `K = C₃ × 1` | `Ind ω = Ind ω² = ρ`, `S(A₃) = {ρ}`; `Ind χ = λ₁ + λ₂ + λ₃`, `Res_K Ind χ = 3χ` | (1.5)(a) is about the restriction | R08 |
| (7.10) at `e = 3`, `h = 7` | one Frobenius maximal subgroup | `(3−1)·((7−6−1)/21 + 2/63) = 2·2/63 = 4/63` | formula matches MC-PFsection7 lines 661–663 (`exists i`) | R10 |
| (13.15) (§4.4 Checks) | `(p,q) = (5,3)`, `(7,3)` | `31`, `5 ≢ 1 (3)` ⇒ `|U| = 31`; `57`, `7 ≡ 1 (3)` ⇒ `|U| = 19`; norm-one subgroup of `𝔽₁₂₅ˣ` has order `124/4 = 31` | matches `card_FTtypeP_Galois_compl` | none |
| `appendixC_prime_le` vs Theorem C | (A), (B) at MC-BGappC lines 35–48 | (A): primes, `coprime nU (p−1)`, `P ≅ (F,+)` with `P₀` the prime-field line, `U ↪ Fˣ` with `σ(x^u) = σ(x)ψ(u)` (`x^u = u⁻¹xu`, line 81), `|P| = p^q`, `|U| = nU`; Lean: `Ue` onto `rootsOfUnity nU F`, which has order `nU` (`nU ∣ p^q − 1 = |Fˣ|`, `Fˣ` cyclic), `hact` with `g⁻¹xg`; (B): abelian `p'`-group `Q` (the only consequences of `q.-abelem Q` used, lines 228–232), `P₀ ≤ N(Q)`, `∃ y ∈ Q`, `P₀^y ≤ N(U)` = `hQab`, `hQp`, `hQnorm`, `y`, `hUnorm` | exact; conclusion `p ≤ q` (line 767) | none |
| `appendixC_prime_le`, degenerate | `(2,q)`; `(3,2)`; `(5,3)`; `p = q`; `Q = ⊥`, `y = 1` | `nU = 2^q − 1` coprime to `1`, `2 ≤ q`; `nU = 4`, `gcd(4,2) = 2`, hypothesis false; `nU = 31`, `gcd(31,4) = 1`, conclusion false so hypotheses must be inconsistent (Theorem C); `p ≤ p`; `r = Pe(z) ∈ N(U)`, `r⁻¹ u r = u · Pe(z(1 − w))`, in `U ∩ P = ⊥` only if `w = 1`, but `|U| = nU ≥ 1 + p > 1`: contradiction, vacuous | no refuting instance; junk values none (`p ≥ 2`, `(p−1) ∣ (p^q − 1)`) | none |
| §5.1 Checks | `𝔽₉`; `(3,5)` | norm `x ↦ x⁴`, kernel of order `4 = 8/2`, `gcd(4,2) = 2`; `121`, `gcd(121,2) = 1`, `3 ≤ 5`; `Q = 1`: `P ∩ N(U) = C_P(U) = 1` | correct | none |
| action convention (§5.1 Check 4) | `SemidirectProduct F Fˣ` | `(0,u)⁻¹(z,1)(0,u) = (u⁻¹z, 1)`; differs from `hact` by `u ↦ u⁻¹`, an automorphism of `U` | satisfiable either way; trivial action excluded | none |
| (14.8) (§5.3 Checks) | `(5,3)`, `(7,3)`, `(7,5)`, `(3,2)`; `(5,3)` for (b) | `729 > 625`, `6561 > 2401`, `390625 > 117649`, `16 < 27`; `|V| = 121`, `24 > 10` | correct; `x ↦ ln x/(x+1)` decreasing for `x ≥ 4` gives (a) for odd `3 ≤ q < p` | none |
| §5.4 Checks | `(7,3)`; `(5,3)` | `19 ≡ 5 (mod 7)`, free `C₇`-action needs `≡ 1`; `31 ≡ 1 (mod 5)`, `3 ∤ 4`, `gcd(31,4) = 1` | correct | none |
| §5.2 Check 1 | `(T, V, W₂, W₁)` P-configuration | clause (d) puts `W₁ ≤ H(T) = Q` abelian ⇒ `W₁^y = W₁`, `W₁W₂^y = W^y` cyclic of order `pq` | correct | none |
| (14.14)/(14.16) (§5.5 Check 2) | `(5,3)` | `(pq+1)² = 256`; `pq(pq−1) + 1 = 211`; first branch `(h−1)/pq ≤ pq − 1` (line 1066) | correct | none |
| `p`-length Checks (§1.1) | `S₃` at `2, 3`; `S₄` at `2, 3` | `O_{2'} = A₃`, quotient `C₂`; `O_{3'} = 1`, `A₃` normal Sylow; `O_{2'} = 1`, `O_2 = V₄`, `S₄/V₄ ≅ S₃` not `2'`: length two; `O_{3'} = V₄`, Sylow `3` of `S₃` normal | correct | none |
| §1.2 witness | `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)`; `𝔽₃³ ⋊ (C₁₃ ⋊ C₃)` | `3⁷·7 = 15309`, `3`-length two, rank `≥ 6`; `1053`, `3`-length two, rank `3` | second is smaller | R05 |
| §1.4 Checks | `C₅ × (C₇ ⋊ C₃)`, `J = C₅ × C₇`, `A = C₃` | `C_J(A) = C₅` cyclic; `[J, A] = C₇ ≠ J` | correct | none |
| `IsTISet D N` ⇒ `N_G(D) = N` (Conventions) | `D ≠ ∅` | `N ≤ N_G(D)` by `conj_mem`; `g ∉ N` ⇒ `gDg⁻¹ ∩ D = ∅ ≠ D` | holds; §3.4's "iff" is weaker | R10 |

## Not verifiable

- Peterfalvi 2000 and Bender–Glauberman 1994 (Cambridge University Press): no legal copy; both are recorded `uncertified`. Every locator above was checked against the math-comp odd-order transcription in the cache, whose comments name the theorem numbers; page numbers were not checked.
- Isaacs, *Character Theory of Finite Groups*, Lemma 7.7: not in the cache; the math-comp comment at MC-PF2 lines 417–418, 818, 828 confirms the attribution.
- Feit–Thompson 1963 (FT63): image-only OCR; not used for any hypothesis check beyond Definition 9.1's location.
- Ownership against open pull requests was checked through `roadmaps grep` and the heads of #1634, #1774, #1778 read with `roadmaps show`; the brief's sibling checkouts do not include those three.

## Source issues

- **Error** in BenderGlauberman1994 at Theorem 15.7 and the definition of type I, clause (I)(v)(c): the source states that `O_{p'}(M)` is cyclic for the relevant prime; it should be `O_{p'}(M_F)` cyclic, which is what Theorem 15.7 proves; affects a stated result (copied into Peterfalvi2000 Definition (8.3); witness MC-BGsection16 lines 37–44).
- **Misprint** in Peterfalvi2000 at Definition (8.6), type II clause (v): the source writes the condition over `M'`; it should be over `M' \ {1}`; affects nothing (witness MC-BGsection16 lines 57–58).
