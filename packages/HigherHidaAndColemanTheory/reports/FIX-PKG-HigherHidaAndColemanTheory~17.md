# Repair report — FIX-PKG-HigherHidaAndColemanTheory~17

One review, one finding. Edited: `packages/HigherHidaAndColemanTheory/README.md` (§§5.2, 5.3, 6.2 and one new source issue) and `packages/HigherHidaAndColemanTheory/sources.toml` (locators and `cited_for` of BP-Coleman). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P1) — applied

"the s-th power of T^± … acts potent compactly", finite slopes extracted for it → an iteration exponent `j≥max(1,s)`: the j-th power acts and is potent compact, slope cutoff h becoming jh, the result independent of j. Allowed pairs unchanged (s≥0 kept). New negative-control Check at j=0; source issue E18. (The letter j is used because S already names the set of bad primes in §§3.8 and 6.10.)

**Verification.** The finding is right.

- BP-Coleman line 5065 (Corollary 5.3.8) and lines 5216 and 5227 (Definition 5.4.10) take `m,n,s∈ℤ_≥0`; line 5240 (Theorem 5.4.12) asserts a potent compact action of `T^s`.
- BP-Coleman line 5069 proves Corollary 5.3.8 by applying Corollary 5.3.4 with `T^s` as the operator. Corollary 5.3.4 (line 4963) is stated under the hypothesis of Proposition 5.3.2 (line 4937), which is that the operator is potent compact. For s=0 the operator is the identity, so the hypothesis is not met.
- BP-Coleman line 1057: compactness in the pro-category is a factorization through a compact map of Banach complexes. The identity of a supported complex with infinite-dimensional cohomology has no compact power.
- The witness is an allowed pair of the README: for U=B(0,−1), Z=B(cl 0,cl 0) and m=n=s=0, the four inclusions read `U∩B(0,cl 0)⊂Z∩U⊂B(0,cl 0)` and `B(0,cl 0)⊂U⊂B(0,−1)`, all true. This is the s=0 case of the standard-pair bullet.

**Why the repair is sound.** A tube shrinks when either depth grows, and the upper bounds do not involve s, so a witness (m,n,s) gives the witness (m,n,j) for every j≥s. For + : `U∩B(m,cl(n+j))⊂U∩B(m,cl(n+s))⊂Z∩U` and `B(m+j,cl n)⊂B(m+s,cl n)⊂U`; the − case is the same with the roles exchanged. For j≥1 the j-th power is potent compact on the diamond of (U_m,Z_n) by BP-Coleman Theorem 5.3.7 (line 5046), so Corollary 5.3.4 applies. Independence of j: for j′≥j the comparison map into `RΓ_(Z_n∩U_(m+j′))(U_(m+j′))` is the one for j followed by a restriction map of the infinite diamond, an isomorphism on finite-slope parts (line 5047).

**The same pattern elsewhere.**

- §5.2: construction paragraph, proof route, both standard-pair bullets, the potent-compactness API bullet.
- §5.3: statement and proof route.
- §6.2: the comparison sentence, the compactness sentence, the first API bullet and the GL₂ Check. BP-Coleman Definition 6.4.7 (lines 7307, 7316) has the same `s∈ℤ_≥0`; Theorem 6.4.8 (line 7325) already takes the power sufficiently large, so only the notation changed there.
- §§5.4a, 6.3, 6.6a and 7.1 speak of "the potent compact operator" or "the chosen power of t" without the letter s and needed no change.
- The rootless Check of §5.2 (identity of F for N=1, t=1) stays true: the space is finite-dimensional, and j=1 gives the same operator.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Inclusions persist from s to j≥s | + and − definitions; s=0→j=1; s=1→j=2 | + : lower bounds `B(m,cl(n+j))`, `B(m+j,cl n)` shrink, upper bounds `B(0,cl(Cn))`, `B(Cm,−1)` fixed; − : `B(cl(m+j),n)`, `B(cl m,n+j)` shrink | holds | stated in §5.2 |
| j-th power potent compact for j≥max(1,s) | GL₂, w=id, p=3, depth-zero standard pair, j=0, 1, 2 | j=0: identity of O(U), eigenvalue 1 on spans of dimension 3, 6, 12, not compact; j=1: model f(z)↦f(3z), eigenvalues 1, 3, 9, slope ≤2 block of dimension 3; j=2: f(z)↦f(9z), eigenvalues 1, 9, 81 | false at j=0, true for j≥1 | j≥1 required; Check added |
| Slope cutoff h ↔ jh | same model, j=1 and j=2, h=2 | j=1: slopes 0, 1, 2 ≤2; j=2: slopes 0, 2, 4 ≤4; both give span(1,z,z²) | independent of j | stated in §§5.2 and 6.2 |
| Standard pair of depth s has exponent max(1,s) | s=0, s=1 (C=2 Check) | s=0: (0,0,1) gives `B(1,cl 0)⊂U=B(0,−1)`, `U∩B(0,cl 1)=U⊂Z`; s=1: unchanged, j=1 | holds | bullets extended |
| Rootless case | N=1, t=1, j=1 | every B is X; operator is the identity of F, finite rank, finite-slope part F | holds | none |
| O(U) infinite-dimensional in the Check | period z=3 (in U), z=1/3 (outside U) | v_3(3)=1>0; v_3(1/3)=−1, not moved into v_3>0 by an Iwahori-type level; Riemann–Roch function with poles at one point outside U | U nonempty and not a whole component | used in the Check |
| §6.2 compactness "for j large" | BP-Coleman Theorem 6.4.8 | source takes the power sufficiently large; j=0 excluded by j≥max(1,s) | consistent | notation only |

## Checks

- Elaboration of `packages/HigherHidaAndColemanTheory/Suggested.lean` with `lake env lean`: exit 0, no output. The file is unchanged and declares nothing (its docstring says which headlines are not statable), so there is no declaration to `#check` and no signature to compare.
- Direction check: `depcheck: 245 roadmaps, 2226 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- No gate failure was listed for this round.

## For the maintainer

- No section, target or name was added, removed or renumbered; no supplier citation and no gap changed. Other roadmaps citing §§5.2, 5.3 or 6.2 are unaffected: the class of allowed pairs and the finite-slope cohomology are the same.
- Source issue E18 records the correction to BP-Coleman (Corollary 5.3.8, Definition 5.4.10, Theorem 5.4.12, Definition 6.4.7). `sources.toml` gained the locators §2.4.8, Proposition 5.3.2, Theorem 5.3.7 and Corollary 5.3.8 and the `cited_for` entry for E18.
- The new Check's claim that a component meeting U has a point outside U rests on prime-to-3 Hecke correspondences permuting the components of the compactified modular curve transitively. I argued this from strong approximation and did not take it from a cited source.
- Ownership against open pull requests needed no new check: the round adds no construction.
- No source was missing; `needs-references.toml` was not written.

## Gate failure repaired

- `packages/HigherHidaAndColemanTheory/sources.toml`, source BP-Coleman: the `locator` was 1011 characters. It is now 977: two redundant spellings were merged, with no locator dropped ("Theorems 6.7.1–6.7.3 (and proofs of 6.7.1–6.7.2)" → "6.7.1–6.7.3 (and proofs)"; "6.10.1, 6.10.2(1), 6.10.2–6.10.3" → "6.10.1–6.10.3"). Nothing else changed.
