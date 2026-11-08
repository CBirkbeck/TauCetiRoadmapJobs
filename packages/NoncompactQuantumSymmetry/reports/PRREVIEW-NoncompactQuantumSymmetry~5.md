# Review of NoncompactQuantumSymmetry (pull request #1015 at 70440b4)

**Verdict:** needs changes

Incremental re-review of the 53 README lines changed since 46b0fee. `Suggested.lean` and `metadata.toml` are byte-identical to that head, and nothing outside the folder changed. The gate passes every check, `lake env lean` reports only the five `sorry` warnings, and the dependency check reports no problems. Three of the five previous findings are repaired: the DNC normalizer Check, the `(𝔤_ℂ,K)`-module Check and the compact-finite supplier citation. The DNC Check and the `(𝔤_ℂ,K)`-module Check were recomputed and are now correct (rows 139–143). Two P3 findings are still open: the OperatorAlgebraDynamics revision is not named in the pull request, and the README has not been split. There is one new P3: the first `IsKFinite` Check, which tests the predicate whose supplier this change repoints, is false at the zero vector.

## R01 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, and the pull request does not name it

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`: D1.BorelPrefix at `:19`, `:96`, `:179`, `:254`, `:285`, `:303`, `:374`, `:1090`, `:1375`, `:1403`, `:1413–1414`, `:1437`, `:1439`, `:1657`, `:1679`, `:1703`, `:1990`, `:4086`; D1.TwistedBorel at `:19`, `:96`, `:1685`, `:1990`; D4.Harmonic at `:19`, `:96`, `:140`, `:165`. Also the pull request's description.

**Claim:** these citations resolve on main, or the revision that defines them merges first.

**Witness:** on main, OperatorAlgebraDynamics has only D1–D9 (`README.md:75–627`). The three ids are headings only at its open revision (`:725`, `:831`, `:1653`). The description's revision-dependency line and merge-order paragraph name only the SmoothBanachRepresentations revision.

Re-raised: R01 of the review at 46b0fee. No repair report marks it as not actionable.

**Repair:** nothing changes in the folder. Name the OperatorAlgebraDynamics revision in the description's revision-dependency line, next to the SmoothBanachRepresentations one, so that it merges first. In the same edit, the description's sentence that credits AutomorphicFormsOnReductiveGroups §2.1 with the generic finite-orbit predicates and compact Banach density should credit CompactGroups Layer 5 (`gap:banach-gfinite-density`), as the README now does.

## R02 (P3) — The trivial-representation `IsKFinite` Check is false at the zero vector and restates the definition

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:691–693`: "For the trivial representation of K on ℂ every vector is K-finite with orbit span of dimension one; `IsKFinite` agrees with the native finite-orbit-span predicate on the restricted representation".

**Claim:** every vector of the trivial representation on ℂ has a one-dimensional orbit span, and the agreement of `IsKFinite` with the restricted predicate is a test.

**Witness:** for v=0 the orbit `{π(k)0}={0}` spans the zero space, which has dimension 0. The supplier's own Check, AutomorphicFormsOnReductiveGroups §2.1 (`README.md:326`, open head), says the same. That section also defines `IsKFinite` as exactly the restricted predicate (`:302`).

**Repair:** replace the bullet with: "For the trivial representation of K on ℂ, the zero vector has orbit span 0 and every nonzero vector has orbit span ℂ. So every vector is K-finite, the K-finite vectors are all of ℂ, and the trivial type has multiplicity one. The wrong model 'orbit span of dimension exactly one' excludes 0 and is not a submodule."

Tested on the refuting instance: v=0 has dimension 0, which is finite, so 0 is K-finite. v=1 has dimension 1. The "exactly one" model fails at 0 and at 1+(−1). This Check sits in the block that tests the predicate whose supplier this change repoints (`:675`). It was not part of the previous review's row 119.

## R03 (P3) — Size

**Location:** the folder. The README has 9,183 lines (669,796 bytes). M5 (`:3564–6200`) is 2,637 lines and M6 (`:6201–9155`) is 2,955 lines.

**Witness:** the finding has not changed in substance since the last three reviews. This repair added 15 lines and split nothing.

Re-raised: R05 of the review at 46b0fee. No repair report marks it as not actionable.

**Repair:** as before. Move the all-sequence contraction tables (M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition) and the M6 pair, exchange and tree tables into "NoncompactQuantumSymmetry, Part II". Its introduction should say that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## Previous findings

