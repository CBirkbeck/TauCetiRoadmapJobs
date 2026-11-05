# GATE-EtaleHomotopyTypes~1: answers to the review of 5735772

The review's three findings (F01–F03) were made at 5735772 and repaired at 931b054. This round checked those repairs, corrected a false step that the F01 repair introduced, and committed c9c6529. Line numbers refer to `TauCetiRoadmap/EtaleHomotopyTypes/README.md` and `TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean` at c9c6529.

## H01 (CBirkbeck) — applied differently

The base-change criterion is now a target of §3.8a, not a requirement on EtaleCohomologyFoundations §F.2.3. See README line 13 ("is a target of §3.8a here, since … §F.2.3 states local acyclicity for bounded constructible complexes only") and line 628 (parts (i)–(iii), each with a route). Lines 630 and 665 cite this target where they used to cite "the base-change characterization … required of §F.2.3". So no undeclared requirement remains, and the 30 gap sentences still equal the plan's. A new gap, or a wider gap:nonabelian-local-acyclicity, would ask a supplier on main for a non-abelian theorem that no roadmap states. A search of main and of the 455 open roadmap PRs for 0-acyclic/1-aspheric finds it only in this folder, and §3.8a is its only consumer.

Owning the criterion exposed a false step, now corrected. Part (i)'s route claimed that a coherent locally 1-aspheric morphism with nonempty connected geometric fibres gives an equivalence on torsor stacks. Gₘ → Spec k with C₂ refutes this: one class against two (new Check, line 657). Part (iii) now states the fibre criterion with fibres that carry no nontrivial finite L-torsor; it is owned here with a route. In characteristic zero, the passage in (ii) to non-algebraic geometric points now runs through the cohomological-properness target with K = κ^s.

## H02 (CBirkbeck) — applied

Line 634 now supplies both dimension ≤ −1 inputs relative to Spec k: (C,i) for Proposition 1.6(2) and (C,fq) on X₁ ×_X X₁. The stalk of the base-change map restricts sections along the base change of O^sh_(Z,z̄) → O^sh_(Z⊗S′,z̄′), which is flat and local, hence faithfully flat, hence surjective, and sections of an étale sheaf pull back injectively along a surjection. A negative control (Check, line 663) shows the input fails relative to 𝔸¹: for Gₘ ↪ 𝔸¹ and the non-flat base change to the origin, the base-change map C → * sends 2 elements to 1.

## H03 (CBirkbeck) — applied

`Suggested.lean` lines 56–58 now read: "Cohomological properness over an arbitrary field for every etale sheaf of sets and, in characteristic zero, for every ind-finite sheaf of groups, with universal local 1-asphericity in characteristic zero". This matches README line 632: (a) over every field, (b) and (c) in characteristic zero. Line 52 now also names the fibre criterion that part (iii) adds.

## H04 (CBirkbeck) — answered

The misprint is confirmed: at SGA1 line 11612 the étale-depth subscript is the base minus U, although U is open in X. The README does not reproduce it: line 634 states the étale depth of X₁ along X₁ ∖ U.

## Changes in c9c6529 (README unless noted)

