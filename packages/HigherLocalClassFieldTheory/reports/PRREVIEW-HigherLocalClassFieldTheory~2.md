# Review of HigherLocalClassFieldTheory (pull request #1813 at 4da4065)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/HigherLocalClassFieldTheory/README.md` and `Suggested.lean` at head 4da4065f. The gate fails (`sorry-data=6`, `prnum=4`, `build=1` on Lake's module-system warning); the dependency check reports 0 problems. Twelve findings, six blocking.

## R01 (P1) — Six `sorry`'d definitions carry the whole Lean file

Location: `Suggested.lean:75` (`milnorNorm`), `:148` (`higherTopology`), `:154` (`unitsTopology`), `:198` (`Derivation.laurentField`), `:244` (`degreeMap`), `:269` (`reciprocityMap`).

Claim: the file "states the roadmap's headline theorems against the pinned APIs".

Witness: the six `noncomputable def`s have body `sorry` (gate `sorry-data=6`). Everything from line 148 on mentions one of them: `lambdaTopology` (via `unitsTopology`), `sequentialKernel`, `sequentialKernel_eq`, `topologicalMilnorKTopology`, `higherTopology_one`, `seqContinuous_mul`, `tendsto_innerVariable_pow`, `divisibleKernel_le_ker_degreeMap`, `normSubgroup` (via `milnorNorm`) and all nine declarations of the `Reciprocity` section (via `reciprocityMap`, `normSubgroup`, `topologicalMilnorKTopology`). A sorried `def` is data, and a theorem about a sorried map is a theorem about nothing: `reciprocityMap h hn p` could be the zero map and every statement from line 276 to 330 stays consistent with it.

Repair: delete the six definitions and every declaration that mentions them. The higher topology, the topology on `Fˣ`, the degree map, Kato's norm on `K_n^top` and the Neukirch–Fesenko map are README targets with their intended signatures (as the README already states them). The module docstring then says which headlines are not statable at the pins and why: reciprocity, finite-level reciprocity, existence, separation and injectivity lack the carrier `K_n^top(F)` (Milnor K-theory and Kato's norm are K2SymbolsBrauer §§5.4 and 10.24 and have no declaration at the pins, see R03) and lack the higher topology (a construction, not a definition on native carriers); Fesenko's theorem `Λ_n(F) = ⋂ l K_n(F)` lacks both. What remains statable at the pins is `IsHigherLocalField`, `existsUnique_residue_valuativeRel`, `isHigherLocalField_one_iff`, `LaurentField` with its instances, and `isHigherLocalField_laurentField`; that is a correct short file.

## R02 (P1) — The route to finite-level reciprocity (4.2) uses inputs no layer owns, and one of them is false in mixed characteristic

Location: `README.md:274-276`: "for cyclic `L/F` of prime degree it is onto, by 2.4, and 3.2 counts both sides; the general case follows by Neukirch's induction through Sylow subgroups and towers [Neukirch, IV §6]".

Claim: Layer 3 (3.1 for unramified extensions, 3.2 the norm index) plus Neukirch's induction gives `Υ_{L/F}` an isomorphism for every finite Galois `L/F`.

