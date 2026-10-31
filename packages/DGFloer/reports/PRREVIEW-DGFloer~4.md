# Review of DGFloer (pull request #963 at 6ee2897)

**Verdict:** needs changes

Full re-review of the folder (157 lines changed since `b60bf24`, the head the previous review read; nothing outside the folder changed). The five commits since then repair five of the nine previous findings in full (the Lean form of Lemma 3.41, the commit-pinned links, the five end theorems, the Cayley plane's exclusion, the SmoothBundlesConnections edge), leave four unrepaired (the supplier cycle, the ImplicitAtlases edge, two supplier labels absent from main, the README shape and the manifest), and introduce two new defects: the Cayley plane passage re-plans the octonions and the Albert algebra that LieHighestWeight Layer 8 states on main and the Cayley plane carrier that StringOrientation S1.5 states, and Theorem G drops the closedness of `Y`. A newly readable copy of Hutchings' lecture notes shows that the Layer 7.C page locators point into pages the notes do not have. The gate still fails (`depcheck = 4`), so the folder cannot be accepted at this head.

## R01 (P1) — Supplier cycle DGFloer → TangentialBordism → StringOrientation → DGFloer, and through HomotopySpheres

*Carried: r3 R02, r2 R01, not repaired.* **Location:** `TauCetiRoadmap/DGFloer/README.md:53` ("HomotopySpheres Stage 4A–4B supplies stable real Bott periodicity"), `:90` ("TangentialBordism B5/B6.3 supply Thom/PT/rational bordism inputs"), `:91`, `:168` ("**Tangential bordism.** B5/B6.3 supplies structured PT"), `:169–175` ("**Homotopy spheres.** Stage 3A … Stage 3B item 3 … Stage 4B items 2–5 … Stage5").

**Claim:** TangentialBordism and HomotopySpheres are suppliers of this roadmap.

**Witness:** The dependency check at this head prints `CYCLE among: DGFloer, HomotopySpheres, StringOrientation, TangentialBordism`. At its open head, `TangentialBordism/README.md:143` consumes DGFloer Layer 1 items 2–3 and `:142` consumes StringOrientation S1.3–S5.3; `StringOrientation/README.md:52`, `:214`, `:298`, `:317`, `:340` consume DGFloer Layer 1 item 2 and Layer 11 item 3; `HomotopySpheres/README.md:1203` consumes TangentialBordism B3.2. This README consumes TangentialBordism (`:90`, `:168`) and HomotopySpheres (`:53`, `:91`, `:169–175`), closing both cycles. The headers at `:161`, `:168`, `:169` were changed from the roadmap names to "Implicit atlases", "Tangential bordism", "Homotopy spheres", which the scanner no longer reads; the consumption is unchanged, and lines 53, 90, 91 still carry the names.

**Repair:** As in the two previous rounds: move the consumers of TangentialBordism and HomotopySpheres (Layer 10 item 5's multiple realization, Layer 11 items 2–3's James ring and stable Bott input, Layer 1 item 5's extension of the Stage 5 collapse, the Stage 3A convenient-space comparison of the mapping-space convention) into a "DGFloer Part II" placed after TangentialBordism, StringOrientation and HomotopySpheres, so that the base roadmap names neither; what the base roadmap needs of them and nobody earlier owns (the Pontryagin–Thom collapse data, the James computation of `H_*(ΩSⁿ)`) is stated here as a target. Test: the check prints no `CYCLE` line and TangentialBordism B4.2's citation of Layer 1 items 2–3 still resolves. Spelling a roadmap's name as two words is not a repair.

## R02 (P2) — The Cayley plane passage re-plans the octonions and Albert algebra of LieHighestWeight Layer 8 and the carrier of StringOrientation S1.5

*New at this head (the repair of r3 R06).* **Location:** `TauCetiRoadmap/DGFloer/README.md:1085–1092`: "No roadmap owns the octonions, the Albert algebra or `F₄`, so build the bounded carrier here. Construct the octonions by Cayley--Dickson doubling of `ℍ`, prove the norm is multiplicative and that the algebra is alternative, and form the real vector space `J` of Hermitian `3×3` octonionic matrices … homogeneous under the automorphism group `F₄` of `J` with stabilizer `Spin(9)`".

**Claim:** Nobody owns the octonions, the Albert algebra or `F₄`; this roadmap constructs them.

**Witness:** On main, `RepresentationTheory/LieHighestWeight/README.md:1255–1275` ("The compact real algebra suppliers") constructs `TauCeti.DivisionOctonionReal := TauCeti.CayleyDickson (Quaternion ℝ)` with the alternative, flexible and Moufang identities and the multiplicative positive-definite norm; `:1332–1345` ("The formally real Albert supplier") constructs `compactAlbertAlgebra`, the Hermitian `3×3` matrices over them with the Jordan product `½(AB+BA)`, trace and determinant; `:1402–1407` gives the compact real type-`F₄` Lie algebra and assigns "the fixed-carrier trace-one-idempotent geometry, its compact automorphism group and F4/Spin9 projective-plane comparison" to TangentialBordism B3. At the open heads, `StringOrientation/README.md:435–447` (S1.5) defines `OP²` as the trace-one idempotents of `J₃(𝕆)` taken from LieHighestWeight Layer 8, `F₄` as the automorphism group, proves the transitive action with isotropy `Spin(9)` and the closed smooth 16-manifold `F₄/Spin(9)`; `TangentialBordism/README.md:2053–2062` (B3.6) consumes it. At the pin the Tau Ceti tree has only the split carriers `TauCeti.Octonion` (`TauCeti/Algebra/Octonion/Basic.lean:123`) and `TauCeti.AlbertAlgebra` (`TauCeti/Algebra/AlbertAlgebra/Basic.lean:104`), so the compact octonions and Albert algebra are LieHighestWeight's targets, not library facts. The sentence quoted above is false, and the octonion and Albert constructions duplicate a roadmap on main. StringOrientation and TangentialBordism are later in the merge order and consume this roadmap, so they cannot be cited here; the Cayley plane carrier itself may move down to this roadmap, but then the move must be stated, not a claim that nobody owns it.

**Repair:** Replace the construction of `𝕆` and `J` by "Consume LieHighestWeight Layer 8's compact real algebra suppliers: the division octonions `TauCeti.DivisionOctonionReal` with their multiplicative norm and alternativity, the formally real Albert algebra `compactAlbertAlgebra` with its Jordan product and trace form, and the compact real `𝔣₄`", keep as this roadmap's own targets exactly what nobody earlier states and Proposition 6.39 needs (the trace-one idempotent manifold with its `F₄`-invariant metric, the totally geodesic octonionic lines, the closed geodesics, the Morse–Bott data of `Ω_p𝕆P²`, `Σ_p`, `σ_p`, `φ`), and add to `## Scope and ownership` one sentence: this roadmap owns the Cayley plane carrier and its rank-one Riemannian geometry because StringOrientation S1.5 and TangentialBordism B3.6, which also state the `F₄/Spin(9)` carrier, are later in the merge order and consume this roadmap; its cohomology ring, characteristic classes and String structure stay with StringOrientation S1.5. Recorded for the board: S1.5 and B3.6 then cite this roadmap for the carrier, or the carrier moves with the Part II of R01. Test: `grep -n "No roadmap owns"` returns nothing, and the mathematics of lines 1092–1109 (verified below) is unchanged.

## R03 (P2) — `UPWARD` line for ImplicitAtlases

*Carried: r3 R03, partly repaired (the SmoothBundlesConnections line is gone: that roadmap is on main now, `SmoothBundlesConnections/README.md:421` B1.4).* **Location:** `TauCetiRoadmap/DGFloer/README.md:161` ("**Implicit atlases, V0–V6.**"), `:1389` ("Apply ImplicitAtlases V0–V6 on these actual inputs"), `:1917`.

**Witness:** The check prints `UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1917]`. ImplicitAtlases at its open head does not cite DGFloer upward (`ImplicitAtlases/README.md:25`, `:853` list DGFloer as a consumer of V0–V6), so there is no cycle; the line arises because a roadmap on main is placed before every open pull request. As in the previous round, I read it as a placement artifact the board must settle, and record it because the gate rule makes every `UPWARD` line a finding.

**Repair:** None in the text if the board confirms the placement reading; otherwise 7.C.5c's virtual application moves with R01's Part II.

## R04 (P2) — Supplier labels that do not exist on main: HeegaardFloer F2.6c1 and the GeometricTopology Layer 3 restriction bundle

*Carried: r3 R04, partly repaired.* **Location:** `TauCetiRoadmap/DGFloer/README.md:82` ("HeegaardFloer F2.6c1 owns the product J and native holomorphic projection, integral degree-one/area comparison and slice-image classification in [Σ]×[z₀]"), `:853` ("consume GT Layer3's … compact-embedding restriction bundle onto the actual Diff orbit").

**Witness:** F1.4 and F1.5 now exist on main (`HeegaardFloer/README.md:1941` "3.4 Maslov and Conley–Zehnder conventions and determinant lines (F1.4)", `:1982` "3.5 Cauchy–Riemann Riemann–Roch and weighted ends (F1.5)"): that part is repaired. `grep -c 'F2\.6c1'` on main's `HeegaardFloer/README.md` returns 0; the lane is F2.6c, "4.6c Energy and compactness" (`:2461`), whose product-J statement (`:2702–2704`) identifies class-A curves by constant torus projection and degree-one sphere projection in a torus-times-sphere setting, not the general closed source `Σ` with the slice classification in `[Σ]×[z₀]` attributed to it here. Main's `GeometricTopology/README.md:360–406` (Layer 3) has `Diff(M)` as a topological group, continuous families and `O(n+1) → Diff(Sⁿ)`; it has no restriction map from embeddings onto a `Diff` orbit (Palais's local triviality is in this README's own Layer 1 sources, `:864–865`, and `:191` lists the evaluation bundle as owned here).

**Repair:** Cite F2.6c and state in one clause which part of the product-J classification it supplies and which part (general closed `Σ`, slice images) is declared as a gap `What HeegaardFloer must provide (gap:<slug>)` or owned here; for the restriction bundle, drop the attribution to GT Layer 3 and state the Palais local-triviality theorem as the target of Layer 1 item 6 that it already is (or declare `gap:embedding-restriction-bundle` on GeometricTopology). Test: every label cited at `:82` and `:853` resolves to a heading on main.

## R05 (P2) — Theorem G drops the closedness of `Y`

*New at this head.* **Location:** `TauCetiRoadmap/DGFloer/README.md:1722–1723`: "an embedded sphere `X` of dimension `k ≥ 2` and an orientable `(n−k)`-submanifold `Y` with trivial normal bundle, meeting `X` transversely in one point".

**Claim:** Theorem 7.1 holds for any orientable `(n−k)`-submanifold `Y` with the listed properties.

**Witness:** `bdho-floer` (arXiv 2404.07953v3) line 5357, printed p. 123: `Y` is a *closed* orientable `(n−k)`-submanifold; the intro's Theorem G (line 380) likewise lists `Y` among the standing assumptions of a closed manifold. Without closedness the hypothesis "`π∘φ : S → Y` of degree `d ≠ 0`" has no meaning: for `Y` open, `H_{n−k}(Y; ℤ) = 0` and no fundamental class exists, so the homological degree convention of Layer 10 item 5 (`(π∘φ)_*[S] = d·[Y]`) is vacuous. Instance: `Q = S² × S²`, `X = S² × {q}`, `Y = {p} × (S² ∖ {q'})` with `q' ≠ q`: all stated hypotheses hold (`Y` contractible, trivial normal bundle, one transverse point), and no `S`, `φ` has a degree.

