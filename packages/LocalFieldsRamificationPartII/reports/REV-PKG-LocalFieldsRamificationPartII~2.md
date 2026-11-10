# Review of LocalFieldsRamificationPartII (package, round 2)

**Verdict:** needs changes

Seven findings, five blocking (one P1 and four P2). The seven admitted headline theorems elaborate and survived the padding probes. The earlier two requested repairs are applied. New issues concern ownership, supplier drift, precise hypotheses, Checks, organization and the import header.

## R01 (P2) — Two valuation results already have an earlier owner

**Location.** `packages/LocalFieldsRamificationPartII/README.md:539`: “Let `K` be henselian with separably closed residue field”; also lines 405–410, 575–576 and 1350–1352.

**Claim.** This package owns the strict-henselization valuation result, the tame character description for arbitrary value groups and its pro-`p` kernel, and supplies them to ClassicalAdicEtaleCohomology.

**Witness.** Open PR #875, `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2865`, already states the strict-henselization/value-group and decomposition–inertia result; line 3071 states all three parts of §2.2, explicitly for arbitrary rank. Merge-order positions are 75 and 388 respectively.

I read that head using `roadmaps show`, rather than inferring ownership from vocabulary. Its §5.1 gives the valuation ring, unchanged value group, residue separable closure and `D/I`; §5.3 gives the character group, finite inertia pairing and unique Sylow pro-`p` subgroup, including residue exponent one. These are the same objects and hypotheses. That roadmap does not import this package for them. Its construction is an eligible earlier new roadmap, not a revision used in place of main.

**Exact repair.** Add ClassicalAdicEtaleCohomology §§5.1 and 5.3 to Scope and ownership and Exact supplier contracts. Delete the owned strict-henselization portion of §1.2 and the owned theorem §2.2, and cite those sections wherever these results are used; retain the genuinely additional ordinary-henselization/étale-localization results. Import the overlapping `D/I` comparison in §2.3. Correct the downstream paragraph so it does not reverse this supply. Do not keep removed-target stubs. Preserve any necessary old-to-new section mapping when renumbering.

**Test of repair.** At a strictly henselian DVR, both statements give `Γ = ℤ`, unchanged value group after strict henselization, and tame quotient `∏_{ℓ≠p} ℤ_ℓ(1)`. At `Γ = ℤ²` lexicographic both give its square; at residue exponent one both give wild subgroup `1`. Importing the earlier theorem loses none of this package's generality.

## R02 (P1) — Henselization supplier names and one section have drifted

**Location.** `packages/LocalFieldsRamificationPartII/README.md:210`: “`IndEtale.henselization`, `henselization_flat`, `henselization_filtered_colimit`”; lines 212, 432–446, 678–685, 755–757 and 1026–1027 also consume these contracts.

**Claim.** SchemeAndStackFoundations §0.13 supplies these named declarations and `henselization_at_prime` at the stated location.

**Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1168` places `henselization_at_prime` in §0.12. The three quoted names occur nowhere in that roadmap; lines 180–184 instead cite pinned `TauCeti.Henselization.directLimitEquiv` and `indEtale`.

Main was checked at `5fc1aa8f`, not the older version used by the previous review. The same audit finds `local_henselization` absent as a declaration name. The supplier explicitly preserves the alias `Henselization.fixed_of_henselian` at lines 193–196, so that resolver lead is **not** a finding. It does not supply an equivalent alias mapping for the names above. The mathematics has owners, but the package currently directs implementers to nonexistent declarations/locations; this is the brief's supplier-drift P1, not a request for a new gap.

**Exact repair.** Repoint the contracts and every affected Needs line to:

- `TauCeti.Henselization.indEtale`, `TauCeti/RingTheory/Henselization/IndEtale.lean:47`, and `TauCeti.Algebra.IndEtale.flat` for flatness;
- `TauCeti.Henselization.directLimitEquiv`, `TauCeti/RingTheory/Henselization/DirectLimit.lean:153`, for directed systems of pairs;
- `TauCeti.Henselization.henselianLocalRing` and `existsUnique_isLocalHom`, `TauCeti/RingTheory/Henselization/Local.lean:60` and line 104, for the local construction/universal property;
- SchemeAndStackFoundations §0.12 for `henselization_at_prime`, retaining §0.13 for the still-planned integral-base-change and coprime-product statements.

**Test of repair.** For the constant directed system `(R,I)`, `directLimitEquiv` compares the same henselization on both sides. For `(R,𝔪)` local, the supplied local instance and local lifting property give exactly the input used in §1.3. No new mathematical obligation or later supplier is introduced.

## R03 (P2) — Attach the module flatness hypothesis explicitly

**Location.** `packages/LocalFieldsRamificationPartII/README.md:479`: “a finite module over a finite-type `A`-algebra that is flat over `A` is finitely presented”.

**Claim.** The syntax attaches flatness to the finite-type algebra; the required flatness of the finite module is not unambiguously stated. The following “Prove the same” propagates this ambiguity to Prüfer domains.

**Witness.** `stacks-more-algebra` line 2909 requires the module `M` to be flat over `A`. Take a valuation ring with value group `ℚ`, `B=A`, `M=A/𝔪`: `B` is flat and finite type; `M` is cyclic but not finitely presented.

Here `𝔪` is not finitely generated: a finitely generated ideal in a valuation ring has a least generator value, whereas the positive rationals have no least member. Thus the nearest-antecedent reading is false, as the package's own Check at lines 491–493 already recognizes for the corresponding quotient algebra.

**Exact repair.** State the two results with named objects: “If `B` is a finite-type `A`-algebra flat over `A`, then `B` is finitely presented over `A`. If `B` is a finite-type `A`-algebra and `M` is a finite `B`-module flat as an `A`-module, then `M` is finitely presented over `B`.” Make the Prüfer clause equally explicit. For its module statement, use the homogenization argument of Stacks 053E(2), `stacks-more-algebra` lines 2911–2919: quotient the graded module by its `A`-torsion, use torsion-free implies flat over a Prüfer domain, then apply 053D(2) and 05GS(3), lines 2879–2902, and dehomogenize. This supplies the module route separately from Raynaud–Gruson’s algebra statement.

**Test of repair.** For the witness, `M` has nonzero `A`-torsion and fails the corrected hypothesis. `M=B=A` remains in scope and is free of rank one. This clarification does not undo the repaired domain-algebra argument of F01.

## R04 (P2) — The root bound needs a positive degree and a defined threshold

**Location.** `packages/LocalFieldsRamificationPartII/README.md:1002`: “degree `n` with `ε := v(f − g)/n + min(0, min_i v(α_i)) > 0`”; the first Check at lines 1010–1012 reuses `ε`.

**Claim.** The displayed bound is defined for monic polynomials of any common degree, and the Check with `f=g=(X−1)(X+1)` has that `ε=1`.

**Witness.** `f=g=1` has `n=0` and no roots: both division and the minimum are undefined. For `f=g=(X−1)(X+1)` over `ℚ₂`, the displayed formula gives `ε=∞`, whereas the Check sets `ε=1`.

The cited source distinguishes an independently chosen tolerance in Theorem 14/Example 15 (`cks23` lines 610–625) from the calculated bound of Theorem 16 (`cks23` lines 637–653). The package conflates them and does not define the polynomial Gauss valuation used in the formula.

**Exact repair.** Require `n≥1` for the quantitative formula, define `v(f−g)` as the minimum coefficient value with `v(0)=∞`, and separate the calculated bound from an arbitrary finite positive tolerance. For example put `γ*=min(0,min_i v(α_i))` and assert the conclusions at any `0<ε≤v(f−g)/n+γ*`; uniqueness requires `ε>max_{i≠j}v(α_i−α_j)` (or explicitly use pairwise inequalities). Handle constants separately as the empty-root case, with no division. Restate the first Check as a tolerance test, not a value of the formula.

**Test of repair.** For `f=g=1`, the root assertion is empty and no denominator occurs. For `f=g=(X−1)(X+1)`, tolerance `1` admits both roots since the two distances have values `∞` and `1`; tolerance `2` admits just the identical root. For `f=X`, `g=X−2`, the bound and root-distance value are both `1`.

## R05 (P3) — Two negative-control Checks are false

**Location.** `packages/LocalFieldsRamificationPartII/README.md:274`: “a definition without the positivity clause would also admit `0`”; and line 1044: “Henselization does not turn a non-purely-wild `E/K` ... into a purely wild one.”

**Claim.** The first assertion is made for `P=∅`; the second has no henselian-extension hypothesis.

**Witness.** For `P=∅`, the positivity-free condition at zero is false because `2∣0` and `2∉P`. For `E=ℚ(√2)`, `K=ℚ` at `7`, `E/K` is not purely wild, but `Eʰ/Kʰ` is the identity and is purely wild.

**Exact repair.** Keep the statement that the only `∅`-number is one, but delete its false positivity explanation; use `P` equal to all primes to demonstrate why positivity is necessary (the next Check already does this). Restrict reflection of pure wildness under henselization to **henselian extensions** `E/K`, and use the same `7`-adic extension as the negative control when that hypothesis is omitted. In §0.2, render the existing prose list of extension laws as the definition's API bullet list, as required by the package form.

**Test of repair.** The weakened integer predicate rejects zero for `P=∅` and accepts it for all primes; the actual definition rejects it in both cases. At `7`, `X²−2` has the two simple roots `±3` modulo `7`, hence two prolongations and `Eʰ=Kʰ`; restricting to henselian extensions excludes this example. A tame radical over henselian `ℚ_p` retains its nontrivial prime-to-`p` ramification and is still not purely wild after henselization.

## R06 (P2) — A source-ordered branch is not forced by the dependencies

**Location.** `packages/LocalFieldsRamificationPartII/README.md:990`: “Layer 4: height one”; line 1084: “Layer 5: composition and finite height”; dependency lines 1082 and 1234–1235.

**Claim.** The layer order is derived from mathematical dependencies rather than the source's exposition.

**Witness.** Layer 4 follows Temkin §2.5; Layer 5 follows Temkin §2.6.1–2.6.4. Layer 5 explicitly needs only Layers 1–2, not Layers 3–4. Their source order is therefore not forced.

This is the precise organization pattern the brief disallows, despite the mathematical layer titles and the valid dependency-forced order from henselian splitting to height-one splitting. It is not a claim that the mathematics in the two branches is false.

**Exact repair.** Put the composition/height branch after its actual prerequisites and before the profinite/height-one splitting branch, or organize the two as explicitly parallel prerequisite branches for the final tameness theorem. Update the build paragraph, layer numbers, Needs lines and Lean section comments consistently; provide an old-to-new mapping for moved ids used by consumers. Do not invent a dependence of composition on splitting merely to justify the existing order.

**Test of repair.** The composite valuation on `ℚ_p((t))` has values `(1,0)` and `(0,1)`, height two and coarse quotient `ℤ/p` for `s^p=t`, using only Layers 1–2 and valuation composition. None of these calculations invokes Pank splitting or rank-one approximation; both branches still feed §6.2.

## R07 (P3) — Restore the required import form

**Location.** `packages/LocalFieldsRamificationPartII/Suggested.lean:1`: `module`; line 3: `public import Mathlib`; line 43: `@[expose] public section`.

**Claim.** The worker's module-system header is used in place of the acceptance test's prescribed `import Mathlib` header.

**Witness.** A scratch copy with ordinary `import Mathlib`, the same two ordinary `TauCeti.*` imports, and no module/public-section wrappers elaborated successfully with all fourteen `#check @...` commands. Only the seven `sorry` warnings remained.