- Line 628, statement: new part (iii). Let h:W → T be a coherent morphism of S-schemes that is locally 1-aspheric for L, whose geometric fibres are nonempty and connected and carry no nontrivial torsor under a finite L-group. Then pulling back torsors under any sheaf of ind-L-groups is an equivalence.
- Line 628, route of (i): the old clause "a coherent morphism locally 1-aspheric for L with nonempty connected geometric fibres induces an equivalence …" is replaced. The new text records the torsor triviality of the fibres X̃ ×_S̃ t, which comes from universal local 1-asphericity, and applies (iii).
- Line 628, route of (ii): adds the characteristic-zero passage to Ω via the qcqs cohomological-properness target, for the affine κ^s-scheme X̃ ×_S̃ Spec κ^s.
- Line 628, route of (iii): full faithfulness by 0-acyclicity on Isom sheaves. Essential surjectivity by these steps: filtered colimits (gap:constructible-set-continuity); the embedding F ⊂ ∏ p_(i*)C_i with C_i among the stalks of F (Stacks 09Z6/09Z7); the twisting argument of SGA1 1.13(2); finite base change (gap:nonabelian-proper-base-change); hypotheses kept under integral base change (proof of Stacks 0GJS). The tube-to-fibre step is taken from SGA 4 XV §1.
- Line 630: the descent input was "proper descent of torsor stacks (gap:proper-surjective-torsor-descent)". The stacks f′^*i_*Φ are not torsor stacks under finite constant groups: the Check at line 646 shows i_*Φ has two classes at 0 and one elsewhere. The text now cites sheaf descent from the gap, extended to every stack by SGA1 XIII Examples 1.11(2) (SGA1 line 10580) through Giraud VII 2.2.8.
- Line 13 (scope): adds ownership of the torsor fibre criterion. Line 665 (*Needs:*): adds Stacks 09Z6, 09Z7, 0GJS and Giraud VII 2.2.8.
- References: adds a Giraud entry (line 1085; it was cited without one). The SGA4 entry now covers XV §1 for the owned criteria. The StacksEtale entry adds 03Q9, 09Z6, 0F0B (with the footnote at StacksEtale line 9091) and 0GJS, with their lines.
- `Suggested.lean` line 52: "the base-change criterion for universal local acyclicity with its fibre criterion for coherent locally 1-aspheric morphisms". It still declares nothing.

## Adversarial pass (statements added or changed at 931b054 and c9c6529)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| (i) route, old torsor clause (line 628) | h:Gₘ → Spec k, k separably closed, char ≠ 2, L = {2}, F = C₂ | h smooth, coherent, fibres Gₘ⊗Ω connected; C₂-torsor classes: Spec k 1, Gₘ 2 (k^× z^ℤ mod squares, Pic 0) | old claim false | replaced by (iii) with torsor-trivial fibres; Check line 657 |
| (iii) positive case | h:𝔸¹_K → Spec K, char 0, G finite | fibres 𝔸¹_Ω simply connected; classes 1 and 1; Aut G and G | holds | Check line 657 |
| (iii) degenerate | h = id_T; W = ∅ → Spec k̄ with C₂ | id: both sides the same; ∅: Tors(Spec k̄): 1 class, Aut C₂; Tors(∅): 1 object, Aut 1 | the identity holds; ∅ is excluded by "nonempty", and its conclusion would fail | none |
| (iii) hypothesis "locally 0-acyclic" content | closed point ↪ strictly henselian DVR R | fibre over η̄ of the strict localization: ∅ | excluded; C(Spec K) = 2 vs C(∅) = 1 under (ii) | none |
| (i) torsor half | f = 𝔸¹_R → Spec R, R strictly henselian DVR, residue char 0; i:Spec K ↪ Spec R; F = C₂ | stalk at the origin of the closed fibre: H¹(K,C₂) = {1,π}; H¹(X̃[1/π],C₂) = units mod squares = {1,π} (X̃[1/π] factorial, Pic 0, O^× 2-divisible) | 2 = 2, bijection | none |
| (ii) passage to Ω, char 0 | f = id, any t₀ | Y = Spec κ^s, Y⊗Ω = Spec Ω: 1 torsor class each | holds via the qcqs c.p. target with K = κ^s | route added |
| (ii) 0-acyclic converse | closed immersion above, i = Spec K ↪ Spec R | base-change stalk C(Spec K) = 2 → C(∅) = 1 | hypothesis fails exactly when f fails | none |
| (iii) route, finite base change | Z = Spec A[x]/(x²−a), A strictly henselian, 2 invertible; a a unit or a = 0 | unit: 2 copies of Spec A; a = 0: one local scheme with nilpotent x; all strictly henselian | torsors under p_*C on T = C-torsors on Z | none |
| (iii) route, C_i among stalks | Stacks 09Z6 proof, StacksEtale line 6012 to StacksEtale line 6042 | E is the constant value of F on Spec K, a stalk | C_i are L-groups when F is ind-L | none |
| ind-L-group vs ind-finite (lines 628, 632) | ℚ/ℤ, ℤ, L = all primes and L = {2} | ℚ/ℤ: f.g. subgroups cyclic finite (in both); ℤ: excluded by both; L = {2}: ℚ₂/ℤ₂ is ind-{2}, ℚ/ℤ is not (ℤ/3) | consistent | none |
| line 630 descent input | i_*Φ for Gₘ ⊂ ℙ¹, F = C₂ (Check line 646) | 2 classes at 0, 1 elsewhere: not a torsor stack | gap's torsor-stack clause does not cover f′^*i_*Φ; SGA1 1.11(2) covers every stack | citation changed |
| H02 clause (line 634) | S′ = Spec k[ε]/ε², Z = 𝔸¹, z = 0 | O^sh → O^sh[ε] flat local, homeomorphism on Spec; base-change map bijective (topological invariance) | injective as claimed | none |
| H02 negative control (line 663) | base 𝔸¹, h:Gₘ ↪ 𝔸¹, base change to the origin, C two elements | (h_*C)_0 = C(Frac O^sh) = 2; h′_*: sections over ∅ = 1 | not injective; non-flat base change | none |
| H03 docstring vs README | `Suggested.lean` 56–58 vs README 632 | "arbitrary field … sheaf of sets", "in characteristic zero … ind-finite", "(c) in characteristic zero" | equal generality | none |

