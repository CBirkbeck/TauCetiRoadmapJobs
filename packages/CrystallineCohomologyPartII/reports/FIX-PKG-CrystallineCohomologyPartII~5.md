# FIX-PKG-CrystallineCohomologyPartII~5

This round repairs the one finding of the round-4 package review (P2). The finding is correct and is fixed in `packages/CrystallineCohomologyPartII/README.md`.

These files are unchanged: `Suggested.lean`, `metadata.toml`, `sources.toml`, and the `gaps` list in `design/plan.json`. No headline statement, Lean name, source key or supplier gap was affected. Everything the repair imports is already on main, in EnhancedDerivedSheaves and SchemeAndStackFoundations, so no new gap is needed.

## F01 (P2) — applied

**Old §1.2.** It stated three things as local results:
- (a) Künneth over an affine base: RΓ(X ×^L_Y X′, O) ≅ RΓ(X, O) ⊗^L_A RΓ(X′, O).
- (b) The scheme-level comparison of W(O)[1/F] on derived and classical fibre products.
- (c) The cone of W(R) → W(π_0R) is killed by p.

It also built the derived products itself, by "Čech-glued systems".

**New §1.2.** It states only (b), for iterated derived products T = X_1 ×^L_Y ⋯ ×^L_Y X_m:
- T is taken from EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`.
- W(O_T) is built with `simplicialWitt`.
- The route checks the comparison on a basis of affine charts using `wittFrobeniusLocalization`.

(a) and (c) are no longer local results. (a) now appears in the §1.4 route, derived from the supplier, and (c) is cited from the supplier.

*Verification, at main 48ddbec.*
- `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1963` (`simplicialWitt`, §E5:animation.2) states two things. First, W(A) → W(π₀A) becomes an equivalence after Frobenius localization. Second, its fibre K is killed by p in D(ℤ). A cone is a shifted fibre, so it has the same annihilator, and old (c) is exactly this statement.
- `:2483` (`derivedSchemeBaseChange`, §E2.8) constructs derived fibre products of qcqs F_p-schemes "and their iterates", glued from spectra of animated rings. It also provides pushforward along qcqs maps and the base change Lg^\*Rf_\* ≃ Rf′_\*Lg′^\* on a derived cartesian square, for unbounded quasi-coherent K.
- Old (a) is that base change followed by the projection formula over Spec A. The projection formula is SchemeAndStackFoundations §2.18 `projectionFormula`, on main at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4132`.
- BS17 Lemma 11.43 (line 2403) is stated for an arbitrary derived F_p-scheme, and its proof reduces at once to the affine case (line 2405). So the scheme-level comparison is assembling the supplied affine equivalence on charts, which is what §1.2 keeps.

*The same pattern elsewhere, also repaired.*
- **§1.4** was the only consumer of (a). Its route now proves the r-fold Künneth formula by induction:
  - one step of `derivedSchemeBaseChange` along a classical factor g: X_r → Y;
  - then `projectionFormula` for g.
  - Its Needs line now adds `derivedSchemeBaseChange`, §2.18 `projectionFormula` and §E1.4.
- **§1.4 step for n ≥ 3** was "induction in the same way". It now spells out the pasting through the identity Z ×_Y X^{n−1/Y} = E^{n−1/Y}.
- **Scope and ownership** now names EnhancedDerivedSheaves as the owner of these objects.
- **Supplier contracts:**
  - EnhancedDerivedSheaves gains `derivedSchemeBaseChange`, with what is assumed of it, and the content of `simplicialWitt`/`wittFrobeniusLocalization`, including p-annihilation.
  - SchemeAndStackFoundations gains §2.18 `projectionFormula`.
  - `frobenius_zero_on_positive_homotopy` is now cited nowhere, so it was dropped from the contract and the dependencies.
- **Layer 1 Dependencies** and **How to read the build** were updated to match.
- Source locator: BS17's n = 2 case of Lemma 11.45 is on p. 53 (BS17 lines 2439–2447), not p. 52.

*Other possible duplications I searched for and left alone:*
- §0.1's tower criterion (R^i lim = 0 for towers that are acyclic and surjective on a basis): EnhancedDerivedSheaves E2.2 has Rlim theory only on replete topoi, and the Zariski topos is not replete in general. No roadmap on main owns this criterion.
- §1.1, §1.5 and §1.6 already cite EnhancedDerivedSheaves for descent and totalizations. No other local target restates an EnhancedDerivedSheaves construction.

## Adversarial pass on the changed statements

Notation in the table: A = coordinate ring of Y; k perfect, per Conventions.