**Exact repair.** Remove `module` and `@[expose] public section`, and replace the three `public import` lines by ordinary `import` lines. Keep the two used Tau Ceti modules and all theorem signatures. This follows the explicit job contract, notwithstanding the repair report's account of a different warning during an earlier build.

**Test of repair.** The signature-copy elaboration returned exit zero; the henselian binder, both groups' compactness/total-disconnectedness, valuation-extension instance and finite-transcendence-degree hypothesis all remained in the printed signatures.

## Previous findings checked first

- **F01 — repaired.** README lines 481–483 now say “as the case of a domain of the theorem that a flat finite-type algebra over a domain is finitely presented”. The Raynaud–Gruson Corollaire 3.4.7 locator and reference are present. The old localization argument is expressly rejected. At `A=∏ℕ 𝔽₂`, `I=⊕ℕ 𝔽₂`, localizations of `A/I` are `0` or `𝔽₂`, but `I` is not finitely generated; the repaired domain claim excludes this ring. R03 is a separate ambiguity in the module clause, not a re-raising of F01.
- **F02 — repaired.** README lines 865–867 now conclude “by `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`, which assumes nothing pro-`p` about `E`”. I read the pinned compatibility proof, including its private finite-quotient argument. Replacing its source pro-`p` hypothesis by the stated pro-`p` kernel works: `K_U` is the finite image of the closed subgroup `H∩ker f`; minimality makes every element of `H` over `g` have reduction `β_U(g)`, which forces compatibility. The finite-solvability and inverse-limit steps are imported, not re-planned. The new `Ẑ` Check is correct. No settled “not actionable” finding is re-raised.

## Verified sound

**Coverage and method.** Read all 43 numbered target subsections, all their API and Check paragraphs, the conventions and supplier contracts, both earlier reports, the fourteen Lean declarations, metadata and all ten source entries. The previous review's computed examples were recomputed where used below; uncomputed summaries were not treated as evidence. Read the main SchemeAndStackFoundations, ModularCurves and completed ProfiniteProPGroups roadmaps for shape and supplier contents. No package input file was changed, and no source-manifest addition was needed.

**Principles and form.** The extension from local fields to arbitrary Krull valuations is a genuine Part II; no finite-residue, discrete, perfect-residue or henselian shortcut is imposed on the final theorem. No copied source passage, computational algorithm, sorry-valued data, `set_option`, admitted example, `lemma`, process date, PR number or machine path occurs in the package text. The only ownership/organization defects found are R01/R06. All fourteen own backticked identifiers resolve to the seven definitions and seven theorems in Suggested.lean, and every Lean name occurs in the README. Each definition has at least three Check bullets in its subsection (some definitions share a list); the invalid controls and the prose-form API exception are R04/R05. Layers have Examples and Dependencies endings. The module-header exception is R07.

**Elaboration and binder audit.** From the pinned content checkout, ran the prescribed `lake env lean` command on the package Suggested.lean: exit zero, exactly seven warnings, all “declaration uses `sorry`”, at lines 108, 116, 131, 148, 163, 174 and 184. The two imported Tau Ceti object files were available; no build was necessary. A separate scratch copy appended `#check @name` for every one of the fourteen declarations and tested the R07 header repair: exit zero, only those same warnings. Compared all printed signatures with the README and the worker's signature file. No binder was lost. In particular, the KPR theorem retains `[HenselianLocalRing V]`; the section theorem retains the topology/group/compactness/total-disconnectedness assumptions on both groups; the Abhyankar theorem retains `[vK.HasExtension vL]`; the height bound has `Algebra.trdeg K L = n`; and the characteristic-`p` bound retains `[Fact p.Prime]` and `[CharP F p]`. No theorem was modified in the package.

**Padding.** Replaced each of the seven `sorry`s in a scratch copy by alternatives testing `rfl`, `infer_instance`, goal-closing `simp`, and goal-closing `simp_all`. All seven failed, at proof lines 111, 124, 137, 157, 166, 177 and 188. The near-match declarations were compared at the pin: none is an exact one-lemma proof of a retained headline. The `IsSepClosed` and perfect-field results concern stronger closedness conditions; the available local-field pro-`p` quotient bound is not the full absolute Galois group of an arbitrary characteristic-`p` field; the projectivity lift requires a pro-`p` covering group. No padding finding.