**Repair:** Write "a closed orientable `(n−k)`-submanifold `Y`". Test: the instance above is excluded, and `Q = Q′ ♯ (S^k × Y^{n−k})` with `Y` closed and `(2k−2)`-connected (the source's Example 7.4) still satisfies every hypothesis.

## R06 (P3) — Hutchings locators point into pages the notes do not have

*New at this head (the text became readable).* **Location:** `TauCetiRoadmap/DGFloer/README.md:88` ("Hutchings physical p106"), `:1852–1856` ("Hutchings pages74–85: action, capped indices and variational equation", "pages86–88", "pages89–93", "pages94–95", "pages96–101: classical Floer, autonomous symmetry, PSS/Novikov and Arnold applications"), `:1884` ("Layer7.C treats … pages74–101, especially96–101").

**Claim:** Hutchings' 2002 lecture notes contain, on pages 74–101 and 106, the capped action, capped indices, variational equation, PSS/Novikov comparison and Arnold applications that Layer 7.C and Section 7.T are built against.

**Witness:** The only legal copy I found, `hutchings-2002` (the sources cache's OCR text of the December 15, 2002 version, 63 pages), has its table of contents at lines 55–86 (Chapter 7 "Morse theory for circle-valued functions and closed 1-forms" with 7.5 Reidemeister torsion p. 52 and 7.6 "Periodic orbits and the zeta function" p. 55; Chapter 8 "What we did in the rest of the course, with references" p. 58) and ends with the references at line 1972, printed p. 60–63. All Floer material is the topic list of §8.2 (lines 1926–1963, printed pp. 58–59): the Arnold conjecture for monotone manifolds, Floer homology with Novikov rings and the Piunikhin–Salamon–Schwarz isomorphism are named with references and no statement. The notes have no page 74, 96 or 106. A September 11, 2002 draft (the version cited) written during the course cannot be longer than the December version.

**Repair:** Replace the Hutchings page locators by locators into the primary sources that state the material (Salamon, *Lectures on Floer homology*, by section; Piunikhin–Salamon–Schwarz 1996 by section; Hofer–Salamon, *Floer homology and Novikov rings*, for the Novikov coefficients; Floer–Hofer–Salamon 1995 stays `uncertified` behind its DOI), and cite Hutchings only as §8.2, a pointer to that literature, or for §§7.2–7.6 (Novikov rings, torsion, zeta function) where the notes do state things. Test: every locator in `:1852–1856` names a theorem or section that exists in the cited text.

## R07 (P3) — README shape: no target subsections, `*Needs:*` lines, Checks, Examples or Dependencies

*Carried: r3 R08, r2 R11, r1 R14, not repaired.* `grep -c 'Needs:'` = 0, `grep -c 'Checks\.'` = 0, no `### Examples` or `### Dependencies` heading; the new "Check:" clauses at `:1550`, `:1613`, `:1621`, `:1655`, `:1728` are the right content in the wrong form. Also `:49` ("**The finite-rank and compact-Lie applications of §§6.4.3–6.4.4 are in scope.**") is a bullet of the list introduced at `:43` as "Out of scope". Repair as in r2 R11, and move the `:49` bullet to the in-scope paragraph.

## R08 (P3) — No `sources.toml`

*Carried: r3 R09, r2 R12, r1 R17, not repaired.* The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and main's generated `PROGRESS.md`, `STATUS.md`. The roadmap cites sixteen works and records none; the Hutchings misattribution of R06 is what a manifest with `fetched_from` and page counts prevents. Repair as in r2 R12.

## R09 (P3) — Lean names absent from the README, and a definition no headline needs

*New at this head.* **Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:110–115` (`totalGrading`), and the README as a whole.

**Witness:** Of the nine declarations, only `twistedDifferential` occurs in the README (`:1751`); `hurewiczOne`, `mod2Vanishing`, `aspherical_iff_homology_loopSpace_loopSpace`, `exists_eilenbergMacLane`, `TwistingCocycle`, `gradingInvolution`, `totalGrading`, `twistedDifferential_sq` occur nowhere in it (`grep -c` = 0 for each). `totalGrading` is a `def` used by no theorem of the file (`twistedDifferential_sq` does not mention it), so it is not a definition a headline needs.

**Repair:** Delete `totalGrading` from `Suggested.lean` (the README's Layer 4 item 2 keeps the total degree); add the backticked names at the README statements they formalize (Layer 1 items 1 and 4, Layer 10 item 4, Layer 4 items 1–2). Test: every name declared in the file occurs in the README, and the gate's `readme-ids-missing` stays 0.

## R10 (P3) — A ResearchGate link

**Location:** `TauCetiRoadmap/DGFloer/README.md:1702` ("[Crowley–Schick–Steimle, proof of Lemma2.2](https://www.researchgate.net/…) (arXiv:2012.13634v1)"). ResearchGate hosts user-uploaded copies and is in no legal source class of this project; the arXiv identifier already given is the citation. Repair: link `https://arxiv.org/abs/2012.13634` and drop the ResearchGate URL.

## Previous findings

- r3 R01 (Lemma 3.41 false in Lean) — repaired: `Suggested.lean:60–68` now has `[PathConnectedSpace Q]` on both sides and `PathConnectedSpace (LoopSpace (LoopSpace Q q) (Path.refl q))` on the right; `README.md:1626` says the same. True for every path-connected `Q` (table below).
- r3 R02 (cycle) — not repaired (R01 here).
- r3 R03 (`UPWARD` ImplicitAtlases, SmoothBundlesConnections) — partly repaired: SBC is on main; IA remains (R03 here).
- r3 R04 (HeegaardFloer labels, GT restriction bundle) — partly repaired: F1.4, F1.5 exist on main; F2.6c1 and the GT restriction bundle do not (R04 here).
- r3 R05 (end theorems by number only) — repaired: Theorem 3.49 (`:1543–1552`), Theorems L and M (`:1608–1623`), Theorem H with the definition of abundance (`:1648–1655`), Theorem G (`:1721–1729`) are stated with hypotheses and checks; all agree with the source except the dropped "closed" (R05 here).
- r3 R06 (Cayley plane excluded) — repaired as to scope (`:1077`, `:1085–1109`, `:1720`, `:1808`, `:1845`), with the ownership defect R02 here; the mathematics of the passage is correct (table below).
- r3 R07 (commit-pinned links) — repaired: gate `blob = 0`; the remaining links are relative paths on main or arXiv.
- r3 R08 (shape) — not repaired (R07 here).
- r3 R09 (`sources.toml`) — not repaired (R08 here).

## Verified sound

**Gate.** My rerun of the dependency check printed exactly:

```text
UPWARD: DGFloer (on main) -> HomotopySpheres (#63) at README lines [53, 91]
UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1917]
UPWARD: DGFloer (on main) -> TangentialBordism (#8) at README lines [90]
CYCLE among: DGFloer, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 205 roadmaps, 1434 edges, 4 problem(s)
```

The worker's gate: `depcheck = 4`, `build = 1`, every other scanner zero (`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `imports`, `stray-files`, `outside-folder`, `readme-ids-missing` all 0). The `build` entry is the toolchain's "imports `Mathlib` … consider adding `module`" notice: `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` from the worktree prints only the five `sorry` warnings (lines 39, 48, 60, 72, 145) and nothing else. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.

**Elaboration, signatures, padding.** A scratch copy with `#check @name` for all nine declarations elaborated; every type agrees with the worker's `signatures.md`. The three "dropped" binders (`IsScalarTower R Aᵐᵒᵖ M`, `DecidableEq P`, `GradedSMul`) are not mentioned by the types of `gradingInvolution`, `totalGrading`, `twistedDifferential`, whose bodies elaborate without them; `twistedDifferential_sq` keeps all of them. One-tactic probes on the same copy: `aspherical_iff_homology_loopSpace_loopSpace` with `simp` ("made no progress") and with `constructor <;> intro h <;> simp_all` (no progress); `hurewiczOne` with `infer_instance` (failed to synthesize); `exists_eilenbergMacLane` with `simp` (unsolved goals); `twistedDifferential_sq` with `simp [twistedDifferential]` (unsolved goals). No declaration closes in one tactic. No `set_option`, no sorried data, no `lemma`, no admitted `example`; imports are `import Mathlib` and one `TauCeti.*` module that exists at the pin.

**Source sample.** The six seeded targets (`README.md:1205`, `:1304`, `:1308`, `:1316`, `:1342`, `:1397`) are byte-identical to `5adf0f9`. Their only cited sources are Hutchings (R06: the notes do not contain the material), FHS 1995 (paywalled) and PSS 1996 (book chapter, not in the cache), so they were checked for internal consistency against 7.C.0–7.C.3a and their values recomputed (table). Locators read this round in `bdho-floer` (arXiv 2404.07953v3, cache text 139 pages): Definition 1.1 (lines 102–110, p. 5), Theorems A–C (214–255, pp. 6–7), Theorem G and its standing assumptions (380–389, p. 10), Definition 1.7 and Theorems H, I (415–436, pp. 10–11), Theorems L, M (735–758, pp. 17–18), Lemma 3.41 (2753–2771, p. 62), Theorem 3.49 (2956–2979, p. 66), Theorem 5.1 (3843–3846, p. 94), Theorem 6.4 and Proposition 6.6 (4382–4396, p. 107), Definition 6.11 and Theorem 6.12 (4517–4540, p. 110), Proposition 6.13 (4608–4616), Remark 6.19 (4792–4796, p. 115), Proposition 6.39 and its proof (5247–5300, pp. 121–122), Theorem 7.1 with its assumptions (5354–5372, pp. 123–124).

**Adversarial table.**

| Statement / location | Instances | Values on the two sides | Result |
|---|---|---|---|
| Lemma 3.41, Lean `:60–68` | `Q = ℂP^∞ = K(ℤ,2)` | left: `π₂ = ℤ`, false; right: `π₀(Ω²Q) = π₂(Q) = ℤ`, not path-connected, false | Pass (both false) |
| same | `Q = T²`; `Q = S¹` | `π_{n+2} = 0`; `Ω²Q` has `π_k = π_{k+2}(Q) = 0` for all `k ≥ 0`: path-connected and acyclic | Pass (both true) |
| same | `Q = S²`; `Q = S³` | `S²`: `π₂ = ℤ` and `π₀(Ω²S²) = ℤ`, both false; `S³`: `π₃ = ℤ`, and `Ω²S³` is path-connected with `H₁ = π₁ = π₃(S³) = ℤ ≠ 0`, both false | Pass |
| same, proof route | backward direction for arbitrary path-connected `Q` | `Ω²Q` a path-connected H-space: `π₁` abelian `≅ H₁ = 0`; simply connected and acyclic ⇒ weakly contractible (Hurewicz); `π_{k+2}(Q) = π_k(Ω²Q) = 0`, `π₂(Q) = π₀(Ω²Q) = 0` | True; the source's closed-manifold hypothesis is not needed |
| Theorem L `:1608–1617` vs source 735–739, 3843–3846 | hypotheses | `Σ ⊂ W` closed, bounds relatively compact open `U`; `𝓕` on `𝓛₀W`; `α ∈ H_*(W,∂W; i_W^*𝓕)`; `j_{U!}α ≠ 0`, `i_{W*}α = 0` ⇒ contractible almost existence near `Σ` (Def 1.1: `∃ε`, a.e. regular level in `(c−ε,c+ε)` carries a closed characteristic contractible in `W`) | Agrees (the source's §5 version has `𝓕` on `𝓛W`; either reading is fine) |
| same | `α = 0`; `W = D*Tⁿ`, `𝓕 = ℤ` | `j_{U!}0 = 0`, rejected; `SH_*(T*Tⁿ) ≅ H_*(𝓛Tⁿ)` with `i_{W*}` split injective by evaluation, so `ker i_{W*} = 0` and the criterion never fires: consistent with `Tⁿ` a `K(π,1)` | Pass |
| Theorem M `:1618–1623` vs source 753–758, 4382–4396 | hypotheses | same `𝓕`, `α`, `j_!α ≠ 0`, `i_{W*}α = 0` ⇒ `c°_HZ(W) < ∞` via `c°_HZ(W) ≤ c(α)` (Prop 6.6), then almost existence by Prop 6.3 | Agrees |
| Abundance `:1649–1653` vs source 415–423, 4517–4523 | the two conditions | (i) `j_!α ≠ 0` in `H_{*−n}(Ω²Q)`; (ii) `deg α = n ⇒ j_!α ≠ 0` in `H̃₀(Ω²Q)`; source's 6.11(ii) "`deg α > n`, or `deg α = n` and nonzero in `H₀(Ω²Q, pt)`" is the same since (i) forces `deg α ≥ n` | Agrees |
| Check `Q = Tⁿ` `:1655` | evaluation fibration | `Ω²Tⁿ`: `π_k = π_{k+2}(Tⁿ) = 0`, `π₀ = π₂ = 0`, contractible; `Map(S²,Tⁿ) → Tⁿ` weak equivalence, so `Map(S²,Tⁿ) ≃ Tⁿ`; the only degree-`≥ n` class is `[Tⁿ]` (via constant spheres), `j_![Tⁿ] = ` generator of `H₀(pt)`, zero in `H̃₀` | Correct negative control |
| Theorem H `:1653–1655` vs source 424–426, 4525–4528 | `Q = S²` | `α = σ_*[Σ′] ∈ H₃(Map(S²,S²))`, `deg 3 > 2`, `j_!α = σ_{p*}[Σ′_p] ≠ 0` in `H₁(Ω²S²)` (Remark 6.19): abundant; conclusion `c°_HZ(D*S²) < ∞` is acceptance criterion 8 | Agrees |
| Theorem G `:1721–1729` vs source 5354–5372 | hypotheses | sphere `X^k`, `k ≥ 2`; `Y^{n−k}` orientable, trivial normal bundle, `X ⋔ Y = {p}`; `ℓ = 2k−2` (`k` even), `k−1` (`k` odd); `S` closed orientable, `φ : S → π⁻¹(Y)`, `deg(π∘φ) = d ≠ 0`; conclusion on every `Σ` bounding `U ⊇ φ(S)` | Agrees except **`Y` closed** (R05) |
| same | `Q = S² × S²`, `Y = {p} × (S² ∖ {q′})` | `H_{n−k}(Y) = H₂(ℝ²) = 0`: no degree; excluded once "closed" is restored; Example 7.4 (`Q′ ♯ (S^k × Y)`, `Y` closed `(2k−2)`-connected) still admitted | R05 |
| Theorem 3.49 `:1543–1552` vs source 2956–2979 | (i), (ii) | `E²_{p,q} = SH_p(W; H_q(𝓕))`, `r ≥ 2`; (A) `H_*(𝓕)` bounded below and `SH_*(W;H_q(𝓕))` bounded below uniformly in `q`; (B) both bounded above; existence needs no bound (source proves it as a colimit of the Theorem 3.39 sequences) | Agrees |
| its Checks `:1550–1552` | `H_q(𝓕)` in `q ≥ 0`, `SH_p` in `p ≥ 0`; support on `p = −q` | first quadrant: (A) holds; the line `p = −q` with all `q` has `H_*(𝓕)` unbounded both ways, so neither (A) nor (B) | Pass |
| Cayley plane index `:1097–1098` | `k = 1, 2` | curvature `4` in the `7` directions tangent to the line (conjugate at `jπ/2`), curvature `1` in `8` normal directions (conjugate at `jπ`); all geodesics from `p` return at `π`, so multiplicity `15` at `jπ`; `ind C_k = 7k + 15(k−1) = 22k − 15`: `7`, `29` | Pass |
| Cayley plane homology `:1102–1104` | Morse–Bott cells | `C_k ≅ S¹⁵` contributes degrees `22k−15` and `22k`; `{22k−15} = {22(k−1)+7}`; so `ℤ` in `22j`, `22j+7`: `H₇ = ℤ`, `H₁₄ = 0`, `H₂₂ = ℤ`; `S⁷ × ΩS²³` has the same | Pass (the previous review's test value `H₁₄ = ℤ` was wrong; the README's is right) |
| same, consistency with `ℍPᵈ` `:1083` | `d = 1` | `ind C_k = 3k + (4d−1)(k−1)`, cells `(4d+2)(k−1)+3` and `(4d+2)k`: for `d = 1` degrees `3, 6, 9, 12, …`, matching `S³ × ΩS⁷` | Pass |
| `Σ_p`, `σ_p`, `φ` `:1105–1108` vs source 5257–5273 | dimensions | `u ∈ S¹⁵`, `v ⊥ u` in the `8`-dimensional `T_pL`: `v ∈ S⁶`; `dim Σ_p = 21`; `(σ_p)_*[Σ_p] ∈ H₂₁(Ω²)`, `β_*` lands in `H₂₂(Ω𝕆P²) = ℤ`; `Σ′_p` (fibre the equator `S⁷`) has dimension `22 = dim(Σ_p × S¹)`; source's `ℍPⁿ` case: `dim Σ_p = 4n+1`, `β_*j_!α ∈ H_{4n+2} = ℤ`, equal to twice a generator | Consistent with the source's `ℍPⁿ` proof transposed |
| Cayley plane metric `:1091` | normalization | diameter `π/2`, curvature in `[1,4]`, lines `S⁸` of curvature `4` (great circles of length `π`), cut locus of `p` a line at distance `π/2`; `ℍPᵈ`, `ℂPᵈ` at `:859` have the same | Consistent |
| Convention and application checks `:1205` (seeded) | `ℂPⁿ`, `N_C = n+1` | `HF_i^cyc ≅ ⊕_{j ≡ i+n (2N_C)} H_j(ℂPⁿ)`; `H_j = R` for `j = 0,2,…,2n`, `n+1` residues distinct mod `2(n+1)`: one copy of `R` exactly when `i+n ≡ 0,2,…,2n` | Pass |
| Tame synthesis and staged selection `:1304` (seeded) | `D exp_A(B) = ∫₀¹ e^{(1−t)A} B e^{tA} dt` | derivative of the exponential; anti-`J` `A` (`AJ+JA = 0`) gives `J(A) = e^A J e^{−A}` with `J(A)² = e^A J e^{−A} e^A J e^{−A} = −1`; tameness `ω(v, Jv) > 0` is open in `C⁰`, so a small ball stays tame | Pass |
| Tame raw sign realization `:1308` (seeded) | `(−1)^{i+j+ij}` at `j = 1`; Morse zero face | `(−1)^{2i+1} = −1`; inverse-family factor `(−1)^n` gives `(−1)^{n+1}`; `k + (k−n) + n = 2k` even | Consistent with 7.C.2a `:1260` |
| Separate finite counting budgets `:1316` (seeded) | `ω = κc₁` on `S_sph` | rigid index equation bounds `c₁(A)`, hence `E = ω(A) = κc₁(A)`; in `c₁ = 0` no bound, the cutoff stays | Pass |
| Regular true endpoint `:1342` (seeded) | constant two-marked core | `∂̄` on the trivial bundle over `S²`: kernel `TX` (`2n`), cokernel `0`; two Morse constraints at `p = q`: `W^u(p) ⋔ W^s(p)` has dimension `ind p + (2n − ind p) − 2n = 0` | Consistent with 7.C.3a `:1330` |
| Positive-monotone finite Laurent matrices `:1397` (seeded) | `Γ ≅ N_Cℤ` | `deg t = 2N_C`; `ω(t) = κN_C`, `ν(t) = −ω(t) = −κN_C < 0`; `c₁` injective on `Γ` so a homogeneous entry has one exponent | Pass |
| `hurewiczOne`, Lean `:39` | `pt`, `S¹`, `BS₃`, `BQ₈` | abelianizations `0, ℤ, ℤ/2, (ℤ/2)²` equal `H₁` | Pass |
| `mod2Vanishing`, Lean `:48` | `Y = K(ℤ/3,2)`; `Y = K(ℤ/4,2)` | `H̃_*(K(ℤ/3,2);𝔽₂) = 0` and `g ↦ 2g` bijective on `ℤ/3`; `H₂(K(ℤ/4,2);𝔽₂) = 𝔽₂ ≠ 0`, excluded, and `×2` on `ℤ/4` is not injective | Pass |
| `exists_eilenbergMacLane`, Lean `:72` | `A = 0`; `n = 0, A = ℤ/2`; `n = 1, A = ℤ` | `pt`; `ℝP^∞`; `ℂP^∞` (`π₂ = ℤ`, `π₁ = 0` included by `k = 0 ≠ 1`) | Pass |
| `twistedDifferential_sq`, Lean `:145` | Leibniz rules at the pin | `(D²f)(z) = op(d(m x z) − Σ_y (−1)^{ind x − ind y} m x y * m y z) • α = 0`; `P = ∅`, `m = 0`, `M = 0` give `D² = 0` | True |

**Pinned-library audit** (Mathlib `f6090c70`, Tau Ceti `358314d4`, the manifest of this branch):

| Declaration | File and line at the pin | Content and limitation |
|---|---|---|
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`: the Lean theorem's hypothesis plus left side |
| `TauCeti.MooreLoopSpace`, `loopChainAlgebra`, `TwistingCocycle`, `isAspherical_iff_double_singularHomology` | absent from the pinned Tau Ceti tree (`grep -r` over `TauCeti/`) | main's `STATUS.md` reports them at a later Tau Ceti commit; at the pin nothing in `Suggested.lean` duplicates the library |
| `TauCeti.Octonion`, `TauCeti.AlbertAlgebra` | `TauCeti/Algebra/Octonion/Basic.lean:123`, `TauCeti/Algebra/AlbertAlgebra/Basic.lean:104` | split carriers over a general ring; no division octonions or compact Albert algebra at the pin (R02) |
| `LoopSpace`, `HomotopyGroup.Pi` / `π_` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`, `:458`, `:461` | fixed-interval loops; the statements use `n + 1`, `n + 2` |
| `SimplyConnectedSpace` | `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` | implies path-connected and nonempty |
| `singularHomologyFunctor`, `ModuleCat.of` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | as used at Lean `:41`, `:50`, `:65` |
| `TauCeti.IsDGRightModule`, `TauCeti.IsDGAlgebra` | `DG/Module/Right/Defs.lean:68–79`, `DG/Algebra/Defs.lean:182–189` | unchanged since r2 |
| `serreFibrations`, `mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_proj_cube` | absent from the pinned Tau Ceti tree; targets of main's `AlgebraicTopology/README.md:111`, `:910–913` | cited here as supplier targets, as the Inventory `:374` says |

**Cross-roadmap citations resolved this round** (main `fa41b37`; open heads as given):

| Citation | Found at | Note |
|---|---|---|
| LieHighestWeight Layer 8 compact suppliers | main `RepresentationTheory/LieHighestWeight/README.md:1255–1275`, `:1332–1345`, `:1402–1407` | owns `𝕆`, `J`, compact `𝔣₄` (R02) |
| StringOrientation S1.5; TangentialBordism B3.6 | `rev StringOrientation/README.md:435–447`; `rev TangentialBordism/README.md:2053–2062` | both state the `F₄/Spin(9)` carrier; both later and consuming DGFloer (R01, R02) |
| HeegaardFloer F1.4, F1.5, F2.6c | main `HeegaardFloer/README.md:1941`, `:1982`, `:2461` | F2.6c1 absent (R04) |
| GeometricTopology Layer 3 | main `GeometricTopology/README.md:360–406` | `Diff(M)`, families, `O(n+1) → Diff(Sⁿ)`; no restriction bundle (R04) |
| HamiltonianReduction R1a.0–R1a.4 | main `SymplecticGeometry/HamiltonianReduction/README.md:71–89` | as in r3 |
| SmoothBundlesConnections B1.4, B6.0, B6.2, B6.3 | main `SmoothBundlesConnections/README.md:421`, `:1306`, `:1668`, `:1716` | on main now; the r3 `UPWARD` line is gone |
| CotangentLagrangian C2.0, C2.1 | main `SymplecticGeometry/CotangentLagrangian/README.md:79`, `:109` | resolve |
| RiemannianGeometry R1, R2, R3 | main `RiemannianGeometry/README.md:179`, `:300`, `:347` | resolve |
| MorseNovikov N1, N4, N6 | main `MorseNovikov/README.md:75`, `:219`, `:377` | resolve |
| MorseTheory M4, M5 | main `MorseTheory/README.md:458`, `:611` | resolve |
| GeneralizedCohomology G5; CharacteristicClasses C1.2a–b; ComplexKahlerGeometry K7 | main `GeneralizedCohomology/README.md:1373`; `CharacteristicClasses/README.md:331`, `:419`; `ComplexKahlerGeometry/README.md:1405` | resolve |
| LieGroups Layer 2, Layer 6 | main `RepresentationTheory/LieGroups/README.md:275`, `:383` | resolve |
| AlgebraicTopology `TauCeti.TopCat.serreFibrations`, Stage 5.5 | main `AlgebraicTopology/README.md:111`, `:910–913` | the carrier is AT's target |
| ImplicitAtlases V0–V6 | `rev ImplicitAtlases/README.md:91`, `:681`; `:25`, `:853` list DGFloer as consumer | no cycle (R03) |
| AnalyticStableMaps M2.0a, M3 | `rev AnalyticStableMaps/README.md` (labels present) | as in r3 |
| TangentialBordism, StringOrientation, HomotopySpheres edges | `rev TangentialBordism/README.md:142–143`; `rev StringOrientation/README.md:52`, `:214`, `:298`, `:317`, `:340`; `rev HomotopySpheres/README.md:1203` | the cycle of R01 |
| `tauceti-roadmap roadmaps resolve` | 0 cross-roadmap citations found nowhere; 3 Lean names (`serreFibrations`, `mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_proj_cube`) | AT's targets, not this roadmap's |

Ownership against open work: the Cayley plane, octonions and Albert algebra were searched by object across main and the indexed open heads (`roadmaps grep` for octonion, Cayley plane, Albert, `Spin(9)`): the owners are those of R02; McKaySkewGroup only cites Conway–Smith. r2's search for the other constructions (cubical Serre filtration, Moore loops, twisting cocycles, global flux, Hurewicz predicate) stands. HamiltonianSystems (#480) is cited as a supplier (`:158`, `:1207`, `:1224`); it is an open pull request without files in this brief, so its Layers 1–2 and 6 were not checked. Open pull requests not indexed by the tooling were not checked.

**Headline inventory.**

| Headline | Statable at the pins | In `Suggested.lean` |
|---|---|---|
| Hurewicz in degree one | yes | yes (existence form) |
| Twisted square-zero (Layer 4 item 2) | yes | yes |
| Mod-2 vanishing (1.4) | yes | yes |
| Lemma 3.41, fixed-interval model (10.4) | yes | yes, now true |
| Existence of `K(A, n)` (1.4) | yes | yes |
| Cubical and CW Serre spectral sequences, comparison, convergence | no (cubical chains, Serre carrier absent) | named in docstring |
| Fibration theorem, DG Morse/Floer homology, Theorem J, `SH` with DG coefficients, Theorem K, Theorem 3.49 | no (Moore loops, Liouville domains) | named in docstring |
| Theorems A–E, G, H, I, L, M; 7.C Arnold bound; 7.T torsion | no (Floer complexes, capacities) | named in docstring |
| `H_*(Ω𝕆P²)` (Layer 5 item 7) | no (no compact octonions or `𝕆P²` at the pin) | not named; add to the docstring list when R02 is repaired |

## Not verifiable

- **Hutchings' notes as cited**: the only copy I could read is the December 15, 2002 version in the sources cache (fetched from a university course page); it has 63 pages, so the pages cited at `:88`, `:1852–1856`, `:1884` could not be read because they do not exist in it (R06).
- **FHS 1995, PSS 1996** (7.C's remaining sources): paywalled, respectively not in the cache; the six seeded targets were checked for internal consistency only.
- **HamiltonianSystems Layers 1–2 and 6** (`:158`, `:1207`, `:1224`): open pull request #480 without files in this brief.
- **HeegaardFloer F2.6c's general-`Σ` product-J classification**: the label F2.6c1 does not exist (R04), so 7.C's product-curve attribution is unchecked against its supplier.
- **Ziller's completing-manifold perfectness for `Ω𝕆P²`** (`:1100–1101`): Ziller 1977 is not in the cache; the index and homology values were recomputed independently (table) and agree with `Ω𝕆P² ≃ S⁷ × ΩS²³`.
- **Dold's fibre-homotopy-equivalence theorem** (Layer 3 item 2's Hurewicz clause): as in r3, used without a numerable-cover hypothesis and not re-read.

## Source issues

- **Error** in bdho-floer at the proof of Theorem 5.15, printed p. 104 (lines 4322–4323): the source says the abelian groups with `G ⊗ ℤ/2 = 0` form a class in the sense of Serre; it should use the uniquely 2-divisible groups, since `ℚ` has `ℚ ⊗ ℤ/2 = 0` and its subgroup `ℤ` does not; affects the proof (the README's mod-2 vanishing theorem supplies the needed step).
- The three further issues recorded in r2 (Lemma 4.5(1) retraction, Lemma 6.35's `π₈(SO(9))`, Theorem 3.49(ii)'s coefficient system) stand as recorded there.