Witness: Neukirch's induction (and Fesenko's modification of it) needs, for every cyclic `L/F` of prime degree, the exactness `K_n^top(L) →(1−σ) K_n^top(L) →N K_n^top(F)` and the separation of norm groups (Fesenko's axioms (A4a), (A4c), fesenko2000explicit lines 54–61); neither is a target here, and 3.2 gives only the index (A4b). Worse, Fesenko states that in mixed characteristic the unramified injectivity axiom (A3b) fails when `μ_p ⊄ F`: for `F = ℚ_p(ζ_p){{t}}`, `{ω, π} ∉ pK_2^top(F)` but its image in `K_2^top(F(ω^{1/p}))` is `0` (fesenko2000explicit lines 86–94), and his proof that `Υ^ab_{L/F}` is an isomorphism in characteristic zero goes through Artin–Schreier trees and a Hazewinkel-type inverse (lines 107–160, Theorem 2), not through Neukirch's induction. Neukirch IV §6 also presupposes `A_K = A_L^{G(L|K)}` by construction, which the pull request itself notes fails for Milnor K-groups. "onto, by 2.4" is not an argument: 2.4 lists generators of `K_n^top(F)`, it does not show `Υ(σ) ∉ N_{L/F}K_n^top(L)`.

Repair: make Layer 3 the full class field axiom of fesenko2000explicit 10.1: (A3a)–(A3c) for `F_d/F` (3.1 has (A3a) and (A3c)); for cyclic `L/F` of prime degree, (A4a) exactness (Invitation §6.8.3 Theorem 4 and its Corollary, which cite Fesenko 1991a §4 and 1991b §3), (A4b) the index (3.2) and (A4c). State the homomorphism property of `Υ_{L/F}` as its own target with inputs (A1)–(A3). For characteristic `p` cite Theorem 1 of §10.2. For mixed characteristic add the Artin–Schreier-tree layer: the definition and properties (1)–(4) (lines 109–133), Proposition 1 (line 137), the map `Ψ_{L/F}` and Proposition 2 (lines 143–147), Theorem 2 (line 150), and the prime-to-`p` part through `K_n^top(F)/VK_n^top(F)` (10.3.1). Cite Fesenko 1991a at the sections that carry these, not Neukirch IV §6. The theorem 4.2 itself is right; only its route and its owners are missing.

## R03 (P2) — `Suggested.lean` restates K2SymbolsBrauer's Milnor K-theory verbatim

Location: `Suggested.lean:33-79` (section `MilnorKStandIn`), docstring lines 18–21 "restates the §5.4 carrier as that roadmap's `Suggested.lean` writes it … Replace both by the Tau Ceti declarations once they exist".

Claim: the stand-in is a temporary copy of K2SymbolsBrauer §5.4 and §10.24.

Witness: K2SymbolsBrauer at its head (6a7f84a) declares `milnorRel`, `MilnorK`, `MilnorK.ofUnit`, `MilnorK.symbol`, `MilnorK.degree` with the same bodies (its `Suggested.lean` lines 109–132; universe `Type u` there, `Type` here). Two open pull requests now build the same object, and `milnorNorm` (line 75) states Kato's norm, the headline of K2SymbolsBrauer §10.24, as `sorry`. The README (line 47) says this roadmap does not own Milnor K-theory.

Repair: delete the section, together with `divisibleKernel`, `TopologicalMilnorK`, `unitClass`, `MilnorK.symbol_mem_degree`, `MilnorK.symbolDeg` and the `#1302` docstrings; cite K2SymbolsBrauer §§5.4 and 10.24 by name in the module docstring as the missing carriers (R01). The README keeps `K_n^top(F) = K_n(F)/⋂_{l≥1} l K_n(F)` as the definition of 2.1.

## R04 (P2) — The higher topology is canonical only when `char K_{n−1} = p`; Layers 1–2 claim it for every higher local field

Location: `README.md:215-223` ("Theorems: independence of the standard presentation and the basis"), `:224-227` (1.2), `:62-66` ("Layers 0–2 hold for them"), `Suggested.lean:145-149` (`higherTopology (h : IsHigherLocalField n F)` with no further hypothesis).

Claim: `higherTopology` is a function of `F` alone, independent of the standard presentation, for every `n`-dimensional local field.

Witness: Zhukov's definition is canonical in characteristic `p` and in mixed characteristic, but "in the case `char(K) = char(K_{n−1}) = 0` … depends on the choice of the coefficient subfield of `K_{n−1}` in `O_K`" (zhukov2000 lines 198–200). Instance: `ℚ_p((X))` has coefficient fields `E, E'` differing by a nonzero (hence discontinuous) derivation `D` of `ℚ_p`; a sequence `e_k ∈ E`, `e_k → 0` `p`-adically with `|D(e_k)| → ∞`, converges for the `E`-topology and has `X`-coefficient `−D(e_k)` (mod higher terms) in `E'`-coordinates, so diverges for the `E'`-topology. Likewise 1.2 is Zhukov's definition for `char K_{n−1} = p` only; for `char K_{n−1} = 0` he defines `τ` on `K^*` through `O^*_{K_{m+1}}` (lines 444–469) and remarks that only then is it well defined in all cases. Fesenko's structure theorem for `VK_m^top` is stated for `char K_{n−1} = p` (Invitation §6.6 Theorem 1, cache 5917d0fc line 263) and the remaining case is reduced to it by rigidity (line 282–288).

Repair: state 1.1, 1.2 and 2.2 under `char K_{n−1} = p` (the class field hypothesis), where the source proves canonicity, and either drop the sentence "Layers 0–2 hold for them" or add for `char K_{n−1} = 0` the reduction `VK_m^top(F) ≅ VK_m^top(K_{n−1}) ⊕ VK_{m−1}^top(K_{n−1})` of §6.6 Remark 2 as its own target with the coefficient field as data. Add a negative-control Check: for `ℚ_p((X))` two coefficient fields give two topologies.

## R05 (P2) — The existence and separation theorems in Lean drop the class field hypothesis the README puts on them

Location: `Suggested.lean:294` (`iInf_openFiniteIndex_eq_bot`), `:307` (`isOpen_and_finiteIndex_iff_exists_normSubgroup`), `:316` (`normSubgroup_le_normSubgroup_iff`).

Claim (README 5.4–5.5, under "Layers 3–5 assume `n ≥ 1` and `CharP 𝓀[F] p`"): the existence theorem and separation hold for `n ≥ 2` under the class field hypothesis.

Witness: the elaborated types (worker's `signatures.md`, confirmed by `#check` in a scratch importer) carry `[Field F] [ValuativeRel F] (h : IsHigherLocalField n F) (hn : 2 ≤ n)` and nothing about `𝓀[F]`: the section variables `{p} [Fact p.Prime] [CharP 𝓀[F] p]` are dropped because the statements do not mention `p`. So the Lean asserts the existence theorem for `ℚ_p⸨X⸩⸨X⸩` and every field the README's scope (line 62–66) excludes, with no route. The README's own wording ("5.4 … `n ≥ 2`", "5.5 … `n ≥ 2`") is silent on the hypothesis too.

Repair: if any of these is restated once the carriers exist, bind the hypothesis explicitly (`[CharP 𝓀[F] p]` with `p` in the statement, or a `Prop`-level `ClassFieldHypothesis F p` predicate with a real body) and write "`n ≥ 2` and `char K_{n−1} = p`" in 5.4 and 5.5. Under R01 these declarations are deleted now; the README edit stands on its own.

## R06 (P2) — Vostokov's formula is cited without its hypothesis `p ≠ 2`, and the sign is unpinned

Location: `README.md:321-323` (5.3): "For `μ_{p^r} ⊂ F`, the Hilbert pairing `(a, α)_{p^r}` is given by Vostokov's explicit formula".

Witness: the source states the formula for "`char(K_{n−1}) = p`, `p > 2`, `ζ_{p^m} ∈ K`" (vostokov2000 line 181) and says the `p^m`-th Hilbert symbol "coincides (up to a sign) with the symbol `V(,)_m`" (lines 261–263). For `p = 2` the formula needs the 2-adic modification (Fesenko, Vestnik Leningrad 1985, cited there as [Fe1]). The README's 5.4 and 5.5 use 5.3 for every `p`.

Repair: state 5.3 for `p > 2` with the `(−1)` convention pinned by one computed two-term example against the arithmetic-Frobenius normalization of 4.4 (as 5.1 and 5.2 do), and give `p = 2` its own target with its own source; or state nondegeneracy of the Hilbert pairing for every `p` from Fesenko 1991a at the section that proves it, and keep Vostokov's formula as the `p > 2` explicit form.

## R07 (P3) — Wrong chapter numbers into the Invitation and wrong section numbers into Fesenko

Location: `README.md:395-398` (references), `:257`, `:269`, `:304` ("[Fesenko 2000b, §5]"), `:243` ("[Fesenko 2000a]"), `:215` ("[Zhukov 2000, §1]"), `:238` ("[Fesenko 2001]").

Witness: in Geometry & Topology Monographs 3, Part I, Zhukov's chapter is section 1 (zhukov2000 line 8), Fesenko's "Topological Milnor K-groups of higher local fields" is section 6, pages 61–74 (cache 5917d0fc lines 8–9), "Parshin's higher local class field theory in characteristic p" is section 7 (fesenko2000parshin lines 8–10), Vostokov's "Explicit formulas for the Hilbert symbol" is section 8, and "Explicit higher local class field theory" is section 10, pages 95–101 (fesenko2000explicit lines 8–9). The README's "(Part I, §4)" and "(Part I, §5)" point at Nakamura's and Kurihara's chapters. "[Fesenko 2000b, §5]" at 3.1 and 4.1 is §10.1–10.2; at 5.2 the Artin–Schreier–Witt pairing is §6.4.3 and Parshin's structure theorem §7.2; 2.4 is §6.5; 5.1's tame symbol is §6.4.2; 2.2 is §6.6 Theorems 2–3, which cite the 2001 paper as [F5].

Repair: correct the reference list to sections 1, 6, 7, 8, 10 with page ranges, and give every in-text citation its subsection (e.g. "[Fesenko 2000b, §10.1]").

## R08 (P3) — Pull-request numbers in the README and the Lean docstrings

Location: `README.md:50, 54, 63, 105, 108, 127, 131, 141, 246, 251, 305, 308, 331, 380`; `Suggested.lean:18, 31, 37, 42, 47, 51, 57, 74`.

Witness: gate `prnum=4` lists the four `TauCetiProject/TauCetiRoadmap#…` lines; the bare `#1302` and `#1474` citations and the docstrings "(#1302 §5.4)" are the same defect. Cross-roadmap citations name the roadmap and section, never a pull-request number; "Replace both by the Tau Ceti declarations once they exist" (`Suggested.lean:20-21`) is process narrative.

Repair: write "K2SymbolsBrauer §5.4", "FunctionFieldArithmetic §3.1", and drop the process sentences.

## R09 (P3) — README shape: no Checks, no `*Needs:*` lines, no per-layer Examples and Dependencies, one undeclared Lean name

Location: whole file; `README.md:314` (`iteratedResidue`).

Witness: `grep -c 'Checks' README.md` = 0 and `grep -c 'Needs:'` = 0. Every layer is a bullet list of numbered paragraphs with no `### k.n` subsections, no API lists, no `**Checks.**` bullets, no `### Examples`/`### Dependencies`; the headings "Scope", "What this roadmap consumes", "What is missing (build here)", "Ordering" are not the house headings ("Scope and ownership", "Exact supplier contracts", "How to read the build", per-layer Dependencies, "Downstream consumers"). The worked examples at the end are good material for Checks but are attached to no definition. `iteratedResidue` is backticked as this roadmap's own name and is declared nowhere (worker's `citations.md`; the gate's `readme-ids` scanner only sees prefixed names).

Repair: reshape to the upstream form (compare `TauCetiRoadmap/ClassFieldTheory/README.md` or `TauCetiRoadmap/FormalLaurentPuiseux/README.md` on main): `### k.n` prose targets with the locator at the claim and a `*Needs:*` line, API bullets per definition, at least three discriminating Checks per definition (the tame-symbol, Parshin-formula, Frobenius-direction and topology examples already computed belong there, each with the wrong model it excludes), `### Examples` and `### Dependencies` per layer. Backtick only names declared in `Suggested.lean` (after R01 and R03 that is a short list), so `iteratedResidue`, `higherTopology`, `degreeMap`, `reciprocityMap` and the rest become prose names.

## R10 (P3) — The build check fails on Lake's module-system warning

Location: `Suggested.lean:1-2`.

Witness: gate `build=1`: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". At the pins (Mathlib f6090c70, Tau Ceti 358314d4) both packages are module-system packages and the gate counts every non-`sorry` warning.

Repair: line 1 `module`, then `public import Mathlib`, `public import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap` (only if `artinMap` is still used after R01), the module docstring, then `@[expose] public section` before the namespace (the `@[expose]` form keeps `inferInstanceAs` on `LaurentField` working).

## R11 (P3) — Padding: the worked example and two API lemmas are stated in Lean

Location: `Suggested.lean:182` (`tendsto_innerVariable_pow`), `:187` (`not_tendsto_innerVariable_pow_valued`), `:64` (`MilnorK.symbol_mem_degree`), `:247` (`divisibleKernel_le_ker_degreeMap`).

Witness: the first two mirror the README's worked example "The higher topology is not the valuation topology" (lines 370–375); the second is a statement about Mathlib's `LaurentSeries.valued` alone. The other two are API lemmas (membership of a symbol in the degree-`n` part; the degree map kills the divisible kernel). None closes in one tactic (`simp` leaves the goals, scratch `Probe.lean`), but padding is decided by what they are, not by how hard they are.

Repair: delete them from `Suggested.lean`; the README keeps the worked example as a Check of 1.1 and the two lemmas as API bullets of 2.1 and 2.3.

## R12 (P3) — 3.2's proof route names the wrong unit filtration

Location: `README.md:262-265`: "through the unit filtration `U^{(i)}K_n^top(F) = ⟨{1 + 𝓂_F^i, Fˣ, …, Fˣ}⟩`, `𝓂_F` the maximal ideal of `𝒪[F]` … the `n`-dimensional form of [Serre, *Local Fields*, V §3]".

Witness: powers of the rank-one maximal ideal `𝓂_F = t_n𝒪[F]` do not separate the generators `1 + θ t_n^{i_n}⋯t_1^{i_1}` of `V_F` (for `n = 2`, `1 + t_1` and `1 + t_1^2` lie in the same step), so the index computation for `ℓ = p` cannot run on it. Fesenko's computation uses the filtration `U_{i_1,…,i_n}` indexed by the rank-`n` valuation and the quotients `u_{i_1,…,i_n}`, with the three cases of the norm on them (cache 5917d0fc lines 411–434, Proposition of 6.8.1, cited to Fesenko 1991a Prop. 4.1 and 1991b Prop. 3.1).

Repair: write the route with the rank-`n` filtration `U_{𝐢}`, `𝐢 ∈ ℤ^n_{>0}`, state Fesenko's three-case norm formula as the input of 3.2 for `ℓ = p`, and cite 6.8.1 rather than Serre V §3.

## Verified sound

**Gate and order.** Gate at 4da4065 (worker's run, `gate.md`): `set_option=0`, `imports=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`; failures `prnum=4` (R08), `sorry-data=6` (R01), `build=1` (R10). Dependency check run by me: `depcheck: 241 roadmaps, 2296 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: K2SymbolsBrauer (line 37) and FunctionFieldArithmetic (338) precede HigherLocalClassFieldTheory (380); ClassFieldTheory, FormalLaurentPuiseux and LocalFieldsRamification are on main. `git diff --stat origin/main...HEAD` outside the folder: empty.

**Ownership.** `roadmaps grep` over main and the 456 open heads for higher local fields, topological Milnor K-groups, `K_n^top`, Parshin, Vostokov: no other roadmap builds these objects. K2SymbolsBrauer (line 3444), FunctionFieldArithmetic (line 3133) and CrystallineCohomology name a planned consumer "HigherLocalFieldsAndHigherClassFieldTheory"; this roadmap is that consumer under another name (worth aligning, not a finding). KTheoryFiniteLocalFields cites Fesenko's Invitation chapter only as a reference. Ownership against open pull requests whose files the brief does not give (none relevant found by grep) was checked only through the grep index.

**Cross-roadmap citations resolved** (every one, at the cited head or on main): K2SymbolsBrauer (head 6a7f84a) §5.4 (Milnor K-theory, line 509), §9.11 (residues, uniformizer last, 1603), §9.16 (convention dictionary, 1694), §9.17 (rigidity mod `q` prime to `char k`, 1706), §10.24 (Kato's norm, every finite extension, 2183), §10.26 (norm–residue square, `F` complete, any finite `E/F`, 2232). FunctionFieldArithmetic (head c5d655e) §3.1 (`aswQuotient p F n`, `artinSchreierWitt_galois`, pairing `(σ, ℘y) ↦ σy − y`, lines 812–870), §4.3 (Schmid–Witt symbol `[℘y, b)_n = Art_K(b)(y) − y`, residue formula, 1178–1230): the README's sign convention agrees. ClassFieldTheory on main: §2.6 arithmetic Frobenius (line 460), frozen interface lines 561 and 565 (`localAbelianExistence`, `injective_artinMap` for finite extensions of `ℚ_p`), as the README says. FormalLaurentPuiseux on main L2 (derivative rules, line 112) and L3 (`Res(f dt) = coeff_{−1} f`, invariance under `f(φ)Dφ`, line 140–145).

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4): `ValuativeRel.IsRankLeOne`, `IsNontrivial`, `IsDiscrete` (`RingTheory/Valuation/ValuativeRel/Basic.lean:928, 935, 1010`; `IsDiscrete` is "a maximal element `< 1`", satisfied by the trivial valuation and by `ℤ × ℤ` lexicographic, so all three conjuncts of `IsHigherLocalField` are needed and together give value group `ℤ`); `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean:45`, extends `IsValuativeTopology`, `LocallyCompactSpace`, `IsNontrivial`); `Field.absoluteGaloisGroup` (`FieldTheory/AbsoluteGaloisGroup.lean:42`, automorphisms of `AlgebraicClosure K`) and `absoluteGaloisGroupAbelianization` (`:101`); `IsAbelianGalois` (`FieldTheory/Galois/Abelian.lean:25`); `Valued.mk'` (`Topology/Algebra/Valued/ValuationTopology.lean:134`); `instLaurentSeriesComplete` (`RingTheory/LaurentSeries.lean:822`). Tau Ceti: `TauCeti.ClassFieldTheory.artinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K` for `[IsNonarchimedeanLocalField K]` (`NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:109`, every nonarchimedean local field, so 4.5 applies in characteristic `p` too), `denseRange_artinMap` (:174), `exists_artinMap_mem_iff` (:201, stated with open subgroups `U` and `localNormSubgroup K V`), `continuous_artinMap` (:215), `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer` (`Local/Unramified.lean:440`), `localNormSubgroup` (`LocalExistence/NormSubgroup.lean:66`), `kummerMap` (`FieldTheory/GaloisCohomology/Kummer.lean:246`), `zHat` (`Topology/Algebra/Group/Profinite/ZHat/Basic.lean:66`).

**Signatures.** The worker's `signatures.md` (40 declarations) was compared with the README; `#check @isHigherLocalField_one_iff`, `@normSubgroup`, `@iInf_openFiniteIndex_eq_bot` re-elaborated in a scratch importer agree. The two flagged drops: `normSubgroup` without `[ValuativeRel F]` is harmless (the norm is algebraic); the drops of `[CharP 𝓀[F] p]` are R05. One-tactic probe (`simp`) on `MilnorK.symbol_mem_degree` and `not_tendsto_innerVariable_pow_valued`: both leave goals.

**Sources read** (ids in the cache): zhukov2000 (Invitation §1), Invitation §6 (5917d0fc), fesenko2000parshin (§7), vostokov2000 (§8), fesenko2000explicit (§10). Sample of 15 targets checked at the text:

| Target | Source | Result |
|---|---|---|
| 0.1 definition, residue characteristics, `m` | zhukov2000 24–28, 58–61 | agrees (README's `m` is Zhukov's `m + 1`) |
| 0.2 `K{{t}}`, residue field `𝓀[K]⸨X⸩` | zhukov2000 40–48 | agrees |
| 0.3 local parameters, rank-`n` valuation, `𝐯(t_i) = e_i` | zhukov2000 53–57, 90–97 | agrees; `𝐯` depends on `t_2,…,t_n` up to equivalence |
| 0.4 classification | zhukov2000 64–77 | agrees for `char p` and mixed; for `char K_{n−1} = 0` the standard-field isomorphism is not canonical (R04) |
| 0.5 finite extensions, `f(L|K) = |L_0 : K_0|` | zhukov2000 138–161 | agrees |
| 1.1 topology, Hausdorff group, sequential continuity, not continuous for `n ≥ 2`, expansions | zhukov2000 181–197, 277–284, 384–391 | agrees under `char K_{n−1} = p`; R04 otherwise |
| 1.2 topology on `Fˣ` | zhukov2000 444–447 | agrees under `char K_{n−1} = p`; different definition at 448–469 |
| 2.1 `λ_m` finest with subtraction and symbol map sequentially continuous | 5917d0fc 124–132 | agrees (product versus ∗-product have the same convergent sequences) |
| 2.2 `Λ_m = ⋂ lK_m`, divisible | 5917d0fc 302–316 (Theorems 2–3, cite [F5] = Fesenko 2001) | agrees; `K_1^top = K_1` iff `char K_{n−1} = p` (147–149) |
| 2.3 degree map `v({t_1,…,t_n}) = 1`, independent of parameters | 5917d0fc 173–178 | agrees |
| 2.4 generators, `K_n^top ≅ ℤ ⊕ (ℤ/(q−1))^n ⊕ VK^top` | 5917d0fc 222–246; fesenko2000parshin 25–28 | agrees |
| 2.5 norm descends, `N` of closed is closed, `N⁻¹` of open is open; index `l` for cyclic prime degree | 5917d0fc 409, 440–441, 462 | agrees (3.2 is Corollary 1 of 6.8.2) |
| 3.1 unramified: norm image and Hilbert 90 | fesenko2000explicit 48–52, 70–75, 86–88 | (A3a), (A3c) hold in all cases; (A3b) fails for `μ_p ⊄ F` (R02) |
| 4.1 `Υ_{L/F}(σ) = N_{Σ/F}Π_Σ`, `σ̃|_{F^pur} = Frob^i`, `i ≥ 1`, independence | fesenko2000explicit 40–47 | agrees |
| 5.4/5.5 existence theorem, uniqueness, injectivity via Λ = ⋂ open finite index | fesenko2000explicit 177–198; 5917d0fc 278 | agrees; Corollary of 6.6 Theorem 1 needs `char K_{n−1} = p` |

**Adversarial pass** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| `IsHigherLocalField 0/1` | finite field; `ℚ_p`; trivial valuation; `ℤ×ℤ`-lex value group | `n=0`: `Finite F`; `n=1`: discrete+nontrivial+rank≤1+complete+finite residue ⇔ locally compact; trivial valuation: `IsDiscrete` true (γ=0), `IsNontrivial` false; `ℤ×ℤ`: discrete+nontrivial, `IsRankLeOne` false | sound; all three conjuncts needed |
| `existsUnique_residue_valuativeRel` | `n=0`: finite residue field; `n≥1` | finite field: every valuation trivial, one relation; `n≥1`: two inequivalent rank-one henselian valuations force separable closure (F. K. Schmidt), but `F_2 ≠ F` | sound |
| `isHigherLocalField_laurentField` | `K = 𝔽_q` (`n=0`); `K = ℚ_p` | `v(X) = ofAdd(−1) < 1` maximal; complete (`instLaurentSeriesComplete`); residue field `K` with transported relation | sound |
| `divisibleKernel`, `sequentialKernel_eq` | `n=0`; dimension 1, `n=1`; `ℚ_p((X))`, `n=1` | `K_0 = ℤ`, `⋂ lℤ = 0 = Λ_0` (discrete); `Fˣ = π^ℤ × μ_{q−1} × U^1`, no nonzero `l`-divisible element for all `l`, `Λ_1 = 1` (Hausdorff); `ℚ_p((X))`: `1 + M_F ⊂ Λ_1` and `1 + M_F` uniquely divisible, both sides contain it | sound (as a statement) |
| degree map and Frobenius direction | `{t_1,…,t_n}`; `{t_2,t_1}`, `n=2`; `{u,t_1,…,t_{n−1}}`, `u ∈ V_F` | `v = 1`; `v = −1` (anticommutativity), `Ψ` acts as `Frob⁻¹`; `v = 0` | sound; matches README worked example |
| tame symbol on `ℚ_p{{t}}` | `(u,{t,p})_ℓ`, `(t,{t,p})_ℓ`, `ℓ ∣ p−1` | `∂_F{u,t,p} = {ū,t̄}`, `∂_{K_1}{ū,t̄} = ū` → `u^{(p−1)/ℓ}`; `{t,t} = {t,−1}`, `∂{t̄,−1} = (∂{−1,t̄})⁻¹ = −1` → `(−1)^{(p−1)/ℓ}`; dimension one `(u,π)_m = Frob(u^{1/m})/u^{1/m} = u^{(q−1)/m}` with arithmetic Frobenius | sound; uniformizer-first would invert the first value |
| Parshin's formula | `[t_1^{−1},{1−t_1,t_2})_1`; `[t_1^{−1}t_2^{−1},{t_1,t_2})_1`; `[a,α)_1`, `a ∈ 𝔽_q` | `det = −1`, `a·det/(b_1b_2) = −t_1^{−1}t_2^{−1}(1+t_1+…)`, coefficient `−1`; `t_1^{−2}t_2^{−2}`, coefficient `0`; `res(dlog b_1∧…∧dlog b_n) = v_F(α)`, value `v_F(α)·Tr a`; source property (3) `({t},θ_0]_1 = 1` for `Tr θ_0 = 1` equals `Frob(y) − y = Σθ_0^{p^i} = 1` | sound; sign `Ψ(α)(y) − y` confirmed |
| 2.4 orders mod `ℓ^r`, `ℓ ≠ p` | `n=1,2` | rigidity iterated: `K_n(F)/ℓ^r ≅ ⊕_s binom(n,s) K_{n−s}(K_0)/ℓ^r`, nonzero for `n−s ∈ {0,1}`: `ℤ/ℓ^r ⊕ (K_0ˣ/ℓ^r)^n`, order `ℓ^{r(n+1)}`; `Fˣ/ℓ^r = (ℤ/ℓ^r)^{n+1}` | sound |
| 3.1 norm image | `n=1`, `F_d/F` | `N F_dˣ = {x : d ∣ v(x)}` | sound |
| 3.2 route | `n=2`, `1+t_1` versus `1+t_1^2` | same step of `U^{(i)}` for powers of `t_2𝒪`; distinct steps of `U_{𝐢}` | R12 |
| 4.2 route | `F = ℚ_p(ζ_p){{t}}` | `{ω,π} ∉ pK_2^top(F)`, image `0` in `K_2^top(F(ω^{1/p}))` (source) | R02 |
| `normSubgroup_le_normSubgroup_iff` | `L' ≤ L`; `L = L' = F` | `N_{L/F} = N_{L'/F}∘N_{L/L'} ⊆ N_{L'/F}`; `⊤ ≤ ⊤ ↔ F ≤ F` | sound |
| `reciprocityMap_mem_normSubgroup_iff` | `L = F` | `α ∈ ⊤ ↔ σ|_F = 1`, both true | sound |
| `exists_reciprocityMap_restrictNormal_eq` | non-abelian Galois `L` | lifts of `Ψ(α)` form a coset of the closure of the commutator; image of `G_L` in `G^ab` open of finite index, dense image hits every coset | sound |
| `iInf_openFiniteIndex_eq_bot` etc. without `CharP` | `ℚ_p⸨X⸩⸨X⸩` | no route in the README; `K_2^top/p^r` infinite in mixed characteristic so `p^rK^top` is not of finite index | R05 |
| `higherTopology` canonicity | `ℚ_p((X))`, two coefficient fields | `e_k → 0` in one, `X`-coefficient `−D(e_k)` unbounded in the other | R04 |
| Vostokov's formula | `p = 2` | source hypothesis `p > 2` | R06 |
| worked example, higher versus valuation topology | `t_1^k` in `𝔽_p((t_1))((t_2))` | coefficient sequence `t_1^k → 0` in `𝔽_p((t_1))` so `t_1^k → 0` for the higher topology; `v_{t_2}(t_1^k) = 0` so not for `LaurentSeries.valued` | sound |
| `LaurentField` instances | `LaurentSeries.valued` on the synonym | `def`, not `abbrev`: the global instance does not fire; `not_tendsto…` reads the element in `LaurentSeries` by `show` | sound |

**Declared gaps.** None declared and none needed beyond R02's owners, which are targets of this roadmap once written.

## Not verifiable

- Fesenko 1991a (Algebra i Analiz 3:3) and 1991b (Adv. Soviet Math. 4): cited at paper level for 3.2, 4.2, 5.1, 5.3, 5.5; the AMS and mathnet.ru copies are paywalled or time out. Listed in `needs-references.toml`.
- Fesenko 2001, *Sequential topologies* (Algebra i Analiz 13:3): the statement is confirmed through the Invitation §6 Theorems 2–3, the paper itself not read (mathnet.ru timed out).
- Parshin 1984 (Trudy MIAN 165) and Vostokov 1985 (Izvestiya 49): mathnet.ru timed out; the Invitation §§6.4.3, 7, 8.3 were used in their place.
- Neukirch, *Algebraic Number Theory* IV §§4–6 and Serre, *Local Fields* V §3, XIV: Springer, paywalled; cited by locator, uncertified. R02 and R12 rest on Fesenko's text, not on these.
- Kato 1979–1982 (J. Fac. Sci. Univ. Tokyo): cited for attribution only; not fetched.

## Source issues

- none