**Headline inventory.** The summary's statable headlines are all present: the two tameness exports (§§6.4–6.5), henselian KPR splitting (§3.6), characteristic-`p` cohomological dimension (§3.1), the section theorem (§3.2), elementwise Abhyankar and the height bound (§5.3). The module docstring names the non-henselian height-one splitting, valued-field tensor decomposition/decompletion and composition criteria as not yet statable on their intended carriers. The pin now has henselization of **rings/pairs**, but no valuation-ring structure or fraction-field valued henselization constructed on it, and Mathlib's general ramification module still has only decomposition and inertia, not general wild inertia/tame closure. Thus a ring henselization's presence alone does not justify a sorry-valued valued-field construction or a substitute headline. No additional statable summary headline was established missing in this audit.

**Dependency check.** Ran the exact prescribed gate command. Its output was:

```
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line was read separately: the mechanical clean result does not detect the misclassified earlier owner in R01 or the declaration drift in R02. Internal forward references to §2.4 in §2.1 do not form a cycle: the definition in §2.4 uses §2.3/§2.2, neither of which depends on §2.1.

**Declared gap.** `gap:source-side-fpqc-descent` is present with the same needs in README line 216 and `packages/LocalFieldsRamificationPartII/design/plan.json:3236`, naming SchemeAndStackFoundations Layer 1 §1.1. Both clauses have their hypotheses and form the two successive source-descent inputs of §2.1. EGA 17.7.5(iv) and 17.7.7 read as stated (`ega4` lines 2750–2758 and 2795–2798). The pinned tensor-product descent theorems descend a **base change**; they do not already provide this source-descent contract. No new or unowned gap is requested. Because this verdict is needs_changes, no conditional-acceptance list is recorded.

**Seeded source sample (all fifteen targets).** The author flags no additional locator as unverified. Printed/source-version pages were checked, not inferred from PDF page indices. “Supports” below means the stated mathematical claim, allowing the cited elementary deductions; ownership is a separate audit.

| Target | Locator and text read | Outcome |
|---|---|---|
| 0.2 Prime-supported algebraic extensions | temkin17 §2.1.1, p. 103, lines 256–270 | Supports non-Galois extensions, tower laws, subextensions, unions and maximal extensions. |
| 0.5 Split towers | temkin17 §2.1.2, p. 103, lines 272–274 | Supports linear disjointness plus compositum, with prescribed factor maps. |
| 1.2 Étale maps and henselization | stacks-more-algebra 0ASJ/0ASK, pp. 382–383, lines 17762–17806 | Supports valuation rings and value-group equality; ordinary/strict residue identifications are from the henselization contracts. R01 concerns ownership. |
| 1.4 Tensor decomposition | temkin17 Lemma 2.3.2, pp. 104–105, lines 318–327; ega4 18.6.8, printed p. 139, lines 5517–5531 | Supports integral semilocal base change without module finiteness. Distinct prolongations correct the source's indexing slip. |
| 2.1 Étale criterion | temkin17 Lemma 2.3.8, pp. 105–106, lines 353–383; ega4 17.7.5/17.7.7, pp. 73–75, lines 2750–2810 | All finite-extension and finite-height qualifications match. R03 concerns the auxiliary module clause, not this algebra descent. |
| 2.3 Ramification tower | temkin17 §2.3.5/Remark 2.3.6, p. 105, lines 337–343, and §2.2.6, p. 104, lines 301–306 | Tower and conjugacy match; D/I and strict-localization portion also have the earlier owner in R01. |
| 2.4 Unramified/strictly unramified | temkin17 §§2.2.3/2.3.7, pp. 104–105, lines 290–292, 344–349 | Supports henselized definitions and residue equality, with strictly unramified closure Kʰ. |
| 2.5 Tame extensions | temkin17 §§2.2.5–2.2.6, p. 104, lines 296–306; §2.3.7, p. 105, lines 344–347 | Henselian defect-free criterion and general henselized definition match. Finite Galois inertia test is its Galois formulation. |
| 2.7 Total ramification/pure wildness | temkin17 §§2.2.4/2.2.7, p. 104, lines 293–295, 307–310; §2.3.12, p. 106, lines 397–401 | Supports purely inseparable residue extensions and the henselian-extension condition. |
| 2.8 Tame fields | temkin17 §2.3.9, p. 106, lines 384–387 | Supports Kᵃ=Kᵗ, Kˢ=Kᵗ and perfection; no henselianity assumed. |
| 3.1 Characteristic-p cd bound | serre-cg II §2.2 Prop. 3/Cor. 1; kpr86 p. 44, lines 221–234 | Serre unavailable by settled status; KPR explicitly corroborates the characteristic-p/free-Sylow input. |
| 3.2 Pro-p-kernel sections | serre-cg I §3.4 Prop. 16; kpr86 p. 44, lines 230–245 | Serre unavailable by settled status; KPR explicitly states the splitting consequence and relative subgroup form. New route checked at the pin. |
| 4.2 Decompletion | temkin17 Lemma 2.5.2, pp. 109–110, lines 505–524 | Height one and separability match; finite-degree descent followed by a compatible Zorn construction is supported. R04 affects the auxiliary quantitative bound. |
| 5.3 Abhyankar/height | kkv16 Lemma 2.1, p. 6, lines 238–242 and inequality (12), p. 8, lines 356–362; temkin17 p. 112, lines 633–638 | Independent value/residue families match. Finite-transcendence-degree inequality is explicit; arbitrary-family version follows by finite subsets. Convex-chain counting explains the stronger explicit height formulation. |
| 5.4 Unramified composition | temkin17 Lemma 2.6.3(i), p. 111, lines 574–590; temkin10 Prop. 2.2.2, pp. 11–12, lines 520–549 | Finite-height/finite-extension proof and filtered-union extension match; finite generation argument has its stated hypotheses. |

Also reread the changed §1.5 input (stacks-more-algebra 053E, lines 2906–2919; temkin17 lines 376–383), the root-continuity claims (cks23 lines 610–653 and 683–695), KPR's algebraic complement theorem (kpr86 lines 154–198), and the source remarks listed below. All ten works have unique manifest entries. The two settled uncertified entries were neither renamed nor fetched again.

**Adversarial computations.** The table covers the sample, all headline signatures, every finding involving mathematics, and the other target subsections. Each row records actual values rather than a bare “checked”. Rows bundling adjacent APIs use the same instance to test their associated equivalences/maps.

| Statement | Instances | Computed values on the two sides | Result / change |
|---|---|---|---|
| 0.1 / IsPNumber | ∅; {3}; all primes | At n=0: actual predicate false; positivity-free predicate false for ∅, true for all primes. n=1 true; n=6 false for {3}; n=9 true. | Definition sound; Check R05. |
| 0.2 P-extension / tower laws | Two cubic fields in splitting field of X³−2; identity | Each degree 3; normal closure/compositum degree 6; identity degree 1. Cubic fields qualify for {3}, compositum does not. | No Galois or compositum closure silently added. |
| 0.3 / both closedness predicates | 𝔽_q; separable closure of 𝔽_p(t); P=∅ | Degree-ℓ finite-field extension disproves both; t^(1/p) has degree p and is inseparable, distinguishing the predicates; only degree 1 tested for ∅. | Sound. |
| 0.4 maximal P-extension | P=∅, all primes, {3} | Maximal fields K, Kᵃ, and a maximal field containing the cubic but not its degree-6 normal closure. Missing p-th root has degree p. | Sound; choice not normal/canonical. |
| 0.5 split tower | Q(√2,√3); distinct S₃ cubic fields | Quadratic tensor dimension 2·2=4 equals compositum degree 4; cubic tensor dimension 3·3=9 exceeds compositum degree 6 although intersection degree is 1. | Correct disjointness condition. |
| 1.1 normalization | Q(√2) at 7 and 3; trivial valuation | Mod 7 roots ±3 give 2 maximal ideals/prolongations; mod 3 no root gives 1; trivial valuation integral closure is L with maximal ideal 0. | Sound. |
| 1.2 étale/henselized rings | Field; Z_(p); adjoining √p | Field: Γ=0 both sides; Z_(p) and henselization: Γ=Z, residue F_p; √p extension: index 2 and Γ=(1/2)Z, so not étale. | Mathematics sound; ownership R01. |
| 1.3 valued henselization | Trivial valuation; Q at p | Kʰ=K for trivial valuation; Qʰ/Q has e=f=1 and is countable, Q_p uncountable; completion is not henselization. | Sound; supplier links R02. |
| 1.4 tensor decomposition | Q(√2)/Q at 7; F_p(t^(1/p))/F_p(t) | First tensor has 2 field factors, total degree 2; second has 1 field factor, degree p, not a nonreduced p-fold factor. | Correct indexing and inseparability treatment. |
| 1.5 algebra/module finite presentation | Z[1/2]; Boolean quotient; valuation residue module | Z[1/2]=Z[X]/(2X−1), flat and f.p.; Boolean quotient is locally 0/F₂, globally not f.p.; B=A flat, M=A/𝔪 cyclic/non-f.p./nonflat. | F01 repaired; R03 disambiguates module hypothesis. |
| 2.1 étale criterion | Identity; Q_p(√p) | Identity e=f=1, étale true; radical e=2 and maximal ideal (√p) strictly contains (p), étale false. | Both directions agree. |
| 2.2 tame structure | F_p^sep((t)); C((t)); Γ=Z² | Tame quotient ∏_(ℓ≠p) Z_ℓ(1); for C((t)), Z-hat(1), wild group 1; rank-two character group is the square. | Earlier theorem, R01. |
| 2.3 tower | Trivial valuation on F_p(t); henselian K; Q at 2 | Trivial: D=G_K, I=W=1, Kᵘ=Kᵗ=Kˢ≠Kᵃ. Henselian: fixed field of D is K. Q example below: image D=C₂, not normal in S₃. | Correct separable fixed-field universe. |
| 2.4 unramified/strict | F_(p^r)((t))/F_p((t)); Kʰ/K | e=1, residue degree r, unramified true, strict iff r=1; Kʰ/K has residue degree 1 and is strict. | Correct distinction from separably closed residue. |
| 2.5 tame finite extension | Q_p(p^(1/ℓ)), ℓ≠p; Q_p(p^(1/p)); immediate defect extension | e=ℓ, f=1, degree ℓ is tame; e=p is wild; defect case e=f=1 but degree p is wild. | Defect hypothesis is essential. |
| IsTameGaloisExtension | Cyclotomic and unramified cases | Inertia orders p−1 for ζ_p (odd p), 2 for Q₂(i), p(p−1) for ζ_(p²), 1 for unramified degree p. Coprimality true,false,false,true. | Inertia, not decomposition, is tested. |
| galoisTamePart | Henselian K; Q at 2 and S₃ polynomial | Henselian: equals Kᵗ. For X³−X−2, normal subextension fixed by the normal closure of a transposition is Q, while one cubic field lies in Kʰ. | Correctly not identified with Kᵗ in general. |
| 2.6 henselian extension | Q/Q; Q(√2)/Q at 7; purely inseparable degree p | Prolongation counts 1,2,1; tensors with Kʰ have 1,2,1 field factors, respectively. | Relative henselianity separated from henselian base. |
| 2.7 total/pure wild | F_p(u^(1/p))((t)); Artin–Schreier a^p−a=t^−1; tame radical | First e=1,f=p with inseparable residue: total and purely wild. Second v(a)=−1/p,e=p,degree p. Tame radical e=ℓ≠p: total but not purely wild. | Convention correctly permits inseparable residue. |
| 2.8 / tame predicates | Trivial F_p(t); algebraically closed K; Q_p | Trivial inertia 1 gives separably tame=true, perfect=false, tame=false; algebraically closed: both true; Q_p inertia p(p−1) disproves both. | Perfectness excludes the wrong model. |
| 2.9 tower/union laws | Identity tower; union F_p((t^(1/ℓ^n))), ℓ≠p | All six properties true for identity. Radical tower has degrees ℓ^n and tame finite subextensions; union tame. In a chosen 7-adic embedding Lʰ=LKʰ=Kʰ. | Sound with fixed compatible prolongations. |
| 2.10 local-field comparison | Q₂(ζ₇); Q_p(p^(1/ℓ)) | Frobenius ζ₇↦ζ₇²; inverse sends ζ₇↦ζ₇⁴, different. Radical e=ℓ,f=1 and p∤ℓ. | Supplier arithmetic convention matches. |
| 2.11 perfection | F_p(t) t-adic; tame radical; Artin–Schreier | Γ: Z→Z[1/p]; radical degree remains ℓ; AS degree remains p, now potentially immediate but still wild. | Purely inseparable base change does not erase wild separable degree. |
| 3.1 headline | F_p; separably closed char-p field; Q_p | cd_p=1≤1; 0≤1; Q_p has cd_p=2 and violates CharP hypothesis. | Signature sound; Serre text unavailable. |
| 3.2 headline | S₃→C₂ at p=3; C_(p²)→C_p; identity | Kernel C₃, cd₃ C₂=0, section sends generator to a transposition. Cyclic p² quotient has no order-p lift of generator and cd_p C_p=∞. Identity section=id. | Nonabelian and nonsplit controls agree. |
| 3.2 repaired compatibility | Z-hat→∏_(ℓ≠p) Z_ℓ; U=p^k Z-hat | Minimal H=0×G; H∩ker f=1; K_U=1 and β_U=0 in E/U=C_(p^k). Across all U the compatible family yields inclusion of G. | Repaired argument works without E pro-p. |
| 3.3 maximal ramification classes | S=∅, {tame}; Q_p | Maximal fields Kᵃ, Kᵗ; purely wild fields exclude tame radicals of degree ℓ≠p. Nontrivial tame action prevents a direct-product complement. | No canonical/normal maximal choice asserted. |
| 3.4 complements | Trivial valuation; Q_p | Trivial: Kʰ⊗Kˢ=Kˢ and Kᵘ⊗K=Kˢ. Q_p: unramified complement residue is F_p^sep; compatible prime-to-p radicals supply value group Z_(p). | Tensor dimensions/disjointness fit. |
| 3.5 splitting and nonnormality | X³−X−2 over Q at 2 | Values at ±1 are −2, at 2 is 4, at −2 is −8; discriminant −104; G=S₃. Local simple root and ramified quadratic give D=W=C₂ image, not normal. | Quotient formulation correctly restricted. |
| 3.6 KPR headline | Residue exponent 1; separably closed imperfect henselian K; Q_p | First Kᵗ=Kᵃ,E=K; second Kᵗ=K,E=Kᵃ; in both E∨Kᵗ=Kᵃ. Q_p admissible E excludes prime-to-p radicals; KPR extension theorem completes every maximal choice. | No counterexample or tautological hypothesis. |
| 4.1 root bound | Constants; f=g=X²−1; X versus X−2 | Constant n=0, empty minimum; equal quadratic calculated bound ∞ versus Check tolerance 1; linear bound=distance value=1. | R04. |
| 4.2 decompletion | L=Kʰ; Qʰ(√p)/Qʰ; henselian K | Descents E=K of degree 1, E=Q(√p) of degree 2, E=L with unchanged degree. | Correct relative meaning of henselian extension. |
| 4.3 reflection Check | Q(√2)/Q at 7 | Original extension has 2 prolongations and is not purely wild; chosen henselized extension has degree 1 and is purely wild. | R05; theorem's explicit henselian-extension hypothesis survives. |
| 4.4 height-one splitting | Residue exponent 1; separably closed imperfect K | First tensor Kᵃ⊗K=Kᵃ; second K⊗Kᵃ=Kᵃ, with purely inseparable complement. | Sound. |
| 4.5 rank-one tameness | Q_p; C_p; C((t)) | X^p−p has degree p over Q_p, hypothesis false; C_p has no finite extension and is tame; residue exponent 1 imposes only degree 1. | Sound. |
| 5.1 composition | Q_p((t)), t-adic then p-adic | v(t)=(1,0), v(p)=(0,1), v(p^−1)=(0,−1); kernel of Z²→Z is second Z. p^−1 is coarse-integral, not fine-integral. | Correct map direction and normalization. |
| 5.2 height | Field; DVR; composite | Prime-chain lengths 1,2,3 give heights 0,1,2; composite coarse/final exponents 1,p. | Index range 0≤i≤d avoids negative natural subtraction. |
| 5.3 Abhyankar headline | F_p(t) t-adic and Gauss; x=0; empty families | Contributions 1+0=1 and 0+1=1; x=0 fails hx for exponent vector (1), since 0 is a base value; empty families give 0≤trdeg. | Neither zero-value junk nor empty-index counterexample. |
| 5.3 height headline | Algebraic extension; Q(t) composite; trivial base | n=0 gives equal heights; Q(t) has 2=1+1; trivial base height 0 permits height at most trdeg. | Finite n explicit; infinite base height makes bound automatic. |
| 5.4 composition criterion | Constant unramified extension; s^ℓ=t; endpoints | Constant extension: coarse e=1, residual e=1; radical: coarse e=ℓ>1. At i=0/d one stage is trivial and the other original. | Both directions agree. |
| 5.5 tame composition | Q_p((s))/Q_p((t)), s^p=t | Coarse tame=true, residual tame=true, coarse value quotient Z/p has p-torsion; fine tame=false. | Final residue prime is essential. |
| 5.6 tame fields | Q_p((t)); algebraically closed K | Coarse residue exponent 1 gives coarse tame=true, Γ=Z not p-divisible, residual Q_p not tame, fine tame=false. Algebraically closed: all true, value group divisible. | Sound. |
| 6.1 residue/value control | Hypothetical p-closed K; Q_p | Adjoining a missing p-th root would have degree p; prohibited, so Γ/pΓ=0. Q_p has Γ/pΓ=Z/p and fails closedness. | Positive-prime and characteristic-zero coarsening cases separated. |
| 6.2 finite-height induction | Heights 0,1,2 | 0: perfect trivial valuation, inertia 1; 1: §4.5; 2: heights i=d−i=1 with Γ_coarse/pΓ_coarse=0 from §6.1. | Induction decreases both heights. |
| 6.3 descent | K algebraic over prime field; L=K | Choose K₀=K in first case, height≤1; in second finite descended degree 1 and tensor is K. Relative algebraic closure preserves trdeg n and finite degrees by regularity. | No finite-generation assumption after closure. |
| 6.4 tameness headline | Residue exponent 1; trivially valued p-closed K; Q_p/F_p((t)) | First prime support ∅, hypothesis true and inertia prime to 1; trivial case reduces to perfection. Last two have degree-p extensions, so hypothesis false. | No good-prime restriction. |
| 6.5 separable headline | Separable closure F_p(t); P=∅; finite field Laurent series | First separable extensions degree 1, inertia 1, yet inseparable degree p persists; P=∅ makes hp false; AS degree p disproves closedness for F_q((t)). | General imperfect-field signature correct. |

**Pinned declaration evidence.** Inspected definitions and hypotheses, not just name hits. Relevant native definitions and the closest nonmatching library theorems include:

- `Mathlib/RingTheory/Valuation/ValuationSubring.lean:37`: a subring of a field with the alternative that an element or its inverse belongs. It does not include completeness, henselianity, finite rank or residue perfection. `ValueGroup` line 161, `ofLE` line 232, `idealOfLE` line 284, `ofPrime` line 298, its two inverse laws at lines 327 and 334, and `comap` line 854 supply the stated base API.
- `Mathlib/RingTheory/Valuation/RamificationGroup.lean:29` and line 49: stabilizer and kernel of the residue action; no wild subgroup. This explains the retained finite-inertia predicates and the missing general tame-closure carrier.
- `Mathlib/RingTheory/Valuation/Extension.lean:68`, lines 134, 169, 197 and 243: equivalence after restriction, integer-ring algebra/local-map instances, valuation-subring algebra and actual-value-group map. `RankOne.lean:56` includes nontriviality. These support the signatures' choices of carriers.
- `Mathlib/FieldTheory/LinearDisjoint.lean:158`, lines 699 and 716: linear disjointness and the algebraic tensor-field result; `PurelyInseparable/Tower.lean:97` requires a purely inseparable tower and a separable intermediate field. `PurelyInseparable/Basic.lean:322` needs finite dimension for prime-power finrank. These are consumed, not new substitute headlines.
- `Mathlib/Analysis/Normed/Field/Krasner.lean:56`, lines 63 and 73: separability/splitting hypotheses in the predicate and complete ultrametric base in the existence theorem; it does not settle the henselian, potentially incomplete case of §4.1.
- `Mathlib/NumberTheory/SmoothNumbers.lean:45` and line 75: `Nat.factoredNumbers` and its prime-divisor test have **finite** prime-support input. `IsPNumber` allows any set, including all primes; that variant is not the same object.
- `Mathlib/RingTheory/Etale/Basic.lean:205`: formal étaleness plus finite presentation. `Etale/Descent.lean:79` and `Finiteness/Descent.lean:98` have a faithfully flat tensor **base change**, as the package says. They do not discharge the declared EGA source-descent gap.
- `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`: all open-normal quotients are p-groups. `Sylow/Basic.lean:62`, `Existence.lean:102`, `Conjugacy.lean:42` and line 48, `Functoriality.lean:52`, `CohomologicalDimension.lean:95`: existence/conjugacy, normal uniqueness, compact-to-Hausdorff surjective transport, and equality of cd with a Sylow subgroup. No finite-generation restriction is imported.
- `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131`, lines 146 and 194: vanishing with all discrete p-primary coefficients, least extended-natural bound, and its comparison with the vanishing predicate. The coefficient universe remains polymorphic in the headlines.
- `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/PGroupKernel.lean:85` and line 172, `CohomologicalDimension.lean:64`, `Level.lean:85`, `Compatible.lean:41`, `Projective.lean:150`, lines 197 and 204, `Lift.lean:35`, and `TauCeti/Topology/Algebra/Group/ClosedSubgroup.lean:208`: the repaired route's exact inputs. The pro-p assumption on the covering group in Projective.lean is why §3.2 remains a genuine extension.
- `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:327` and line 340 identify the separable-closure and Mathlib absolute Galois groups. `TauCeti/NumberTheory/LocalField/ProP/Free.lean:100` bounds a local-field maximal pro-p quotient under a roots-of-unity hypothesis; it does not prove §3.1. `TauCeti/NumberTheory/LocalField/RamificationIndex.lean:161` and `Unramified/Inertia/Basic.lean:112` supply the local comparison notions.
- The henselization files and declarations opened in R02 exist at the pin; their presence does not create the absent valued-field structure. The native `ringKrullDim`, `Algebra.trdeg`, `Field.absoluteGaloisGroup`, `HenselianLocalRing`, `PerfectField`, `ringExpChar` and `AlgebraicIndependent` used by the seven signatures were also elaborated through the import and signature checks.

**Supplier resolutions and overlap audit.** The board package index was read before any absence claim. The supplied overlap file reports no shared-head conflict, dropped cited id, or id defined only by an open revision. Its closest-head list was followed: AdicCoefficientsAndComparisonsPartII (#1796) explicitly imports this roadmap's general valued-field tameness (README lines 18 and 94); QuadraticFormInvariantsPartII (#1834, README lines 83–84) imports henselization, decompletion and Abhyankar; EtaleDualityAndPerverseSheavesPartII (#1743, README line 146) imports the strictly henselian tame quotient from ClassicalAdicEtaleCohomology; DiamondEtaleCohomology (#922, §C8.35) concerns prime-to-p cohomological dimension after quotienting, not a section through a p-kernel; ProfiniteProPGroups (#1187) is represented by the completed roadmap on main for supply. No same-fully-qualified-name collision with the fourteen declarations was found.

The object searches used `roadmaps grep` across main and the indexed open heads for prime-supported extensions, Pank, pure wildness, tame fields, Abhyankar, valuation henselization, height and Krasner; this found the additional **positive** ownership conflict R01, not present in the vocabulary-only shortlist. The earlier main local-field owner covers complete discrete finite-residue fields, not the general extension. The main pin's function-field Abhyankar lemma concerns ramification indices in composita, not the rational-rank/transcendence-degree inequality.

Resolved present suppliers: SchemeAndStackFoundations §§0.12–0.13 at main lines 1160–1237 with the drift documented in R02; ModularCurves 4D at main lines 1926–2000 (the strict henselization and its native universal property); `Completed/LocalFieldsRamification/README.md:576`, line 724 and its Layer 4 for the local predicates and arithmetic Frobenius; `TauCetiRoadmap/ProfiniteCohomology/README.md:4125` and line 4130 explicitly map the two old cd names to pinned results; `Completed/ProfiniteProPGroups/README.md:1094`, lines 1131–1165 and 1316–1325 resolve the repaired §§5.1–5.6 and Serre-step citations. The new ClassicalAdicEtaleCohomology supply in R01 is earlier in the order and introduces no upward edge.

The two consumers' legacy `GF.*` labels do not occur in this README. The earlier review already observed that mismatch. The supplied overlap report identifies no id dropped by this package relative to a prior published README; I did not invent a historical deletion finding from consumers' labels alone. Any renumbering required by R01/R06 should now carry an explicit mapping.

## Not verifiable

- `serre-cg`, I §3.4 Proposition 16 and II §2.2 Proposition 3/Corollary 1: the primary text is settled as uncertified/paywalled. KPR's readable p. 44 corroborates the applications but is not a substitute for inspecting Serre's pages. No new source request was made.
- `rg71`, Corollaire 3.4.7: settled as uncertified/paywalled. Temkin's readable proof explicitly invokes it for the flat finite-type domain-algebra step. No certification of the unread primary text is claimed, and no new source request was made.

## Source issues

- **Misprint** in temkin17 at Lemma 2.3.2, printed p. 104: the source says tensor factors are indexed by isomorphism classes of valued extensions with fixed underlying field; it should be distinct prolongations on that field; affects a stated result.
- **Error** in temkin17 at §2.4.6(4), printed p. 108: the source says arbitrary valued fields admit the stated quotient and semidirect-product formulation; it should be restricted to normal wild inertia, or replaced by a subgroup factorization; affects a stated result.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112: the source says the relevant prime equals the coarse residue characteristic; it should be the final residue characteristic exponent, including mixed-characteristic composites; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112: the source says the rank-one input is Corollary 2.5.6(ii); it should be Corollary 2.5.6, which has one assertion; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), author p. 14: the source says the root-distance value is strictly above the threshold; it should be at least the threshold, as in the statement; affects nothing.