- R01 — not repaired: the description's revision-dependency line still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first:" followed only by the SmoothBanachRepresentations revision. D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic are still cited at `:19`, `:96` and elsewhere (R01 above).
- R02 — repaired: `:3669–3678` now gives `w=diag(−1,1,1,−1,1)`, `Ad(w)J_(a,3)=−w_aJ_(a,3)`, and `B=−A=diag(1,−1,−1,−1)` fixing `J_(0,3)`. It says B sends `(0,0,r,r)` to its negative "while A fixes it", and that a scalar −1 is realized by no normalizing element of `SO₀(4,1)`. `:6195` matches.
- R03 — repaired: `:718–724` now uses `V=ℂ²⊗ℂ²` with `ρ⊗1` and `π(k)=ρ(k)⊗ρ(k)`. The differentiated action `ρ(Y)⊗1+1⊗ρ(Y)` differs from `ρ(Y)⊗1`, and the negated action "is not a Lie module".
- R04 — repaired: `:9`, `:95`, `:675`, `:970–977`, `:1022–1025` and `:1084` cite "CompactGroups Layer 5 (`gap:banach-gfinite-density`)" for `IsGFinite`, `gFiniteSubmodule` and `gFiniteSubmodule_dense`. They cite AutomorphicFormsOnReductiveGroups §2.1 only for `IsKFinite` and the orbit-span identification. The supplier table has the new row.
- R05 — not repaired: the README has 9,183 lines and no Part II folder exists (R03 above).

## Verified sound

**Gate and build.** I ran the gate on this head:

`gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's gate file also records `build=0`. I elaborated `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` with `lake env lean` (6.4 s). It reports `declaration uses sorry` at lines 75, 88, 100, 116 and 189 and nothing else. `git diff 46b0fee HEAD` touches only the README. `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.

**Signatures.** The five "looks dropped" leads in the worker's signature file are all `[IsClosed (H : Set G)]`. Each elaborated type shows it as `[IsClosed ↑H]` (for example `InducedModelData.exists_inducedRepresentation`), so none was lost. Every type is unchanged from the previous review. The one-tactic probe of the previous review still applies, because the file is byte-identical: no statement closed.

**Dependency check.**

`depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`

There are no UPWARD, CYCLE or moved lines. The new suppliers are CompactGroups, which is on main, and AutomorphicFormsOnReductiveGroups, which is at line 66 of the merge order against this roadmap's line 149. AutomorphicFormsOnReductiveGroups names this roadmap only as a consumer (`README.md:12`, `:1313` at its open head).

**Changed citations resolved.**

| Citation (this README) | Where it resolves |
| --- | --- |
| CompactGroups Layer 5, `gap:banach-gfinite-density` (`:9`, `:95`, `:675`, `:971`, `:1022`, `:1084`) | The gap is declared by AutomorphicFormsOnReductiveGroups (open head `README.md:52`: "What CompactGroups must provide (gap:banach-gfinite-density)"), with `IsGFinite`, `gFiniteSubmodule`, `gFinite_add/smul/map` and `gFiniteSubmodule_dense`. Main's CompactGroups Layer 5 (`TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:318`) is Peter–Weyl and does not state them. That is a declared gap, not a finding. |
| AutomorphicFormsOnReductiveGroups §2.1, `IsKFinite` and the orbit-span identification (`:9`, `:675`, `:973`, `:1024`, `:1084`) | Open head `README.md:302` ("`IsKFinite` and `kFiniteSubmodule` are abbreviations … restricted to `K`") and `:304` (the restriction is `(π.restrict K.subtype).toRepresentation`, and its orbit span is definitionally the span of `π(k)v`). The ownership table at `:308–309` gives the predicate and Banach density to CompactGroups. |
| `gFiniteSubmodule_dense` generality (`:9`, `:95`) | CompactGroups open revision `Suggested.lean:101–105`: `[CompactSpace G] [T2Space G]`, complex normed `E` with `[CompleteSpace E]`, and orbit continuity `hπ`. This is the README's "strongly continuous complex Banach representations of compact Hausdorff groups". |

**Overlap with the CompactGroups revision, recorded and not raised.** CompactGroups' open revision reuses the heading "Layer 5" for compact abelian Fourier theory (`README.md:641`). It fulfils the gap at Layer 2 §2.1 (`:411–490`) and gives no old-to-new numbering. The overlap tool lists no dropped id. This README cites the gap the way its declarer AutomorphicFormsOnReductiveGroups does, by slug and main's layer. The brief asks that a revision be cited as on main, and that revision's own review already raises the renumbering. Whichever merges second updates "Layer 5" to that revision's §2.1.