## Ownership

`roadmaps grep -i '1-aspheric|aspherique|asphérique|locally 0-acyclic|0-acyclic'` over main and the 455 open roadmap PRs (index of 2026-11-05T12:15:50Z) finds hits only in `TauCetiRoadmap/EtaleHomotopyTypes/`. EtaleCohomologyFoundations §F.2.3 on main is abelian (bounded constructible complexes; its README lines 540–553). So this roadmap owns the base-change criterion and its torsor fibre criterion, and states them in terms of the definitions requested through gap:nonabelian-local-acyclicity. `Suggested.lean` declares no name, so no declaration can collide with a fully qualified name elsewhere.

## Citations

The two leads in the citation scan both resolve. `VanishingCycles.lisseDirectImageTransport` is declared by EtaleCohomologyFoundations (README line 707, Suggested.lean line 533). `IsGeometricallyUnibranch.of_etale` is named in SchemeAndStackFoundations README line 887. Both are on main.

## Not verifiable; manifest

- SGA 4 XV §1 (the tube-to-fibre step of (iii); the passage in (ii) to non-algebraic geometric points in positive characteristic) and Giraud VII 2.1.7 and 2.2.8 are cited by locator without text. SGA4 is settled as uncertified. Giraud's *Cohomologie non abélienne* (Springer, 1971; reference [2] of SGA1 XIII, SGA1 line 12813) has been cited since 931b054 but is not in `sources.toml`.
- The manifest is outside this job's files, so it still needs these updates. Add a Giraud entry (uncertified, paywalled book, locator "VII 2.1.7 and 2.2.8"). Add "XV §1" to the SGA4 locator. Add 03Q9, 09Z6, 0F0B and 0GJS to the StacksEtale locator, which currently lists 03Q4, 03RZ, 03SA, 095Q, 09YU and 09Z7.
- No text was requested; `needs-references.toml` was not written.

## Mechanical declaration check

`Suggested.lean` declares no named declaration, so there is no `#check @name` file to elaborate and no elaborated type to compare.

## Build, depcheck and gate (at c9c6529)

`lake build TauCetiRoadmap.EtaleHomotopyTypes.Suggested`:

    ✔ [8954/8954] Built TauCetiRoadmap.EtaleHomotopyTypes.Suggested (15s)
    Build completed successfully (8954 jobs).

Dependency check:

    depcheck: 235 roadmaps, 2180 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

Gate:

    gate EtaleHomotopyTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