| Statement | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.2, comparison W(O_T)[1/F] ≅ W(O_{T_cl})[1/F] | m = 1 | T = X_1; the map is the identity | holds; recorded in the hypotheses paragraph |
| same | A = k[t], X_1 = X_2 = Spec k (t ↦ 0) | π_0R = k, π_1R = Tor_1 = k; π_1W(R) = ∏_ℕ k, killed by F (Frobenius is 0 on π_1R); both sides W(k) in degree 0 | holds; Check |
| same, before inverting F | same example | fibre of W(R) → W(k) has π_1 = ∏_ℕ k ≠ 0, so it is not an equivalence; p kills it, so it dies after ⊗ℤ[1/p] | F-inversion is essential; negative-control Check |
| same, flat factor | m = 2, X_1 = A¹_Y | Tor_{>0} = 0, so T = T_cl and the map is the identity before inverting F | holds; Check restricted to m = 2 |
| same, flat factor, m = 3 | X_1 = A¹_Y, X_2 = X_3 = Spec k over k[t] | π_1(k[t,s] ⊗^L k ⊗^L k) = k[s] ≠ 0 | one flat factor does not make T classical; added to the Check |
| same | Y = ∅ (A = 0) | T = ∅, both sides 0 | holds |
| same, non-separated X_j | doubled-origin line over Spec k, m = 2 | the route checks equivalence on a basis of affine charts and basic opens, so no Čech cover with affine overlaps is used | holds; this is why the route now works at the sheaf level and not through Čech complexes |
| §1.4 step 2, RΓ of an r-fold derived product = ⊗^L_A of the RΓ(X_j, O) | r = 1 | identity | holds |
| same | A = k[t], X_1 = X_2 = Spec k | k ⊗^L_{k[t]} k has H^{−1} = H^0 = k; classical product Spec k has RΓ = k only | holds; new Check (derived ≠ classical) |
| same | X_1 = P¹_A, X_2 = Spec k at t = 0 (flat) | RΓ(P¹_k, O) = k = A ⊗^L_A k | holds |
| same | X_1 = Bl_0 A², X_2 = origin, A = k[x,y] | RΓ(X_1, O) = A (H^1 = 0), so the right side is A ⊗^L_A k = k. On the left, π_0 = O_E with E ≅ P¹, and the chart Koszul computation gives locally π_1 ≅ O_E, a line bundle. For the totals to agree it must be acyclic, which forces O_E(−1) | consistent; non-flat, non-Tor-independent case |
| same | X_1 = ∅ | 0 = 0 ⊗^L … | holds |
| §1.4 n ≥ 3 pasting | identities of fibre products | E ×_Y X^{n−1/Y} = X^{n/Y} ×_Y Z = E^{n/Y}; Z ×_Y X^{n−1/Y} = E^{n−1/Y}; pasting two cartesian squares Y→X^{n−1}, Z→E^{n−1} and X^{n−1}→X^n, E^{n−1}→E^n gives Y→X^n, Z→E^n | holds; route spelled out |
| Supplier contract, animated rings | ordinary A, B, C | π_\*(B ⊗^L_A C) = Tor_\*^A(B, C); π_0 is a left adjoint, so π_0 of an iterated product is the ordinary tensor | qualified "for ordinary rings", as in the supplier's own text |

## Checks run

- **Elaboration.** From the content checkout I ran `lake env lean packages/CrystallineCohomologyPartII/Suggested.lean` (the file is unchanged). It exited 0. The only warnings were `declaration uses 'sorry'`, at lines 74, 90, 102, 124 and 157. All `TauCeti.*` object files were present, so nothing was built.
- **Signatures.** I put `#check @name` for all eight declarations in one scratch file and elaborated it once (exit 0). I compared each elaborated type, after normalising whitespace, with the recorded `signatures.md`. All eight are identical, and no binder was lost. The README statements of §§6.4, 6.6, 6.9, 6.10 and 6.14 still match, and no change was needed.
- **Dependency gate** (`gate --depcheck … --movable`), output verbatim. It has no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

- **Citation resolver** (`roadmaps resolve`) after the edits: no cross-roadmap citation and no Lean name found nowhere. `derivedSchemeBaseChange`, `simplicialWitt`, `wittFrobeniusLocalization` and `projectionFormula` all resolve on main.

## Notes for the maintainer

- **Gate failure `tex=6`.** Six TeX-style brace sub/superscripts stood outside code spans in the new §1.2 and §1.4 text. Each is now inside backticks, with the mathematics unchanged: `i_*W(O_{T_cl})[1/F]` (§1.2 statement), `R = k ⊗^L_{k[t]} k` and `π_1R = Tor_1^{k[t]}(k, k) = k` (§1.2 Check), `W(O_{T_cl})` (§1.2 Check), `RΓ(X, O)^{⊗(n−1)}` (§1.4 step 4), and `RΓ = k ⊗^L_{k[t]} k` (§1.4 Check). No `_{`, `^{`, `\(`, `\[` or `$` is left outside a code span in the README. I re-ran the dependency gate afterwards, and its output was unchanged: `depcheck: 236 roadmaps, 2143 edges, 0 problem(s)`. `Suggested.lean` was not touched, so it was not elaborated again.
- **Ownership.**
  - I checked ownership against open pull requests using `roadmaps grep` over main and the indexed open heads. The search covered BS17 Lemmas 11.43 and 11.45, Remark 11.44 and Proposition 11.41, and the simplicial Witt functor.
  - The open revisions of EnhancedDerivedSheaves (#1330, #1630) carry the same `simplicialWitt` target. The citation is to main, which is earlier than every open head, so it does not depend on those revisions.
  - SchemeAndStackFoundations' citation of BS17's proof of Proposition 11.41 is the finite-type Frobenius factorization. That is already the declared gap `qcqs-frobenius-factorization`, unchanged.
- **Names.** No name that other roadmaps cite was changed, and the §1.2 heading is unchanged. §1.2 now has one statement where it had three parts, and no other roadmap cites the parts (a) or (c).
- No source text was copied, and no new source or `needs-references.toml` entry was required.