**Ownership by object for the changed passages.**
- Compact-finite predicate, submodule and density: one owner, the CompactGroups gap. AutomorphicFormsOnReductiveGroups keeps only the abbreviation and the locally convex extension, and this README restates neither. The isotypic projector with the `tr(A*B)/d_τ` multiplicity product (`:665–672`) is for infinite-dimensional unitary Hilbert representations. The CompactGroups revision §1.3 treats finite unitary decompositions only, so it is not a second owner.
- The `(𝔤_ℂ,K)`-module whose Check changed (`:705–711`): ArithmeticLocallySymmetricSpaces ALS.F.5 and `:1083` use "(𝔤,K)-modules" as coefficients without a definition target, and AutomorphicFormsOnReductiveGroups `:30` and `:316` consume them from there. This README's definition with its Checks is the only explicit one, so it is not raised. AutomorphicFormsOnReductiveGroups and ArithmeticLocallySymmetricSpaces were read through `roadmaps show`. Ownership against the other open pull requests was checked only for these objects.
- DNC objects: unchanged ownership, and no other owner was found (as at the previous review).

**Seeded sample.** None of the fifteen sampled targets lies in a changed passage. Their locations at this head: M1.Core `:1088`, M4.TypeI `:2401`, M4.SpatialLocalization `:2513`, Endpoint carrier crosswalk `:3504`, Endpoint coefficients and the named Fell comparison `:3967`, Fixed-label zero-translation rows `:5006`, Uniform lower models and the chart lemma `:5482`, Basic theory, global models and phase cuts `:6177`, Both momenta nonzero `:6445`, Past/past `:6580`, Geometry, measure and signed-circle proof `:7249`, M6.A `:7797`, M6.H `:7857`, One common measure at every subtree root `:8838`, Local overlap and grafting naturality `:8958`. None of them cites a changed passage, with two exceptions:
- M1.Core (`:1090`) cites D1.BorelPrefix, which is covered by R01.
- The block before the Endpoint coefficients target (`:3953`) uses M0 item 3's unitarization, whose content the change leaves as it was; only the predicate's supplier attribution changed.

Following the incremental brief, these targets were not re-verified against their sources. Past/past carries row 115 of the review at 46b0fee, and M6.H carries row 77 of the review at 777a2fe.

**Adversarial table.** The following rows carry forward unchanged for statements the change leaves untouched:
- rows 1–86 of the review at 777a2fe, including the five `Suggested.lean` headlines: rows 3–4 `wigner_reconstruction`, 6–9 `whitehead_one`/`whitehead_two`, 10 `exists_polishTopology_continuousSMul`, 11–16 `InducedModelData.exists_inducedRepresentation`;
- rows 87–98 of the review at 1a39856;
- rows 99–133 of the review at 46b0fee, except rows 112 and 120. Those tested the replaced Checks and are superseded by rows 139–143. Row 119 is complemented by row 138.

New rows:

| # | Statement | Instance | Values on the two sides | Result |
| --- | --- | --- | --- | --- |
| 134 | `gFiniteSubmodule_dense` as cited (`:9`, `:95`) | supplier signature against README prose | binders `CompactSpace G`, `T2Space G`, `NormedSpace ℂ E`, `CompleteSpace E`, `∀ v, Continuous (g ↦ π g v)` ⇒ `Dense (gFiniteSubmodule π.toRepresentation : Set E)`; README: compact Hausdorff, complex Banach, strongly continuous | Pass: same generality |
| 135 | compactness needed for the density input (`:675`, `:974`) | ℤ acting by shift on ℓ²(ℤ) | the shift is unitary with purely continuous spectrum, so it has no nonzero finite-dimensional invariant subspace; the finite-orbit vectors are {0}, whose closure {0} ≠ ℓ²(ℤ) | Pass: the hypothesis is needed |
| 136 | orbit-span identification (`:675`, `:973`) | `π.restrict K.subtype`; K={1} | `(π.restrict K.subtype) k v = π (↑k) v`, so both spans are `span{π(k)v : k∈K}`; K={1}: `span{v}` has dim ≤ 1, so every vector is K-finite, as in Check `:701` | Pass |
| 137 | K-finite vectors = algebraic sum of the `H_τ` (`:977`) | K={1} on L²(ℝ); `⊕_ℕ` trivial; SU(2) left regular | `H_triv=H`, sum H, K-finite H; `H_triv=ℓ²(ℕ)`, sum ℓ²(ℕ), K-finite all; matrix coefficients on both sides, `dim H_τ=(dim τ)²` | Pass |
| 138 | Check `:691–693` | trivial K on ℂ; v=0 and v=1 | `span{0}=0`: dim 0, but the Check says 1; `span{1}=ℂ`: dim 1 | Fail at v=0 (R02) |
| 139 | `(𝔤_ℂ,K)` Check `:718–722` | `V=ℂ²⊗ℂ²`, `ρ⊗1`, `π=ρ⊗ρ`, `Y=diag(i,−i)` | `[ρe⊗1,ρf⊗1]=ρh⊗1`, so V is a Lie module; `π(k)(ρX⊗1)π(k)⁻¹=ρ(Ad(k)X)⊗1`; `d/dt π(exp tY)\|₀=ρY⊗1+1⊗ρY`; the difference is `1⊗diag(i,−i)≠0`, and `1⊗ρY≠0` for every Y≠0 since ρ is faithful | Pass |
| 140 | negated action `:722–724` | standard e,f,h of sl(2,ℂ) | `[−ρe,−ρf]=ρh=diag(1,−1)`; `(−ρ)(h)=diag(−1,1)` | Pass: not a Lie module, as stated |
| 141 | DNC normalizer Check `:3669–3675` | `Q=diag(−1,−1,−1,−1,+1)`, `w=diag(−1,1,1,−1,1)` | `wᵀQw=Q`, det +1, `w₄₄=+1`, joined to 1 by rotations in the negative-definite `span(e₀,e₃)`, so `w∈SO₀(4,1)`; `we₃=−e₃` normalizes `Stab(e₃)`; `Ad(w)J_(a,3)=w_aw_3J_(a,3)` gives +1 (a=0) and −1 (a=1,2,4), so `B=diag(1,−1,−1,−1)=−A`; `B(0,0,r,r)=(0,0,−r,−r)`, `A(0,0,r,r)=(0,0,r,r)`; `Ad(A)L₀₁=A₀A₁L₀₁=−L₀₁`; `q(0,0,r,r)=−r²+r²=0`; helicity `(−ε_E)(−ℓ)ℏ/2=ε_Eℏℓ/2` | Pass: agrees with the constraint block `:4836–4855` |
| 142 | "no scalar −1" `:3675–3678` | normalizer `g=h⊕s` on `e₃^⊥⊕ℝe₃` | H fixes only ℝe₃ (it is irreducible on `e₃^⊥`), so `ge₃=±e₃` and `Ad(g)` acts on 𝔪 as `s·h`; `s·h=−I`: s=+1 gives `diag(−1,−1,−1,1,−1)` (det +1, `g₄₄=−1`, time reversal); s=−1 gives `diag(1,1,1,−1,1)` (det −1) | Pass |
| 143 | Examples `:6195` | as row 141 | B sends the representative to its negative, A fixes it, `Ad(A)J₀₁=−J₀₁` | Pass |

**Headlines and padding.** `Suggested.lean` is unchanged, so the previous review's headline audit stands. It states Wigner, the two Whitehead lemmas, the Polish realization and the induced representation on `Lp`. The docstring names the non-statable headlines with their missing carriers. There is no padding.

**Policy scan of the added lines.** None of the added lines contains LaTeX, a pull-request number, a process word or a local path. Mathematics in the added lines is in Unicode inside code spans. The changed passages add no source locator.

## Not verifiable

- No changed passage adds or changes a source locator, so this round fetched no source. The previous review's list stands unchanged:
  - Fell 1961: the DOI resolves only to a paywalled page.
  - Kechris 1995, Weibel 1994, Wallach 1988 and Knapp: books not held.
  - Bargmann 1947, Lang *SL₂(ℝ)*, Mackey 1952/1958, Parthasarathy 1969, Kostant–Rallis 1971, Iverson–Mack 1970, Aghassi–Roman–Santilli: paywalled.
  - Dooley and Grundling course notes: no legal source.
  - `GelfandNaimark1947 line 1454`: the exponent of Eq. 188 is illegible in the OCR.
- The fifteen seeded-sample targets lie outside the changed passages and were not re-read against their sources this round (see Verified sound).
- AutomorphicFormsOnReductiveGroups and ArithmeticLocallySymmetricSpaces were read only through the roadmap service at their open heads. Ownership against open pull requests whose files the brief does not provide was not checked beyond the objects listed above.

## Source issues

- none
